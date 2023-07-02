import 'package:capstone/data/api/api.dart';
import 'package:capstone/data/api/api_models/mixup_result_request_model.dart';
import 'package:capstone/presentation/mix_result_screen/state/state_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MixResultStateNotifier extends StateNotifier<MixResultState> {
  MixResultStateNotifier(this.api, this.request)
      : super(MixResultState.loading()) {
    load();
  }

  final Api api;
  final MixUpResultRequest request;

  Future<void> load() async {
    state = MixResultState.loading();
    try {
      final cocktail = await api.createCocktail(request);
      state = MixResultState.data(cocktail: cocktail);
    } catch (e) {
      print(e.toString());
      state = MixResultState.error();
    }
  }
}

final mixResultStateNotifierProvider = StateNotifierProvider.family
    .autoDispose<MixResultStateNotifier, MixResultState, MixUpResultRequest>(
        (ref, request) {
  return MixResultStateNotifier(
    ref.read(apiProvider),
    request,
  );
});
