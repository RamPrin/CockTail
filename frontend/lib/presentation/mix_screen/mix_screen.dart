import 'package:capstone/components/animated_button.dart';
import 'package:capstone/components/background.dart';
import 'package:capstone/core/assets/assets.dart';
import 'package:capstone/core/navigation/routes.dart';
import 'package:capstone/core/utils/expansions.dart';
import 'package:capstone/data/api/api_consts.dart';
import 'package:capstone/domain/ingredient.dart';
import 'package:capstone/presentation/mix_screen/components/search_textfield.dart';
import 'package:capstone/presentation/mix_screen/state/notifier.dart';
import 'package:capstone/presentation/mix_screen/state/state_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MixScreen extends HookConsumerWidget {
  const MixScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mixScreenStateNotifierProvider);
    final isMobile = context.isMobile;
    final s = MediaQuery.of(context).size.height * 0.45;

    final scrollController = useScrollController();

    useValueChanged(MediaQuery.of(context).size,
        (_, __) => FocusManager.instance.primaryFocus?.unfocus());

    final scrollCallback = useCallback(
        () => scrollController.addListener(() {
              FocusManager.instance.primaryFocus?.unfocus();
            }),
        [scrollController]);

    useEffect(() {
      scrollController.addListener(scrollCallback);
      return () => scrollController.removeListener(scrollCallback);
    }, [scrollController]);

    return Background(
        child: switch (state) {
      Loading _ => const Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      Error _ => const Center(
          child: Text(
            "Error",
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
            ),
          ),
        ),
      Data data => isMobile
          ? ListView(
              controller: scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 100),
              children: [
                SvgPicture.asset(Assets.mixUp),
                const SearchTextField(),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
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
                    Container(
                      height: 200,
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
                                data.included.toList()[index].name,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 24),
                              ),
                              AnimatedButton(
                                child: const Icon(
                                  Icons.cancel,
                                  color: Colors.white,
                                ),
                                onTap: () {
                                  _remove(ref, data.included.toList()[index]);
                                },
                              )
                            ],
                          ),
                        ),
                        separatorBuilder: (context, index) => const Divider(
                          color: Colors.white,
                        ),
                        itemCount: data.included.length,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
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
                    Container(
                      height: 200,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                data.excluded.toList()[index].name,
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
                                  _remove(ref, data.excluded.toList()[index]);
                                },
                              ),
                            ],
                          ),
                        ),
                        separatorBuilder: (context, index) => const Divider(
                          color: Colors.white,
                        ),
                        itemCount: data.excluded.length,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                )
              ],
            )
          : ListView(
              controller: scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 100),
              children: [
                SvgPicture.asset(Assets.mixUp),
                const SearchTextField(),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
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
                          Container(
                            height: s,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        data.included.toList()[index].name,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 24),
                                      ),
                                    ),
                                    AnimatedButton(
                                      child: const Icon(
                                        Icons.cancel,
                                        color: Colors.white,
                                      ),
                                      onTap: () {
                                        _remove(
                                            ref, data.included.toList()[index]);
                                      },
                                    )
                                  ],
                                ),
                              ),
                              separatorBuilder: (context, index) =>
                                  const Divider(
                                color: Colors.white,
                              ),
                              itemCount: data.included.length,
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
                        mainAxisSize: MainAxisSize.min,
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
                          Container(
                            height: s,
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
                                    Expanded(
                                      child: Text(
                                        data.excluded.toList()[index].name,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                        ),
                                      ),
                                    ),
                                    AnimatedButton(
                                      child: const Icon(
                                        Icons.cancel,
                                        color: Colors.white,
                                      ),
                                      onTap: () {
                                        _remove(
                                            ref, data.excluded.toList()[index]);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              separatorBuilder: (context, index) =>
                                  const Divider(
                                color: Colors.white,
                              ),
                              itemCount: data.excluded.length,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: AnimatedButton(
                    onTap: () => context.goNamed(
                      Routes.mixResultPage,
                      queryParameters: {
                        'include': data.included.map((e) => e.name).toList(),
                        "exclude": data.excluded.map((e) => e.name).toList(),
                      },
                    ),
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
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
    });
  }

  void _remove(WidgetRef ref, Ingredient ingredient) {
    ref.read(mixScreenStateNotifierProvider.notifier).remove(ingredient);
  }
}
