import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vault/src/ui/login/login_page.dart';
import 'package:flutter_vault/src/utils/field_constans.dart';

void main() => runApp(FlutterVault());

class FlutterVault extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoApp(
            debugShowCheckedModeBanner: false,
            title: FieldConstants.APP_TITLE,
            theme: CupertinoThemeData(primaryColor: Colors.deepPurple),
            home: LoginPage(),
          )
        : MaterialApp(
            debugShowCheckedModeBanner: false,
            title: FieldConstants.APP_TITLE,
            theme: ThemeData(primaryColor: Colors.deepPurple),
            home: LoginPage(),
          );
  }
}
