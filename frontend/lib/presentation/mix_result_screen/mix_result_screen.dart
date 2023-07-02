import 'package:capstone/components/background.dart';
import 'package:capstone/components/cocktail.dart';
import 'package:capstone/data/api/api_models/mixup_result_request_model.dart';
import 'package:capstone/presentation/mix_result_screen/state/notifier.dart';
import 'package:capstone/presentation/mix_result_screen/state/state_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MixResultScreen extends ConsumerWidget {
  const MixResultScreen({super.key, required this.request});

  final MixUpResultRequest request;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mixResultStateNotifierProvider(request));

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
      Data data => CocktailItem(cocktail: data.cocktail)
    });
  }
}
