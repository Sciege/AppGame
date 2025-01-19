import 'package:flutter/material.dart';
import 'package:testonly/Leaderboard.dart';
import 'package:testonly/Leaderboard_2.dart';
import 'package:testonly/QR_Scanner.dart';
import 'colors.dart';
import 'qr_verse_logo.dart';

class Homepage extends StatelessWidget {
  List<User_stats> lists = [
    User_stats(userName: 'Test-1', points: 0),
    User_stats(userName: 'Test-2', points: 0),
    User_stats(userName: 'Test-3', points: 0),
    User_stats(userName: 'Test-4', points: 0),
    User_stats(userName: 'Test-5', points: 0)
  ];

  Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    // get the remaining items and put it to another list
    final remainingItems = lists.length > 3 ? lists.sublist(3) : [];

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        height: 80,
        width: 80,
        child: FloatingActionButton.large(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const QrScanner()),
            );
          },
          child: const Icon(Icons.camera_alt_outlined),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors().background,
        title: const Center(
          child: QrVerseLogo(),
        ),
        toolbarHeight: 200,
      ),
      body: Column(
        children: [
          const Center(
            child: Text(
              'Leaderboard',
              style: TextStyle(
                  fontSize: 40, fontFamily: 'Poppins', color: Colors.white),
            ),
          ),
          if (lists.isNotEmpty) Leaderboard(list: lists.take(3).toList()),
          Expanded(
            child: ListView.builder(
              itemCount: remainingItems.length,
              itemBuilder: (BuildContext context, int index) {
                return Leaderboard_2(
                  user_stats: remainingItems[index],
                  //index is like incrementing itself
                  position: index + 4,
                );
              },
            ),
          ),
        ],
      ),
      backgroundColor: AppColors().background,
    );
  }
}
