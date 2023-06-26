import 'package:capstone/components/animated_button.dart';
import 'package:flutter/material.dart';

class CockButton extends StatelessWidget {
  final String description;

  final String title;

  final Color color;

  final VoidCallback? onTap;

  const CockButton({
    super.key,
    required this.title,
    required this.description,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        width: 370,
        height: 210,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.white,
            width: 4,
          ),
          boxShadow: [
            BoxShadow(
                color: color.withOpacity(0.75),
                blurRadius: 0,
                offset: const Offset(15, 15))
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 36,
              ),
            ),
            Divider(
              color: Colors.white.withOpacity(0.5),
            ),
            Expanded(
              child: Center(
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
