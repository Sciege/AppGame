import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testonly/auth/login.dart';
import 'package:testonly/colors.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                    'Register Account',
                    style: TextStyle(fontSize: 35, color: Colors.white),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
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
                  'Already Have Account?',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ),
                      );
                    },
                    child: Text(
                      'LogIn',
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
