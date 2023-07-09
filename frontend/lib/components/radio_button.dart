import 'package:capstone/components/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RadioButton extends HookConsumerWidget {
  const RadioButton({super.key, required this.isChosen, this.onTap});

  final VoidCallback? onTap;

  final bool isChosen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedButton(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: const Color(0xFF5E5E5E),
          border: Border.all(
            width: 3,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: isChosen
              ? Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
