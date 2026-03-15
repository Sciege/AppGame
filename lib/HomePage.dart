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
      backgroundColor: AppColors().background,
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors().background,
        elevation: 0,
        centerTitle: true,
        title: const QrVerseLogo(),
        toolbarHeight: 100,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const QrScanner()),
          );
        },
        child: Container(
          height: 65,
          width: 65,
          decoration: BoxDecoration(
            color: AppColors().primary,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Icon(Icons.qr_code_scanner, size: 28, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 20),
            child: Text(
              'Leaderboard',
              style: TextStyle(
                fontSize: 20, 
                fontFamily: 'Poppins', 
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
          ),
          if (lists.isNotEmpty) Leaderboard(list: lists.take(3).toList()),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors().surface.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 20, bottom: 100),
                itemCount: remainingItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return Leaderboard_2(
                    user_stats: remainingItems[index],
                    position: index + 4,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
