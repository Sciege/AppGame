import 'package:flutter/material.dart';
import 'colors.dart';

class Leaderboard extends StatelessWidget {
  List<User_stats> list;

  Leaderboard({required this.list, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildPodium(list[1],
              height: 95,
              position: '2nd',
              color: AppColors().silver),
          const SizedBox(width: 10),
          _buildPodium(list[0],
              height: 125,
              position: '1st',
              color: AppColors().primary,
              isFirst: true),
          const SizedBox(width: 10),
          _buildPodium(list[2],
              height: 80,
              position: '3rd',
              color: AppColors().bronze),
        ],
      ),
    );
  }

  Widget _buildPodium(User_stats user,
      {required double height,
      required String position,
      required Color color,
      bool isFirst = false}) {
    return Expanded(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isFirst ? color : color.withOpacity(0.3), 
                width: isFirst ? 2 : 1
              ),
            ),
            child: CircleAvatar(
              radius: isFirst ? 32 : 26,
              backgroundColor: AppColors().surfaceVariant,
              child: Text(
                user.userName.substring(0, 1).toUpperCase(),
                style: TextStyle(
                  color: isFirst ? color : Colors.white70,
                  fontWeight: FontWeight.bold,
                  fontSize: isFirst ? 22 : 16,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            user.userName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontWeight: isFirst ? FontWeight.bold : FontWeight.w500,
              fontFamily: 'Poppins',
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 6),
          Container(
            width: double.infinity,
            height: height,
            decoration: BoxDecoration(
              color: color.withOpacity(0.12), // Increased opacity for visibility
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: color.withOpacity(0.35), // Sharper borders
                width: 1.5,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    position.substring(0, 1), 
                    style: TextStyle(
                      fontSize: isFirst ? 18 : 14,
                      fontWeight: FontWeight.w900,
                      color: color,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  position,
                  style: TextStyle(
                    fontSize: isFirst ? 18 : 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Poppins',
                  ),
                ),
                Text(
                  '${user.points}',
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class User_stats {
  String userName;
  int points;

  User_stats({required this.userName, required this.points});
}
