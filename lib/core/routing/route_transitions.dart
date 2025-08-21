import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

CustomTransitionPage fadeTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}

CustomTransitionPage scaleTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        ScaleTransition(scale: animation, child: child),
  );
}

CustomTransitionPage slideTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) => SlideTransition(
        position: animation.drive(
          Tween<Offset>(
            begin: const Offset(-.75, 0),
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.easeIn)),
        ),
        child: child),
  );
}
