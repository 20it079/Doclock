import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Home/components/background.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/Screens/Gov_Docs/govdoc_screen.dart';
import 'package:flutter_auth/Screens/Photos/photo_screen.dart';

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
                fontSize: 50,
                color: Colors.purple[800],
                height: 2.5),
          ),
          RoundedButton(
            text: "Government Documents",
            color: Colors.purple[300],
            textColor: Colors.black,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DocumentScreen();
                  },
                ),
              );
            },
          ),
          RoundedButton(
            text: "Photos",
            color: Colors.purple[300],
            textColor: Colors.black,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return PhotoScreen();
                  },
                ),
              );
            },
          ),
          RoundedButton(
            text: "Bank Details",
            color: Colors.purple[300],
            textColor: Colors.black,
          ),
          RoundedButton(
            text: "Random",
            color: Colors.purple[300],
            textColor: Colors.black,
          ),
        ],
      ),
    ));
  }
}
