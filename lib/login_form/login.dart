import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testonly/colors.dart';
import 'package:testonly/login_form/signup.dart';

import '../services/auth_service.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().background,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Log-in Account',
                    style: TextStyle(fontSize: 35, color: Colors.white),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: email,
                      cursorColor: Colors.grey,
                      style: TextStyle(fontSize: 25, color: Colors.white),
                      decoration: InputDecoration(
                        // WHEN FOCUSED THE BORDER WILL SHOW WHITE
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintStyle: TextStyle(color: Colors.grey.shade700),
                        hintText: 'Username',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: password,
                      selectionControls: cupertinoDesktopTextSelectionControls,
                      cursorColor: Colors.grey,
                      style: TextStyle(fontSize: 25, color: Colors.white),
                      decoration: InputDecoration(
                          // WHEN FOCUSED THE BORDER WILL SHOW WHITE
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(15)),
                          hintStyle: TextStyle(color: Colors.grey.shade700),
                          hintText: 'Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () async {
                      //call the AuthService class
                      await AuthService().login(
                          email: email.text,
                          password: password.text,
                          context: context);
                    },
                    child: Text(
                      'Log-in',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't Have Account?",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUp(),
                        ),
                      );
                    },
                    child: Text(
                      'Sign-up',
                      style:
                          TextStyle(color: Colors.grey.shade500, fontSize: 18),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
