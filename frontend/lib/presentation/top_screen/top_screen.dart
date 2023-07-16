import 'package:capstone/components/animated_button.dart';
import 'package:capstone/components/background.dart';
import 'package:capstone/components/cocktail.dart';
import 'package:capstone/components/error.dart';
import 'package:capstone/components/header.dart';
import 'package:capstone/core/assets/assets.dart';
import 'package:capstone/core/utils/expansions.dart';
import 'package:capstone/presentation/top_screen/state/notifier.dart';
import 'package:capstone/presentation/top_screen/state/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TopScreen extends HookConsumerWidget {
  const TopScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controller = usePageController();

    final page = useState(0);
    controller.addListener(() {
      page.value = controller.page?.toInt() ?? 0;
    });

    final state = ref.watch(topScreenStateNotifierProvider);

    return Background(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Column(
            mainAxisAlignment: switch (state) {
              Error _ || Loading _ => MainAxisAlignment.start,
              Data _ => MainAxisAlignment.spaceBetween
            },
            children: [
              const CockHeader(
                pageAsset: Assets.top10,
              ),
              ...switch (state) {
                Loading _ => [Image.asset(Assets.bookLoad,height: 100,)],
                Error _ => [
                    ErrorPage(
                      onRetry: () {
                        ref
                            .read(topScreenStateNotifierProvider.notifier)
                            .load();
                      },
                    )
                  ],
                Data data => [
                    Expanded(
                      child: LayoutBuilder(builder: (context, constraints) {
                        print("meow" + constraints.maxHeight.toString());
                        return PageView.builder(
                          controller: controller,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: data.cocktails.length,
                          itemBuilder: (context, index) => Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 100),
                            child: CocktailItem(
                              cocktail: data.cocktails[index],
                              fillImageWithPlaceholder: false,
                              image: data.images.containsKey(index)
                                  ? data.images[index]
                                  : null,
                              height: constraints.maxHeight,
                            ),
                          ),
                        );
                      }),
                    ),
                    Center(
                      child: SizedBox(
                        width: !context.isMobile
                            ? MediaQuery.of(context).size.width / 2
                            : MediaQuery.of(context).size.width * 0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AnimatedButton(
                              onTap: () => controller.previousPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeOut,
                              ),
                              child: SvgPicture.asset(Assets.arrow),
                            ),
                            ...data.cocktails.indexed
                                .map(
                                  (e) => Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: e.$1 == page.value
                                          ? Colors.white
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(100),
                                      border: e.$1 == page.value
                                          ? null
                                          : Border.all(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                    ),
                                  ),
                                )
                                .toList(),
                            RotatedBox(
                              quarterTurns: 2,
                              child: AnimatedButton(
                                onTap: () => controller.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeOut,
                                ),
                                child: SvgPicture.asset(Assets.arrow),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
              }
            ],
          ),
        ),
      ),
    );
  }
}
