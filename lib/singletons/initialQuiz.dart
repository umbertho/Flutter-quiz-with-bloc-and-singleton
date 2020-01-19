import '../models/data_schemes/initial_test_scheme.dart';
import '../models/data_values/initial_test_values.dart';

class InitialQuizSingleton {
  static final InitialQuizSingleton _singleton =
      new InitialQuizSingleton._internal();

  factory InitialQuizSingleton() {
    return _singleton;
  }

  List<InitialTest> _questions;
  List<int> _points;
  int _index = 0;
  bool _lastQuestion = false;

  InitialQuizSingleton._internal() {
    this._initializeLists();
  }

  void _initializeLists() {
    if (this._questions == null) {
      this._questions = initializeList();
      this._points = new List(_questions.length);
      for (int i = 0; i < _points.length; i++) {
        _points[i] = 0;
      }
    }
  }

  void nextQuestion(int answerClicked) {
    this._initializeLists();
    int prevInd = this._index - 1;
    if (prevInd < 0) {
      prevInd = 0;
    }
      if (_questions.length <= this._index + 1) {
        this._lastQuestion = true;
      }
      InitialTest previousQuestion = _questions[prevInd];
      if (previousQuestion.correctAnswer == answerClicked) {
        this._points[this._index] = 1;
      } else {
        this._points[this._index] = 0;
      }
    if (!this._lastQuestion) this._index++;
  }

  bool getLastQuestion() {
    return _lastQuestion;
  }

  String getTitle() {
    return this._questions[this._index].title;
  }

  String getQuestion() {
    return this._questions[this._index].question;
  }

  Map getAnswers() {
    return this._questions[this._index].answers;
  }

  int getPoints() {
    int sum = 0, i;
    for (i = 0; i < this._points.length; i++) {
      sum += this._points[i];
    }
    return sum;
  }
}
