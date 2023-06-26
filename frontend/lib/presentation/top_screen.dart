import 'package:capstone/components/animated_button.dart';
import 'package:capstone/components/background.dart';
import 'package:capstone/core/assets/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TopScreen extends HookConsumerWidget {
  const TopScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controller = usePageController();
    return Background(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(Assets.top10),
                const SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: PageView.builder(
                    controller: controller,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Colors.white,
                                width: 4,
                              ),
                            ),
                            child: Image.asset(
                              Assets.placeholder,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          "Abacaxi Ricaço",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 65,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                          child: const Text(
                            "Ingredients: 1 whole pineapple, 9 cl white rum, 2.25 cl, lime juice, 1.5 cl, white sugar",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedButton(
                    onTap: () => controller.previousPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeOut,
                    ),
                    child: SvgPicture.asset(Assets.arrow),
                  ),
                   AnimatedButton(
                          onTap: () => controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeOut,
                          ),
                          child: RotatedBox(
                            quarterTurns: 2,
                            child: SvgPicture.asset(Assets.arrow),
                          ),
                        ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
