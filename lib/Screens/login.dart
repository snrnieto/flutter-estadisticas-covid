import 'package:flutter/material.dart';
import 'package:pruebaapi/Screens/home.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          width: screenwidth,
          height: screenheight,
          color: Color(0xFF222035),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Logo(),
              LoginForm(),
              LoginButton(),
              TextRegister(),
            ],
          ),
        ),
      ),
    );
  }
}

class TextRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "No estás registrado?",
          style: TextStyle(color: Colors.white),
        ),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            primary: Colors.transparent,
          ),
          child: Text(
            "Registrate",
            style: TextStyle(
              color: Colors.greenAccent,
            ),
          ),
        )
      ],
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Input("email"),
        Input("password"),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            style: TextButton.styleFrom(
              primary: Colors.transparent,
            ),
            onPressed: () {},
            child: Text(
              "Recuperar contraseña",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: MediaQuery.of(context).size.width * 0.5,
      height: 45,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ),
        );
      },
      color: Color(0xFF14efc5),
      child: Text(
        "Iniciar sesión",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}

class Input extends StatefulWidget {
  final String opcion;

  Input(this.opcion);

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          obscureText: widget.opcion == "email" ? false : true,
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
              hintText: widget.opcion == "email"
                  ? "Correo electrónico"
                  : "Contraseña",
              hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
              border: InputBorder.none),
        ),
        Divider(
          color: Colors.grey.shade800,
        )
      ],
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FlutterLogo(
          size: 80,
        ),
        Text(
          'Covidisticas',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ],
    );
  }
}
