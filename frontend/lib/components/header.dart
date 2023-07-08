import 'package:capstone/components/animated_button.dart';
import 'package:capstone/core/assets/assets.dart';
import 'package:capstone/core/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CockHeader extends HookConsumerWidget {
  const CockHeader({super.key, required this.pageAsset});

  final String pageAsset;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final opened = useState(false);

    return Container(
      color: opened.value? const Color(0xFF292A2A): Colors.transparent,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Opacity(
            opacity: opened.value? 0:1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedButton(
                    onTap: () => context.goNamed(Routes.home),
                    child: Image.asset(
                      Assets.logo,
                      height: 100,
                    ),
                  ),
                  SvgPicture.asset(pageAsset),
                  AnimatedButton(
                    onTap: () => opened.value = true,
                    child: const Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (opened.value)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedButton(
                    onTap: () => context.goNamed(Routes.home),
                    child: Image.asset(
                      Assets.logo,
                      height: 100,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedButton(
                        onTap: () => context.goNamed(Routes.mixPage),
                        child: const Text(
                          "Mix Up",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      AnimatedButton(
                        onTap: () => context.goNamed(Routes.topPage),
                        child: const Text(
                          "Top 10",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      AnimatedButton(
                        onTap: () => context.goNamed(Routes.pickPage),
                        child: const Text(
                          "Pick Up",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                          ),
                        ),
                      )
                    ],
                  ),
                  AnimatedButton(
                    onTap: () => opened.value = false,
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
