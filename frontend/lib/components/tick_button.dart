import 'package:capstone/components/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TickButton extends HookConsumerWidget {
  const TickButton(
      {super.key, required this.initialValue, required this.onTap});

  final void Function(bool newValue) onTap;
  final bool initialValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = useState(initialValue);
    value.addListener(() {
      onTap.call(value.value);
    });

    return AnimatedButton(
      onTap: () => value.value = !value.value,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: const Color(0xFF5E5E5E),
          border: Border.all(
            width: 3,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: value.value
              ? const Icon(
                  Icons.check_rounded,
                  color: Colors.white,
                  size: 20,
                )
              : null,
        ),
      ),
    );
  }
}
