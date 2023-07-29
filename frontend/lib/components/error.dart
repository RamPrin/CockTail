import 'package:capstone/components/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ErrorPage extends HookConsumerWidget {
  const ErrorPage({super.key, this.errorText, this.retryText, this.onRetry});

  final String? errorText;
  final String? retryText;

  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          errorText ?? "Something went wrong.",
          style: const TextStyle(
              fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 50,
        ),
        AnimatedButton(
          onTap: () {
            onRetry?.call();
          },
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: const Color(0xFFB00000).withOpacity(0.5),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.white,
                width: 4,
              ),
            ),
            child: Text(
              retryText ?? 'Try Again',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
