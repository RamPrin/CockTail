import 'dart:math';

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
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(flex: 1,child: SvgPicture.asset(Assets.top10)),
                const SizedBox(
                  height: 50,
                ),
                Flexible(
                  flex: 3,
                  child: PageView.builder(
                    controller: controller,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          flex: 5,
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
                        const Flexible(
                          flex: 1,
                          child: FittedBox(
                            child: Text(
                              "Abacaxi Ricaço",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 65,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Flexible(
                          flex: 2,
                          child: FittedBox(
                            child: Text(
                              "Ingredients:\n 1 whole pineapple,\n 9 cl white rum, 2.25 cl,\n lime juice, 1.5 cl,\n white sugar",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Center(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: min(100,MediaQuery.of(context).size.width/10)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width/10,
                    child: AnimatedButton(
                      onTap: () => controller.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeOut,
                      ),
                      child: SvgPicture.asset(Assets.arrow),
                    ),
                  ),
                   SizedBox(
                    width: MediaQuery.of(context).size.width/10,

                     child: AnimatedButton(
                            onTap: () => controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeOut,
                            ),
                            child: RotatedBox(
                              quarterTurns: 2,
                              child: SvgPicture.asset(Assets.arrow),
                            ),
                          ),
                   ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
