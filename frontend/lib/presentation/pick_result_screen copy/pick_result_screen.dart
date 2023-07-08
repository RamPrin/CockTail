import 'package:capstone/components/animated_button.dart';
import 'package:capstone/components/cock_scaffold.dart';
import 'package:capstone/components/cocktail.dart';
import 'package:capstone/core/assets/assets.dart';
import 'package:capstone/data/api/api_models/pick_up_result_request.dart';
import 'package:capstone/presentation/pick_result_screen%20copy/state/notifier.dart';
import 'package:capstone/presentation/pick_result_screen%20copy/state/state_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PickResultScreen extends ConsumerWidget {
  const PickResultScreen({super.key, required this.request});

  final PickUpResultRequest request;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(pickResultStateNotifierProvider(request));

    return CockScaffold(
      pageAsset: Assets.pickUp,
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
                    ref
                        .read(pickResultStateNotifierProvider(request).notifier)
                        .load();
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
