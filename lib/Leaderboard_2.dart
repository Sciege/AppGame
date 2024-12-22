import 'package:flutter/material.dart';
import 'package:testonly/Leaderboard.dart';

class Leaderboard_2 extends StatelessWidget {
  final User_stats user_stats;
  final int position;

  Leaderboard_2({required this.user_stats, required this.position, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 5, 30, 5),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Text(
              position.toString(),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(width: 10),
            CircleAvatar(radius: 30),
            SizedBox(width: 10),
            Text(user_stats.userName),
            // use spacer to place this at the right
            Spacer(),
            Text('${user_stats.points.toString()} pts'),
          ],
        ),
      ),
    );
  }
}
