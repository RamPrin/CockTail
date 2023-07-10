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
    try {
      final cocktails = await api.getTopCocktails();
      state = TopScreenState.data(cocktails: cocktails);
    } catch (e) {
      print(e.toString());
      state = TopScreenState.error();
    }
    if (state is Data) {
      for (int i = 0; i < (state as Data).cocktails.length; i++) {
        loadImage(i);
      }
    }
  }

  Future<void> loadImage(int id) async {
    print("loading $id");
    try {
      final img = await api.getTopCocktailImage(id);

      final oldImages = (state as Data).images;
      final newImages = Map<int, Image>.from(oldImages);
      newImages[id] = img;

      state = (state as Data).copyWith(images: newImages);
    } catch (e) {
      print(e.toString());
    }
  }
}

final topScreenStateNotifierProvider =
    StateNotifierProvider.autoDispose<TopScreenStateNotifier, TopScreenState>(
        (ref) {
  return TopScreenStateNotifier(
    ref.read(apiProvider),
  );
});
