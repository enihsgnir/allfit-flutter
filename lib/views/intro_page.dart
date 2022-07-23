import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          InkWell(
            onTap: () {},
            child: Positioned(
              width: 265,
              height: 265,
              left: 47,
              top: 125,
              child: Container(
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage("assets/images/intro/user_intro.png"),
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                foregroundDecoration: const BoxDecoration(
                  color: Color.fromRGBO(11, 10, 10, 0.86),
                ),
                child: const Text(
                  "수선 이용자로\n시작하기",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Positioned(
              width: 265,
              height: 265,
              left: 47,
              top: 413,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/intro/tailor_intro.png"),
                  ),
                ),
                foregroundDecoration: const BoxDecoration(
                  color: Color.fromRGBO(240, 240, 240, 0.89),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
