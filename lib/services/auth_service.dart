import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testonly/HomePage.dart';

class AuthService {
  Future signup(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      showDialog(
        context: context,
        builder: (context) => Center(
          child: CircularProgressIndicator(),
        ),
      );

      final UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      Navigator.pop(context);

      if (userCredential.user != null) {
        // show message successful
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text('Account Created Succesfully'))));
      } else {
        return false;
      }
      //for exceptions during logging in or signup
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      String message = '';
      switch (e.code) {
        case 'weak-password':
          message = 'The password provided is too weak';
          break;
        case 'email-already-in-use':
          message = 'An account already exists with that email';
          break;
        case 'invalid-email':
          message = 'Email address is not valid';
          break;
        default:
          message = 'An error occurred during registration';
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text(message))));
      //show message
    }
    // for other errors
    catch (e) {
      Navigator.pop(context);
      //if other problem occur beyond expectation print message
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Unkown error')));
    }
  }

  Future login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      showDialog(
        context: context,
        builder: (context) => Center(
          child: CircularProgressIndicator(),
        ),
      );

      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      Navigator.pop(context);
      //push to  HomePagge()
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Homepage(),
        ),
      );
      if (userCredential.user != null) {
        // show message successful
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text('Log-in Succesfully'))));
      } else {
        return false;
      }
      //for exceptions during logging in or signup
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      String message = '';
      switch (e.code) {
        case 'weak-password':
          message = 'The password provided is too weak';
          break;
        case 'email-already-in-use':
          message = 'An account already exists with that email';
          break;
        case 'invalid-email':
          message = 'The email address is not valid';
          break;
        default:
          message = 'An error occurred during registration';
      }
      //show message
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text(message))));
    }
    // for other errors
    catch (e) {
      Navigator.pop(context);
      //if other problem occur beyond expectation print message
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Unkown error')));
    }
  }
}
