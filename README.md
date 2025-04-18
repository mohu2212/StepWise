<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

# StepWise

A beautiful and customizable stepper widget for Flutter applications that provides a flexible way to show progress through a series of steps.

![StepWise Demo](images/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20Max%20-%202025-04-18%20at%2007.58.41.png)

## Features

- Customizable colors for active and inactive states
- Adjustable circle radius and line thickness
- Customizable text styling
- Dotted line connectors between steps
- Responsive layout
- Support for completed, current, and upcoming steps

## Installation

Add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  stepwise: ^1.0.0
```

## Usage

```dart
import 'package:stepwise/stepwise.dart';

StepWise(
  currentStep: 2,
  steps: const [
    'Step 1',
    'Step 2',
    'Step 3',
    'Step 4',
  ],
  activeColor: Colors.blue,
  inactiveColor: Colors.grey,
  textActiveColor: Colors.blue,
  textInactiveColor: Colors.grey,
  circleRadius: 24,
  lineThickness: 1,
  fontSize: 13,
  fontWeight: FontWeight.w500,
)
```

## Customization

The `StepWise` widget provides several customization options:

- `currentStep`: The current active step (1-based index)
- `steps`: List of step labels
- `activeColor`: Color for active/completed steps
- `inactiveColor`: Color for inactive steps
- `textActiveColor`: Text color for active steps
- `textInactiveColor`: Text color for inactive steps
- `circleRadius`: Size of the step circles
- `lineThickness`: Thickness of the connecting lines
- `fontSize`: Size of the step labels
- `fontWeight`: Weight of the step labels

## Example

See the `example` directory for a complete example of how to use the `StepWise` widget.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
