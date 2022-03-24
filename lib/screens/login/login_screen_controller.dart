import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tokio_marine/screens/home/home_screen.dart';

class LoginScreenController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<User?> loginWithEmailAndPassword(
      {required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      user = userCredential.user;
      print(user.toString());

      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) =>
              HomeScreen(userName: user!.email ?? "Usuário")));
    } on FirebaseAuthException catch (e) {
      log("No user found with that email");
      if (e.code == "user-not-found") {
        log("No user found with that email");
      }
    }
    return user;
  }
}
