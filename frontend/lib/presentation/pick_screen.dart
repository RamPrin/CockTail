import 'package:capstone/components/background.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PickScreen extends ConsumerWidget {
  const PickScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Background(
      child: Center(
        child: Text(
          "To be done",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
