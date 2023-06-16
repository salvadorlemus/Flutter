
class Question {
  String _questionText = '';
  bool _questionAnswer = false;

  Question(String q, bool a) {
    _questionText = q;
    _questionAnswer = a;
  }

  String get questionText => _questionText;
  bool get questionAnswer => _questionAnswer;
}