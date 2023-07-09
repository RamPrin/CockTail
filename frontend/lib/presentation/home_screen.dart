import 'package:capstone/components/adaptive_wrap.dart';
import 'package:capstone/components/background.dart';
import 'package:capstone/components/cock_button.dart';
import 'package:capstone/core/assets/assets.dart';
import 'package:capstone/core/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Background(
      child: FittedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(Assets.logo),
            AdaptiveWrap(
              mainAxisAlignment: MainAxisAlignment.center,
              startSpacing: 50,
              endSpacing: 50,
              crossEndSpacing: 50,
              spacing: 50,
              children: [
                CockButton(
                  title: 'Mix Up!',
                  description:
                      'Just give me your preferences, and I’ll create the most interesting cocktail you’ve ever tasted.',
                  color: const Color(0xFFB00000),
                  onTap: () => context.goNamed(Routes.mixPage),
                ),
                CockButton(
                  title: 'Top 10',
                  description:
                      'Check out top 10 cocktails rated by our users and developers!',
                  color: const Color(0xFF5E5E5E),
                  onTap: () => context.goNamed(Routes.topPage),

                ),
                CockButton(
                  title: 'Pick Up!',
                  description: 'Find desired cocktail among existing ones.',
                  color: const Color(0xFF1A1D1D),
                  onTap: () => context.goNamed(Routes.pickPage),

                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
