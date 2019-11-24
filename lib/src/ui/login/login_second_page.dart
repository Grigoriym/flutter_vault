import 'package:flutter/material.dart';

class LoginSecondPage extends StatefulWidget {
  _LoginSecondPageState createState() => _LoginSecondPageState();
}

class _LoginSecondPageState extends State<LoginSecondPage> {
  TextStyle style = TextStyle(fontFamily: "Montserrat", fontSize: 20.0);
  EdgeInsets padding = EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0);
  OutlineInputBorder border =
      OutlineInputBorder(borderRadius: BorderRadius.circular(32.0));

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: padding, hintText: "Email", border: border),
    );

    final passwordField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: padding, hintText: "Password", border: border),
    );

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: padding,
        onPressed: () {},
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style:
              style.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Login page"),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: Center(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 155.0,
                      child: Image.asset(
                        "assets/logo2.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: 45.0,
                    ),
                    emailField,
                    SizedBox(height: 25.0),
                    passwordField,
                    SizedBox(
                      height: 35.0,
                    ),
                    loginButton,
                    SizedBox(height: 15.0)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
