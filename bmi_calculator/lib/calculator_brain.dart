import 'dart:math';

class CalculatorBrain {
  int height;
  int weight;
  double _bmi = 18.0;

  CalculatorBrain({required this.height, required this.weight});
  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi > 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    }
    return 'Underweight';
  }

  String getInterpretation() {
    if (_bmi > 25) {
      return 'You have a higher than a normal body weight. Try to exercise more';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight, Good job!';
    }
    return 'You have a lower than normal body weight, You have to eat a bit more.';
  }
}
