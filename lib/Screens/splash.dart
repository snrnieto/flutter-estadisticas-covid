import 'package:flutter/material.dart';
import 'package:pruebaapi/Screens/login.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(
      Duration(milliseconds: 2000),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
      ),
    );
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          color: Color(0xFF222035),
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              FractionallySizedBox(
                widthFactor: 0.7,
                child: FlutterLogo(size: 200),
              ),
              Spacer(),
              CircularProgressIndicator(),
              Text(
                "Bienvenido",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
