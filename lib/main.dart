import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_login/appEvents.dart';
import 'package:flutter_bloc_login/views/firstPage.dart';
import 'package:flutter_bloc_login/views/initialQuizView.dart';
import './views/loadingIndicator.dart';
import 'appBloc.dart';
import 'appState.dart';
import 'views/InitialQuizEnd.dart';


class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(
    BlocProvider<AppBloc>(
      create: (context) {
        return AppBloc()
          ..add(AppStartedEvent());
      },
      child: App(),
    ),
  );
}

class App extends StatelessWidget {

  App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          if (state is AppLoadingState) {
            return LoadingIndicatorView();
          }
          if (state is FirstPageState) {
            return FirstPageView();
          }
          if(state is NextInitialQuizState){
            return InitialQuizView(state.question, state.title, state.answers);
          }
          if(state is InitialQuizEndState){
            return InitialQuizEndView(state.sum);
          }
          return FirstPageView();
        },
      ),
    );
  }
}