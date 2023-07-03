import 'package:capstone/components/animated_button.dart';
import 'package:capstone/components/background.dart';
import 'package:capstone/core/assets/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class PickScreen extends HookConsumerWidget {
  const PickScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final minStrength = useState(10.0);
    final maxStrength = useState(30.0);
    final alcoholFree = useState(false);

    return Background(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Column(
          children: [
            SvgPicture.asset(Assets.pickUp),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              decoration: BoxDecoration(
                color: const Color(0xFFB00000).withOpacity(0.5),
                border: Border.all(
                  width: 3,
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Alcohol strength",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        "Alcohol - free",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      AnimatedButton(
                        onTap: () => alcoholFree.value = !alcoholFree.value,
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
                              child: alcoholFree.value
                                  ? const Icon(
                                      Icons.check_rounded,
                                      color: Colors.white,
                                      size: 20,
                                    )
                                  : null),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SfRangeSliderTheme(
                    data: SfRangeSliderThemeData(
                      overlayRadius: 0,
                      thumbRadius: 15,
                      disabledThumbColor: Colors.transparent,
                      thumbColor: Colors.transparent,
                      activeTrackColor:
                          const Color(0xFFB00000).withOpacity(0.8),
                      inactiveTrackColor: Colors.transparent,
                      activeTrackHeight: 18,
                      inactiveTrackHeight: 18,
                      disabledActiveTrackColor:
                          const Color(0xFFB00000).withOpacity(0.2),
                      disabledInactiveTrackColor: Colors.transparent,
                      trackCornerRadius: 10,
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Builder(builder: (context) {
                          return Container(
                            width: double.infinity,
                            height: SfRangeSliderTheme.of(context)!
                                    .activeTrackHeight +
                                6,
                            decoration: BoxDecoration(
                              color: const Color(0xFF5E5E5E),
                              border: Border.all(
                                width: 3,
                                color: alcoholFree.value
                                    ? Colors.grey
                                    : Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          );
                        }),
                        SfRangeSlider(
                          values: SfRangeValues(
                              minStrength.value, maxStrength.value),
                          onChanged: alcoholFree.value
                              ? null
                              : (value) {
                                  minStrength.value = value.start;
                                  maxStrength.value = value.end;
                                },
                          min: 1,
                          max: 56,
                          interval: 1,
                          stepSize: 1,
                          endThumbIcon: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFD7D7D7),
                              border: Border.all(
                                width: 3,
                                color: alcoholFree.value
                                    ? Colors.grey
                                    : Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            width: 30,
                            height: 30,
                          ),
                          startThumbIcon: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFD7D7D7),
                              border: Border.all(
                                width: 3,
                                color: alcoholFree.value
                                    ? Colors.grey
                                    : Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50,),
            AnimatedButton(
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
                child: const Text(
                  'Pick Up!',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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
