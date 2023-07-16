import 'package:capstone/data/api/api.dart';
import 'package:capstone/presentation/top_screen/state/state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TopScreenStateNotifier extends StateNotifier<TopScreenState> {
  TopScreenStateNotifier(this.api) : super(TopScreenState.loading()) {
    load();
  }

  final Api api;

  Future<void> load() async {
    state = TopScreenState.loading();
    try {
      final cocktails = await api.getTopCocktails();
      final imagesMap = <int, Image>{};
      try {
        final imgs = await Future.wait(
          cocktails.indexed.map((element) => loadImage(element.$1)),
          cleanUp: (successValue) =>
              imagesMap[successValue.$1] = successValue.$2,
        );
        for (var element in imgs) {
          imagesMap[element.$1] = element.$2;
        }
      } catch (_) {
      } finally {
        state = TopScreenState.data(
          cocktails: cocktails,
          images: imagesMap,
        );
      }
    } catch (e) {
      print(e.toString());
      state = TopScreenState.error();
    }
  }

  Future<(int, Image)> loadImage(int id) async {
    return (id, await api.getTopCocktailImage(id));
  }
}

final topScreenStateNotifierProvider =
    StateNotifierProvider.autoDispose<TopScreenStateNotifier, TopScreenState>(
        (ref) {
  return TopScreenStateNotifier(
    ref.read(apiProvider),
  );
});
