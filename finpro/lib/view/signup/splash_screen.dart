import 'dart:io';

import 'package:finpro/view/signup/signin_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  dynamic newdata;


  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        Platform.isIOS
            ? CupertinoPageRoute(builder: (_) => SignInScreen())
            : MaterialPageRoute(builder: (_) => SignInScreen()),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/bootsplash_logo.png'),
      ),
    );
  }




}
