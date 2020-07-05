import 'dart:math';

class BMIBrain {
  final int weight;
  final int height;
  double _bmi;

  BMIBrain({this.weight, this.height});


  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    print('THIS IS THE INFUNCTION VALUE OF BMI: $_bmi');
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
   
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
    
  }

  String getComments() {
    if (_bmi >= 25) {
      return 'YOU HAVE A HIGHER THAN NORMAL BODY MASS INDEX. YOU NEED TO EXERCISE';
    } else if (_bmi > 18.5) {
      return 'YOU HAVE A PERFECTLY NORMAL BODY MASS INDEX. STAY FIT!';
    } else {
      return 'YOUR BODY MASS INDEX IS LOWER THAN NORMAL. YOU NEED TO EAT MORE HEALTHY FOOD';
    }
  }
}
