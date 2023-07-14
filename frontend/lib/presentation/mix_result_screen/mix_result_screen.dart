import 'package:capstone/components/animated_button.dart';
import 'package:capstone/components/cock_scaffold.dart';
import 'package:capstone/components/cocktail.dart';
import 'package:capstone/components/error.dart';
import 'package:capstone/core/assets/assets.dart';
import 'package:capstone/core/navigation/routes.dart';
import 'package:capstone/data/api/api_models/mixup_result_request_model.dart';
import 'package:capstone/presentation/mix_result_screen/state/notifier.dart';
import 'package:capstone/presentation/mix_result_screen/state/state_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MixResultScreen extends ConsumerWidget {
  const MixResultScreen({super.key, required this.request});

  final MixUpResultRequest request;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mixResultStateNotifierProvider(request));

    return CockScaffold(
      pageAsset: Assets.mixUp,
      child: switch (state) {
        Loading _ => const Center(
            child: CircularProgressIndicator(color: Colors.white),
          ),
        Error _ => ErrorPage(
              onRetry: () {
                ref.read(mixResultStateNotifierProvider(request).notifier).load();
              },
            ),
        Data data => Column(
            children: [
              CocktailItem(
                cocktail: data.cocktail,
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: AnimatedButton(
                  onTap: () {
                    context.goNamed(Routes.mixPage);
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
                      'Try Again',
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
      },
    );
  }
}
