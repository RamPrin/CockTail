import 'package:capstone/components/animated_button.dart';
import 'package:capstone/components/background.dart';
import 'package:capstone/core/assets/assets.dart';
import 'package:capstone/core/navigation/routes.dart';
import 'package:capstone/domain/ingredient.dart';
import 'package:capstone/presentation/mix_screen/search_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MixScreen extends ConsumerWidget {
  const MixScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final includeItems = ref.watch(includeListProvider);
    final excludeItems = ref.watch(excludeListProvider);

    return Background(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(Assets.mixUp),
            const SearchTextField(),
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          'Include',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFB00000).withOpacity(0.5),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Colors.white,
                                width: 4,
                              ),
                            ),
                            child: ListView.separated(
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      includeItems[index].name,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 24),
                                    ),
                                    AnimatedButton(
                                      child: const Icon(
                                        Icons.cancel,
                                        color: Colors.white,
                                      ),
                                      onTap: () {
                                        ref.read(includeListProvider.notifier).update((state) {
                                          final st = List<Ingredient>.from(state);
                                          st.removeWhere((element) => element.name == includeItems[index].name);
                                          return st;
                                        });
                                      },
                                    )
                                  ],
                                ),
                              ),
                              separatorBuilder: (context, index) =>
                                  const Divider(
                                color: Colors.white,
                              ),
                              itemCount: includeItems.length,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          'Exclude',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Colors.white,
                                width: 4,
                              ),
                            ),
                            child: ListView.separated(
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      excludeItems[index].name,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                      ),
                                    ),
                                    AnimatedButton(
                                      child: const Icon(
                                        Icons.cancel,
                                        color: Colors.white,
                                      ),
                                      onTap: () {
                                        ref.read(excludeListProvider.notifier).update((state) {
                                          final st = List<Ingredient>.from(state);
                                          st.removeWhere((element) => element.name == excludeItems[index].name);
                                          return st;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              separatorBuilder: (context, index) =>
                                  const Divider(
                                color: Colors.white,
                              ),
                              itemCount: excludeItems.length,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            AnimatedButton(
              onTap: () => context.goNamed(Routes.mixResultPage),
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
                  'Mix Up!',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
