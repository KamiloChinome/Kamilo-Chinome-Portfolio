import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  static const name = 'splash';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Image.asset(
              'assets/kchLogo1.png',
              height: size.height * .35,
            )
                .animate()
                .fade(duration: const Duration(milliseconds: 1500))
                .scale(duration: const Duration(milliseconds: 1500), curve: Curves.easeInOutQuint),
            FutureBuilder(
              future: animateLogo(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Image.asset(
                    'assets/kchLogo2.png',
                    height: size.height * .35,
                  ).animate().fade(duration: const Duration(milliseconds: 500));
                } else {
                  return const SizedBox();
                }
              },
            )
          ],
        ),
      ).animate(onComplete: (_) => context.pushReplacementNamed('home')).scaleXY(
            begin: 1,
            end: 0,
            delay: const Duration(seconds: 2),
            curve: Curves.easeInOutQuint,
          ),
    );
  }

  Future<void> animateLogo() async {
    await Future.delayed(const Duration(milliseconds: 1000));
  }
}
