import 'dart:async';
import 'package:flutter/material.dart';

import '../Login_Screen/login_view.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xffffffff),
        child: Center(
          child: Image.asset('assets/images/lorem.jpg'),
        ));
  }
}
