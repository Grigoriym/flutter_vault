import 'package:flutter/material.dart';
import 'package:flutter_vault/src/ui/login/login_first_page.dart';
import 'package:flutter_vault/src/ui/login/login_second_page.dart';
import 'package:flutter_vault/src/ui/noteslist/notes_list_page.dart';

class StartPage extends StatelessWidget {
  Future navigateToLoginPage(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginFirstPage()));
  }

  Future navigateToSecondLoginPage(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginSecondPage()));
  }

  Future navigateToNotesListPage(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => NotesList()));
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
            ),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text("Login Page 02"),
              onPressed: () {
                navigateToSecondLoginPage(context);
              },
            ),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("Notes List"),
              onPressed: () {
                navigateToNotesListPage(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
