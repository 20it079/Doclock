import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/OTP-Page2/components/body.dart';

class OTPScreen2 extends StatelessWidget {
  final String phoneNo;
  OTPScreen2(this.phoneNo);
  @override
  Widget build(BuildContext context) {
    print('otp2'+phoneNo);
    return Scaffold(
      body: Body(phoneNo),
    );
  }
}