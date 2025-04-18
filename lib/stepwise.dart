import 'package:flutter/material.dart';

/// A beautiful and customizable stepper widget that shows progress through a series of steps.
///
/// The [StepWise] widget provides a beautiful and flexible way to display
/// progress through a series of steps. It includes customizable colors, sizes,
/// and text styles.
class StepWise extends StatelessWidget {
  /// The current active step (1-based index).
  final int currentStep;

  /// List of step labels.
  final List<String> steps;

  /// Color for active/completed steps.
  final Color activeColor;

  /// Color for inactive steps.
  final Color inactiveColor;

  /// Text color for active steps.
  final Color textActiveColor;

  /// Text color for inactive steps.
  final Color textInactiveColor;

  /// Size of the step circles.
  final double circleRadius;

  /// Thickness of the connecting lines.
  final double lineThickness;

  /// Size of the step labels.
  final double fontSize;

  /// Weight of the step labels.
  final FontWeight fontWeight;

  /// Creates a [StepWise] widget.
  ///
  /// The [steps] parameter is required and must not be empty.
  /// All other parameters are optional and have default values.
  const StepWise({
    super.key,
    this.currentStep = 1,
    required this.steps,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.textActiveColor = Colors.blue,
    this.textInactiveColor = Colors.grey,
    this.circleRadius = 24,
    this.lineThickness = 1,
    this.fontSize = 13,
    this.fontWeight = FontWeight.w500,
  }) : assert(currentStep > 0 && currentStep <= steps.length,
            'currentStep must be between 1 and steps.length');

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final itemWidth = constraints.maxWidth / steps.length;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(steps.length, (index) {
            final isCompleted = index + 1 < currentStep;
            final isCurrent = index + 1 == currentStep;
            final isBeforeCurrent = index + 1 <= currentStep;

            return SizedBox(
              width: itemWidth,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: circleRadius,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Row(
                          children: [
                            if (index > 0)
                              Expanded(
                                child: CustomPaint(
                                  size: Size(double.infinity, lineThickness),
                                  painter: DottedLinePainter(
                                    color: isBeforeCurrent
                                        ? activeColor
                                        : inactiveColor.withOpacity(0.3),
                                  ),
                                ),
                              )
                            else
                              const Spacer(),
                            if (index < steps.length - 1)
                              Expanded(
                                child: CustomPaint(
                                  size: Size(double.infinity, lineThickness),
                                  painter: DottedLinePainter(
                                    color: isCompleted
                                        ? activeColor
                                        : inactiveColor.withOpacity(0.3),
                                  ),
                                ),
                              )
                            else
                              const Spacer(),
                          ],
                        ),
                        Container(
                          width: circleRadius,
                          height: circleRadius,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                isCompleted ? activeColor : Colors.transparent,
                            border: Border.all(
                              color: isCompleted || isCurrent
                                  ? activeColor
                                  : inactiveColor.withOpacity(0.3),
                              width: 2,
                            ),
                          ),
                          child: isCompleted
                              ? Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: circleRadius * 0.7,
                                )
                              : null,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    steps[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: fontSize,
                      color: isCompleted || isCurrent
                          ? textActiveColor
                          : textInactiveColor.withOpacity(0.7),
                      fontWeight: fontWeight,
                    ),
                  ),
                ],
              ),
            );
          }),
        );
      },
    );
  }
}

/// A custom painter that draws a dotted line.
class DottedLinePainter extends CustomPainter {
  /// The color of the dotted line.
  final Color color;

  /// Creates a [DottedLinePainter] with the given [color].
  const DottedLinePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = size.height
      ..strokeCap = StrokeCap.round;

    const dashWidth = 4;
    const dashSpace = 4;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, size.height / 2),
        Offset(startX + dashWidth, size.height / 2),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
