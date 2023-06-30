import 'dart:math';

class CalculatorBrain {
  final height;
  final weight;

  double _bmi = 0;

  CalculatorBrain({required this.height, required this.weight});

  /// Calculate the BMI
  String CalculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  /// Return the result of my weight
  String GetResult() {
    _bmi = weight / pow(height / 100, 2);
    if (_bmi >= 25) {
      return "Overweight";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String GetInterpretation() {
    _bmi = weight / pow(height / 100, 2);
    if (_bmi >= 25) {
      return "You have a higher than normal body weight. Try to exercise more.";
    } else if (_bmi > 18.5) {
      return "You have a normal body weight. Good job!";
    } else {
      return "You have a lower than normal body weight. You can eat a bit more.";
    }
  }
}
