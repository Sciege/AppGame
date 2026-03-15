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
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png',
                height: 120,
              ),
              const SizedBox(height: 40),
              const Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 24, 
                  fontFamily: 'Poppins', 
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Sign in to continue your progress',
                style: TextStyle(
                  color: Colors.white38,
                  fontFamily: 'Poppins',
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 50),
              _buildModernField(
                controller: email,
                hint: 'Email Address',
                icon: Icons.email_outlined,
              ),
              const SizedBox(height: 16),
              _buildModernField(
                controller: password,
                hint: 'Password',
                icon: Icons.lock_open_outlined,
                isPassword: true,
              ),
              const SizedBox(height: 32),
              // Gradient Button
              GestureDetector(
                onTap: () async {
                  await AuthService().login(
                    email: email.text,
                    password: password.text,
                    context: context
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                    color: AppColors().primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "New to QR-Verse?",
                    style: TextStyle(color: Colors.white38, fontFamily: 'Poppins'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUp()),
                      );
                    },
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                        color: AppColors().primary,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildModernField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool isPassword = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors().surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        style: const TextStyle(color: Colors.white, fontFamily: 'Poppins'),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.white24, size: 20),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white24, fontSize: 14, fontFamily: 'Poppins'),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
    );
  }
}
