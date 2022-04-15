import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Home/home_screen.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/Screens/OTP-Page2/components/background.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input.dart';

// class Body extends StatelessWidget {
//
//
//
//   }

class Body extends StatefulWidget {
  final String phoneNo;
  Body(this.phoneNo);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  String _verificationCode;
  @override
  void initState() {
    super.initState();
    _verifyPhone();
  }

    @override
    Widget build(BuildContext context) {
      Size size = MediaQuery
          .of(context)
          .size;

      String otp;

      return Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "DocLock",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 70,
                    color: Colors.purple[800],
                    height: 2.5),
              ),
              Text(
                "OTP VERIFICATION",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: size.height * 0.03),
              SizedBox(height: size.height * 0.03),
              RoundedInput(
                hintText: "Enter OTP",
                onChanged: (value) {
                  otp = value;
                },
              ),
              RoundedButton(
                text: "Verify",
                press: () async {

                await FirebaseAuth.instance
                    .signInWithCredential(PhoneAuthProvider.credential(
                verificationId: _verificationCode,
                smsCode: otp))
                    .then((value) async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomeScreen();
                      },
                    ),
                  );
                });

                  SizedBox(height: size.height * 0.03);
                },
              ),
            ],
          ),
        ),);
    }





  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: widget.phoneNo,
      verificationCompleted: (PhoneAuthCredential credential) async {
        print("2");
        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) async {
          if (value.user != null) {
            Navigator.pushAndRemoveUntil(
                context, MaterialPageRoute(builder: (context) => HomeScreen()), (route) => false);
          }
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (verificationID, resendToken) {
        setState(() {
          // _loading = false;
          _verificationCode = verificationID;
        });
      },
      codeAutoRetrievalTimeout: (String verificationID) {
        setState(() {
          _verificationCode = verificationID;
        });
      },
      timeout: Duration(seconds: 120),
    );
  }
}
