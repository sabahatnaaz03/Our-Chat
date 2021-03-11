import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import'package:our_chat/Login_Reg.dart';
import 'package:our_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
class RegistrationScreen extends StatefulWidget {
  static const String id='registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth=FirebaseAuth.instance;
  bool showSpinner=false;
  String email;
  String password;


  @override
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
                tag:'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
               // controller: myController,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email=value;

                  //Do something with the user input.
                },
                decoration:kTextFeildDecoration.copyWith(hintText: 'Enter your email')
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
               // controller: myController,
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  password=value;//Do something with the user input.
                },
                decoration:kTextFeildDecoration.copyWith(hintText: 'Enter your password')
              ),
              SizedBox(
                height: 24.0,
              ),
              LoginReg(
                onPressed: () async{
                  setState(() {
                    showSpinner=true;
                  });

                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if(newUser!=null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                    setState((){
                      showSpinner=false;
                    });
                  }
                  catch(e) {
                    print(e);
                  }
                },
                colour: Colors.blueAccent,
                title:'Register'
              ),
            ],
          ),
        ),
      ),
    );
  }
}
