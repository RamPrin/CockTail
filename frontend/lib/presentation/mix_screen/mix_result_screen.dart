import 'package:capstone/components/background.dart';
import 'package:capstone/core/assets/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MixResultScreen extends ConsumerWidget {
  const MixResultScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Background(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(Assets.mixUp),
            Container(
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
            const SizedBox(height: 30,),
            const Text(
              "Abacaxi Ricaço",
              style: TextStyle(
                color: Colors.white,
                fontSize: 65,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 30,),
            SizedBox(
              width: MediaQuery.of(context).size.width/3,
              child: const Text(
                "Ingredients: 1 whole pineapple, 9 cl white rum, 2.25 cl, lime juice, 1.5 cl, white sugar",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
