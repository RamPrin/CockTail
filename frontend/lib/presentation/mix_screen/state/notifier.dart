import 'package:capstone/data/api/api.dart';
import 'package:capstone/domain/ingredient.dart';
import 'package:capstone/presentation/mix_screen/state/state_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MixScreenStateNotifier extends StateNotifier<MixScreenState> {
  MixScreenStateNotifier(this.api) : super(MixScreenState.loading()) {
    load();
  }

  final Api api;

  late final List<Ingredient> items;
  final Set<Ingredient> included = {};
  final Set<Ingredient> excluded = {};

  Future<void> load() async {
    state = MixScreenState.loading();
    try {
      items = await api.getIngredients();
      _releaseDataState();
    } catch (e) {
      print(e.toString());
      state = MixScreenState.error();
    }
  }

  void include(Ingredient ingredient) {
    included.add(ingredient);
    _releaseDataState();
  }

  void exclude(Ingredient ingredient) {
    excluded.add(ingredient);
    _releaseDataState();
  }

  void remove(Ingredient ingredient) {
    included.remove(ingredient);
    excluded.remove(ingredient);
    _releaseDataState();
  }

  void _releaseDataState() {
    state = MixScreenState.data(
      items: items,
      included: included,
      excluded: excluded,
    );
  }

}

extension IngredientsDifference on Data {
  List<Ingredient> getFreeIngredients() {
    return items
        .where((element) => !included.contains(element))
        .where((element) => !excluded.contains(element))
        .toList();
  }
}

final mixScreenStateNotifierProvider =
    StateNotifierProvider.autoDispose<MixScreenStateNotifier, MixScreenState>(
        (ref) {
  return MixScreenStateNotifier(
    ref.read(apiProvider),
  );
});
