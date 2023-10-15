import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/UI/screens/screens.dart';

final appRouter = GoRouter(initialLocation: '/splash', routes: [
  GoRoute(
    path: '/home',
    name: HomeScreen.name,
    pageBuilder: (context, state) => CustomTransitionPage(
      child: const HomeScreen(),
      transitionDuration: const Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return NewWidget(
          animation: animation,
          child: child,
        );
      },
    ),
  ),
  GoRoute(
    path: '/splash',
    name: SplashScreen.name,
    builder: (context, state) => const SplashScreen(),
  )
]);

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
    required this.animation,
    required this.child,
  });
  final Animation<double> animation;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0),
        end: const Offset(0, 0),
      ).animate(
        animation,
      ),
      child: child,
    );
  }
}