import 'package:flutter/material.dart';
import 'package:our_chat/Login_Reg.dart';
import 'package:our_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:our_chat/screens/chat_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  final _auth = FirebaseAuth.instance;
  bool showSpinner=false;
  String email;
  String password;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value; //Do something with the user input.
                },
                decoration:
                    kTextFeildDecoration.copyWith(hintText: 'Enter your e-mail'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value; //Do something with the user input.
                },
                decoration:
                    kTextFeildDecoration.copyWith(hintText: 'Enter password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              LoginReg(
                onPressed: () async {
                  setState(() {
                    showSpinner=true;
                  });
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (user != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                    setState(() {
                      showSpinner=false;
                    });
                  } catch (e) {
                    print(e);
                  }
                },
                colour: Colors.lightBlueAccent,
                title: 'Login',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
