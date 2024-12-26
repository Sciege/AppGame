import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testonly/colors.dart';

class QrVerseLogo extends StatelessWidget {
  const QrVerseLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
        // Add padding
        child: FittedBox(
          // this part is need to change soon as it causes 'overflow'
          //this widget is temporary solution
          fit: BoxFit.contain,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(width: 5),
              Transform.rotate(
                angle: -0.1,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors().bg_logo,
                  ),
                  child: const Center(
                    child: Text(
                      'Q',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 36,
                        fontFamily: 'IrishGrover'
                      ),
                    ),
                  ),
                ),
              ),
              Transform.translate(
                offset: const Offset(-3, -10),
                child: Transform.rotate(
                  angle: 0.1,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors().bg_logo,
                    ),
                    child: const Center(
                      child: Text(
                        'R',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 36,
                          fontFamily: 'IrishGrover'
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 25,
                height: 55,
                child: Center(
                  child: SvgPicture.asset(
                    'assets/dash.svg',
                    height: 50,
                  ),
                ),
              ),
              Transform.translate(
                offset: const Offset(0, -10),
                child: Transform.rotate(
                  angle: -0.18,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors().bg_logo,
                    ),
                    child: const Center(
                      child: Text(
                        'v',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 36,
                          fontFamily: 'IrishGrover'
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Transform.translate(
                offset: const Offset(-6, 12),
                child: Transform.rotate(
                  angle: 0.17,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors().bg_logo,
                    ),
                    child: const Center(
                      child: Text(
                        'e',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 36,
                          fontFamily: 'IrishGrover'
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Transform.translate(
                offset: const Offset(-9, -5),
                child: Transform.rotate(
                  angle: -0.09,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors().bg_logo,
                    ),
                    child: const Center(
                      child: Text(
                        'r',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 36,
                          fontFamily: 'IrishGrover'
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Transform.translate(
                offset: const Offset(-12, 8),
                child: Transform.rotate(
                  angle: 0.13,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors().bg_logo,
                    ),
                    child: const Center(
                      child: Text(
                        's',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 36,
                          fontFamily: 'IrishGrover'
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Transform.translate(
                offset: const Offset(-15, -10),
                child: Transform.rotate(
                  angle: 0.09,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors().bg_logo,
                    ),
                    child: const Center(
                      child: Text(
                        'e',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 36,
                          fontFamily: 'IrishGrover'
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}