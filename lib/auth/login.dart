import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' as email_auth;
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, asyncSnapshot) {
          return Scaffold(
            appBar: AppBar(
              title: Image.asset(
                'lib/assets/logos/png/logo-no-background.png',
                fit: BoxFit.fitHeight,
                height: 280,
              ),
              toolbarHeight: 300,
              backgroundColor: Colors.transparent,
            ),
            //SizedBox(height:100,child: Image.asset(Constants.logoImage)),
            body: email_auth.SignInScreen(
              providers: [
                email_auth.EmailAuthProvider(),
                GoogleProvider(
                  clientId:
                      '320206510852-lcs0aifh6cq3flfvn13m0j11nluag53o.apps.googleusercontent.com',
                ),
              ],
            ),
          );
        });
  }
}
