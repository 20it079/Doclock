import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Gov_Docs/components/background.dart';
import 'package:flutter_auth/components/home_button.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "DocLock",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
              color: Colors.purple[800],
              height: 2.5,
            ),
          ),
          HomeButton(
            text: "+ Add Documents",
            color: Colors.purple[300],
            textColor: Colors.black,
          ),
        ],
      ),
    ));
  }
}