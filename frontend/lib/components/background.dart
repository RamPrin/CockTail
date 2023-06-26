import 'package:capstone/core/assets/assets.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Background extends ConsumerWidget {
  const Background({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            Assets.background,
            alignment: Alignment.center,
            fit: BoxFit.cover,
          ),
          Center(child: child),
        ],
      ),
    );
  }
}
