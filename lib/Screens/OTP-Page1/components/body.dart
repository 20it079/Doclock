import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/OTP-Page1/components/background.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_phone_field.dart';
import 'package:flutter_auth/Screens/OTP-Page2/otp_screen2.dart';

class Body extends StatelessWidget {
  Body({
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    String phoneNo = '+91';
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
          RoundedPhoneField(
            hintText: "Enter Phone Number",
            onChanged: (value) {
              phoneNo = value;
              print('+91'+phoneNo);
            },
          ),
          RoundedButton(
            text: "Send OTP",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return OTPScreen2('+91'+phoneNo);
                  },
                ),
              );
              SizedBox(height: size.height * 0.03);
            },
          ),
        ],
      ),
    ),);
  }
}

