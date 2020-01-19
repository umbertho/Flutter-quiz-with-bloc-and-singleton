import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AppStartedEvent extends AppEvent{}

class InitialQuizStartEvent extends AppEvent{}

class NextQuestionEvent extends AppEvent{
  final int clicked;
  NextQuestionEvent(this.clicked);

  @override
  List<Object> get props => [this.clicked];
}

class InitialQuizEndEvent extends AppEvent{
  @override
  List<Object> get props => [];
}

class QuizFinishedEvent extends AppEvent{}