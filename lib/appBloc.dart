import 'package:flutter_bloc/flutter_bloc.dart';
import 'appEvents.dart';
import 'appState.dart';
import 'singletons/initialQuiz.dart';

class AppBloc extends Bloc<AppEvent, AppState> {

  AppBloc();

  @override
  AppState get initialState => FirstPageState();

  @override
  Stream<AppState> mapEventToState(
    AppEvent event,
  ) async* {
    if (event is AppStartedEvent) {
      yield FirstPageState();
    }
    if (event is NextQuestionEvent) {
      InitialQuizSingleton initialQuizSingleton = new InitialQuizSingleton();
      initialQuizSingleton.nextQuestion(event.clicked);
      if(initialQuizSingleton.getLastQuestion()){
        yield InitialQuizEndState(initialQuizSingleton.getPoints());
      }else {
        yield NextInitialQuizState(
            initialQuizSingleton.getTitle( ),
            initialQuizSingleton.getQuestion( ),
            initialQuizSingleton.getAnswers( )
        );
      }
    }
    if (event is InitialQuizStartEvent) {
      InitialQuizSingleton initialQuizSingleton = new InitialQuizSingleton();
      yield NextInitialQuizState(
          initialQuizSingleton.getTitle(),
          initialQuizSingleton.getQuestion(),
          initialQuizSingleton.getAnswers()
      );
    }
  }
}
