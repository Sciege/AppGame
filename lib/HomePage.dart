import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';
import 'qr_verse_logo.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors().background,
        title: Center(
          child: QrVerseLogo(),
        ),
        toolbarHeight: 200,
      ),
    );
  }
}
