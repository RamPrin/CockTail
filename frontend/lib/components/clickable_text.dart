import 'package:capstone/components/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ClickableText extends HookConsumerWidget {
  const ClickableText(this.text, {super.key, this.style, this.onTap});

  final String text;
  final TextStyle? style;

  final void Function(String text)? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHovered = useState(false);

    return MouseRegion(
      child: AnimatedButton(
        onTap: () => onTap?.call(text),
        child: Text(
          text,
          style: style?.copyWith(
            color: !isHovered.value ? Colors.white : const Color(0xFFB00000),
          ),
        ),
      ),
      onEnter: (event) => isHovered.value = true,
      onExit: (event) => isHovered.value = false,
    );
  }
}
