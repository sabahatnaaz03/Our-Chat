import 'package:flutter/material.dart';
import 'package:our_chat/screens/welcome_screen.dart';
import 'package:our_chat/screens/login_screen.dart';
import 'package:our_chat/screens/registration_screen.dart';
import 'package:our_chat/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async
{
WidgetsFlutterBinding.ensureInitialized();
await
Firebase.initializeApp();

runApp(OurChat());}

class OurChat extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: WelcomeScreen(),
      routes: {
        WelcomeScreen.id:(context)=>WelcomeScreen(),
        LoginScreen.id:(context)=>LoginScreen(),
        RegistrationScreen.id:(context)=>RegistrationScreen(),
        ChatScreen.id:(context)=>ChatScreen(),
      },
    );
  }
}