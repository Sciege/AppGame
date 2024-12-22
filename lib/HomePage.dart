import 'package:flutter/material.dart';
import 'package:testonly/Leaderboard.dart';
import 'package:testonly/Leaderboard_2.dart';
import 'colors.dart';
import 'qr_verse_logo.dart';

class Homepage extends StatelessWidget {
  List<User_stats> lists = [
    User_stats(userName: 'Test-1', points: 0),
    User_stats(userName: 'Test-2', points: 0),
    User_stats(userName: 'Test-3', points: 0),
    User_stats(userName: 'Test-4', points: 0)
  ];

  Homepage({super.key});

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
      body: Column(
        children: [
          Center(
            child: Text(
              'Leaderboard',
              style: TextStyle(
                  fontSize: 40, fontFamily: 'Poppins', color: Colors.white),
            ),
          ),
          Leaderboard(list: lists),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
