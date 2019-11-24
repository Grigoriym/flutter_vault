import 'package:flutter/material.dart';
import 'package:flutter_vault/src/ui/login/login_page.dart';

class StartPage extends StatelessWidget {

  Future navigateToLoginPage(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Start Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("Login Page 01"),
              onPressed: () {
                navigateToLoginPage(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
