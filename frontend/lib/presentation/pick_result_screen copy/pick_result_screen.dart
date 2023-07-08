import 'package:capstone/components/background.dart';
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
      Data data => CocktailItem(cocktail: data.cocktail)
    });
  }
}
