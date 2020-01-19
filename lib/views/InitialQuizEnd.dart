
import 'package:flutter/material.dart';

class InitialQuizEndView extends StatefulWidget {

  final int sum;

  InitialQuizEndView(this.sum);

  @override
  InitialQuizEndViewState createState() => InitialQuizEndViewState(this.sum);
}

class InitialQuizEndViewState extends State<InitialQuizEndView> {

  final int _sum;

  InitialQuizEndViewState(this._sum);

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Text( this._sum.toString() )
        ],
      ),
    );}
}


