import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_login/appEvents.dart';

import '../appBloc.dart';

class FirstPageView extends StatefulWidget {
  @override
  FirstPageViewState createState() => FirstPageViewState();
}

class FirstPageViewState extends State<FirstPageView> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Text( "Row 1" ),
          new Text( "Row 2" ),
          RaisedButton(
            child: Text( 'Go to second' ),
            onPressed: () {
              BlocProvider.of<AppBloc>(context).add(InitialQuizStartEvent());
            },
          )
        ],
      ),
    );}
}


