import 'package:capstone/components/animated_button.dart';
import 'package:capstone/core/assets/assets.dart';
import 'package:capstone/core/navigation/routes.dart';
import 'package:capstone/core/utils/expansions.dart';
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
    return context.isMobile
        ? MobileHeader(pageAsset)
        : DesktopHeader(pageAsset);
  }
}

class MobileHeader extends HookConsumerWidget {
  const MobileHeader(this.pageAsset, {super.key});

  final String pageAsset;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final opened = useState(false);

    return Container(
      color: opened.value ? const Color(0xFF292A2A) : Colors.transparent,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Opacity(
            opacity: opened.value ? 0 : 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Flexible(
                    flex: 1,
                    child: Icon(
                      Icons.menu,
                      color: Colors.transparent,
                      size: 50,
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: SvgPicture.asset(pageAsset),
                  ),
                  Flexible(
                    flex: 1,
                    child: AnimatedButton(
                      onTap: () => opened.value = true,
                      child: const Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (opened.value)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        flex: 1,
                        child: Icon(
                          Icons.close,
                          color: Colors.transparent,
                          size: 50,
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: AnimatedButton(
                          onTap: () => context.goNamed(Routes.home),
                          child: Image.asset(
                            Assets.logo,
                            height: 100,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: AnimatedButton(
                          onTap: () => opened.value = false,
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AnimatedButton(
                    onTap: () => context.goNamed(Routes.mixPage),
                    child: const Text(
                      "Mix Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontFamily: Fonts.carterOne,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AnimatedButton(
                    onTap: () => context.goNamed(Routes.topPage),
                    child: const Text(
                      "Top 10",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontFamily: Fonts.carterOne,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AnimatedButton(
                    onTap: () => context.goNamed(Routes.pickPage),
                    child: const Text(
                      "Pick Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontFamily: Fonts.carterOne,
                      ),
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

class DesktopHeader extends HookConsumerWidget {
  const DesktopHeader(this.pageAsset, {super.key});

  final String pageAsset;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final opened = useState(false);

    return Container(
      color: opened.value ? const Color(0xFF292A2A) : Colors.transparent,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Opacity(
            opacity: opened.value ? 0 : 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: AnimatedButton(
                      onTap: () => context.goNamed(Routes.home),
                      child: Image.asset(
                        Assets.logo,
                        height: 100,
                      ),
                    ),
                  ),
                  Expanded(child: SvgPicture.asset(pageAsset)),
                  Flexible(
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Opacity(
                          opacity: 0,
                          child: Image.asset(
                            Assets.logo,
                            height: 100,
                          ),
                        ),
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
                  Flexible(
                    flex: 1,
                    child: AnimatedButton(
                      onTap: () => context.goNamed(Routes.home),
                      child: Image.asset(
                        Assets.logo,
                        height: 100,
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: AnimatedButton(
                            onTap: () => context.goNamed(Routes.mixPage),
                            child: const Text(
                              "Mix Up",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontFamily: Fonts.carterOne,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: AnimatedButton(
                            onTap: () => context.goNamed(Routes.topPage),
                            child: const Text(
                              "Top 10",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontFamily: Fonts.carterOne,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: AnimatedButton(
                            onTap: () => context.goNamed(Routes.pickPage),
                            child: const Text(
                              "Pick Up",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontFamily: Fonts.carterOne,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Flexible(
                    flex: 1,
                    child: AnimatedButton(
                      onTap: () => opened.value = false,
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 50,
                      ),
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
