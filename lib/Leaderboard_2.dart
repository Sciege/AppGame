import 'package:flutter/material.dart';
import 'package:testonly/colors.dart';
import 'package:testonly/Leaderboard.dart';

class Leaderboard_2 extends StatelessWidget {
  final User_stats user_stats;
  final int position;

  const Leaderboard_2({required this.user_stats, required this.position, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors().surface.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white.withOpacity(0.05)),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 25,
              child: Text(
                position.toString(),
                style: const TextStyle(
                  fontSize: 14, 
                  fontFamily: 'Poppins', 
                  color: Colors.white38,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors().surfaceVariant,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  user_stats.userName.substring(0, 1).toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                user_stats.userName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: 'Poppins', 
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              user_stats.points.toString(),
              style: TextStyle(
                fontFamily: 'Poppins', 
                color: AppColors().secondary.withOpacity(0.8),
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            const SizedBox(width: 4),
            const Text(
              'pts',
              style: TextStyle(
                color: Colors.white24,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
