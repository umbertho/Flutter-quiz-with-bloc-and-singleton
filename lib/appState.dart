import 'package:equatable/equatable.dart';

abstract class AppState extends Equatable {
  @override
  List<Object> get props => [];
}
//Welcome Screen Page
class FirstPageState extends AppState{}


//Initial Quiz
class NextInitialQuizState extends AppState {
  final String title, question;
  final Map answers;
  NextInitialQuizState(this.title, this.question, this.answers);
  @override
  List<Object> get props => [this.title, this.question, this.answers];
}
class InitialQuizEndState extends AppState{
  final int sum;
  InitialQuizEndState(this.sum);
  @override
  List<Object> get props => [this.sum];
}


//Misc
class AppLoadingState extends AppState{}
class ErrorState extends AppState{}
