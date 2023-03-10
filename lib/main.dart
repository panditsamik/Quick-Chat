import 'package:flutter/material.dart';
import 'package:quick_chat/chat_screen.dart';
import 'package:quick_chat/home_page.dart';
import 'package:quick_chat/login_screen.dart';
import 'package:quick_chat/register_screen.dart';
import 'package:quick_chat/welcome_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.grey.shade700,
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        HomePage.id: (context) => HomePage(),
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    ),
  );
}
