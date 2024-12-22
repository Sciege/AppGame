import 'package:flutter/material.dart';

class Leaderboard extends StatelessWidget {
  List<User_stats> list;

  Leaderboard({required this.list, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // add crossAlignment.end so that the leaderboard will be placed at the bottom
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildPodium(list[1],
              height: 100,
              position: '2nd',
              place_font_size: 35,
              points_font_size: 15),
          _buildPodium(list[0],
              height: 130,
              position: '1st',
              place_font_size: 50,
              points_font_size: 20),
          _buildPodium(list[2],
              height: 80,
              position: '3rd',
              place_font_size: 25,
              points_font_size: 13)
        ],
      ),
    );
  }

  Widget _buildPodium(User_stats list,
      {required double height,
        required String position,
        required double place_font_size,
        required double points_font_size}) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Column(
            // so no need to Center manually
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person,
                size: 50,
              ),
              Text(list.userName),
            ],
          ),
        ),

        // here we need to define the height and position in the parameter
        SizedBox(height: 10),
        Container(
          width: 125,
          height: height,
          color: Colors.white,
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // have to wrap it in '${}' since 0 is int we have to make it string
              Text('${list.points} pts',
                style: TextStyle(fontSize: points_font_size),),
              Text(
                position,
                style: TextStyle(fontSize: place_font_size),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class User_stats {
  String userName;
  int points;

  User_stats({required this.userName, required this.points});
}

