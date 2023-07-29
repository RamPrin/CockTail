import 'package:capstone/data/api/api.dart';
import 'package:capstone/data/api/api_models/pick_up_result_request.dart';
import 'package:capstone/presentation/pick_result_screen/state/state_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PickResultStateNotifier extends StateNotifier<PickResultState> {
  PickResultStateNotifier(this.api, this.request)
      : super(PickResultState.loading()) {
    load();
  }

  final Api api;
  final PickUpResultRequest request;

  Future<void> load() async {
    state = PickResultState.loading();
    try {
      final cocktail = await api.pickUpCocktail(request);
      state = PickResultState.data(cocktail: cocktail);
    } on PickResultErrorReason {
      state = PickResultState.error(
          errorReason: PickResultErrorReason.nothingFound);
    } catch (e) {
      print(e.toString());
      state = PickResultState.error();
    }
  }
}

final pickResultStateNotifierProvider = StateNotifierProvider.family
    .autoDispose<PickResultStateNotifier, PickResultState, PickUpResultRequest>(
        (ref, request) {
  return PickResultStateNotifier(
    ref.read(apiProvider),
    request,
  );
});
