import 'package:capstone/components/adaptive_wrap.dart';
import 'package:capstone/components/animated_button.dart';
import 'package:capstone/components/cock_scaffold.dart';
import 'package:capstone/components/tick_button.dart';
import 'package:capstone/core/assets/assets.dart';
import 'package:capstone/core/navigation/routes.dart';
import 'package:capstone/core/utils/expansions.dart';
import 'package:capstone/presentation/pick_screen/components/cock_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class PickScreen extends HookConsumerWidget {
  const PickScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = context.isMobile;
    final minStrength = useState(10.0);
    final maxStrength = useState(30.0);
    final alcoholFree = useState(false);

    final sweet = useState(1);
    final sour = useState(1);
    final savory = useState(1);
    final bitter = useState(1);

    final creamy = useState(false);
    final spicy = useState(false);
    final fruity = useState(false);

    return CockScaffold(
      pageAsset: Assets.pickUp,
      child: Column(
        children: [
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
                const Center(
                  child: Text(
                    "Alcohol strength",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
                    activeTrackColor: const Color(0xFFB00000).withOpacity(0.8),
                    inactiveTrackColor: Colors.transparent,
                    activeTrackHeight: 18,
                    inactiveTrackHeight: 18,
                    disabledActiveTrackColor:
                        const Color(0xFFB00000).withOpacity(0.2),
                    disabledInactiveTrackColor: Colors.transparent,
                    trackCornerRadius: 10,
                    tickOffset: const Offset(0, 10),
                    activeTickColor: Colors.white,
                    inactiveTickColor: Colors.white,
                    disabledActiveTickColor: Colors.grey,
                    disabledInactiveTickColor: Colors.grey,
                    activeLabelStyle: TextStyle(
                        color: alcoholFree.value ? Colors.grey : Colors.white,
                        fontSize: 12),
                    inactiveLabelStyle: TextStyle(
                        color: alcoholFree.value ? Colors.grey : Colors.white,
                        fontSize: 12),
                  ),
                  child: isMobile
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          verticalDirection: VerticalDirection.up,
                          children: [
                            Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Builder(builder: (context) {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 3),
                                    child: Container(
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
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
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
                                  min: 0,
                                  max: 56,
                                  interval: isMobile ? 10 : 5,
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
                                  labelPlacement: LabelPlacement.onTicks,
                                  showLabels: true,
                                  showTicks: true,
                                  enableTooltip: true,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    "Alcohol—free",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  TickButton(
                                    initialValue: false,
                                    onTap: (newValue) =>
                                        alcoholFree.value = newValue,
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  Builder(builder: (context) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 3),
                                      child: Container(
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
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
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
                                    min: 0,
                                    max: 56,
                                    interval: isMobile ? 10 : 5,
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
                                    labelPlacement: LabelPlacement.onTicks,
                                    showLabels: true,
                                    showTicks: true,
                                    enableTooltip: true,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
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
                                  onTap: () =>
                                      alcoholFree.value = !alcoholFree.value,
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
                                ),
                              ],
                            )
                          ],
                        ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            decoration: BoxDecoration(
              color: const Color(0xFF5E5E5E).withOpacity(0.5),
              border: Border.all(
                width: 3,
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Center(
                  child: Text(
                    "Cocktail taste",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CockSlider(
                      label: "Sweet",
                      onChanged: (int value) {
                        sweet.value = value;
                      },
                    ),
                    CockSlider(
                      label: "Sour",
                      onChanged: (int value) {
                        sour.value = value;
                      },
                    ),
                    CockSlider(
                      label: "Savory",
                      onChanged: (int value) {
                        savory.value = value;
                      },
                    ),
                    CockSlider(
                      label: "Bitter",
                      onChanged: (int value) {
                        bitter.value = value;
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Center(
                  child: Text(
                    "Cocktail feature",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                AdaptiveWrap(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Creamy",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        TickButton(
                          initialValue: creamy.value,
                          onTap: (newValue) => creamy.value = newValue,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Spicy",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        TickButton(
                          initialValue: spicy.value,
                          onTap: (newValue) => spicy.value = newValue,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Fruity",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        TickButton(
                          initialValue: fruity.value,
                          onTap: (newValue) => fruity.value = newValue,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: AnimatedButton(
              onTap: () {
                context.goNamed(RouteNames.pickUpResult, queryParameters: {
                  'alcohol_free': alcoholFree.value.toString(),
                  'min_alc': minStrength.value.toInt().toString(),
                  'max_alc': maxStrength.value.toInt().toString(),
                  'sweet': sweet.value.toString(),
                  'sour': sour.value.toString(),
                  'savory': savory.value.toString(),
                  'bitter': bitter.value.toString(),
                  'creamy': creamy.value.toString(),
                  'spicy': spicy.value.toString(),
                  'fruity': fruity.value.toString(),
                });
              },
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
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}

enum TasteFeature { none, cream, spice, fruit }
