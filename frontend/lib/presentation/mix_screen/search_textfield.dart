import 'package:capstone/components/dropdown_item.dart';
import 'package:capstone/domain/ingredient.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchTextField extends ConsumerStatefulWidget {
  const SearchTextField({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => SearchTextFieldState();
}

class SearchTextFieldState extends ConsumerState<SearchTextField> {
  OverlayEntry? _overlayEntry;
  final FocusNode _focusNode = FocusNode();
  final TextEditingController controller = TextEditingController();

  final List<Ingredient> ingredients = [
    Ingredient(name: 'Liquer'),
    Ingredient(name: 'Lime'),
    Ingredient(name: 'Rum'),
    Ingredient(name: 'Sugar'),
    Ingredient(name: 'Syrop'),
  ];

  @override
  void initState() {
    super.initState();
    // _focusNode.addListener(() {
    //   if (_focusNode.hasFocus && controller.text.isNotEmpty) {
    //     _overlayEntry = _createOverlayEntry();
    //     Overlay.of(context).insert(_overlayEntry!);
    //   } else {
    //     _removeOverlay();
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: _focusNode,
      controller: controller,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 24,
      ),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        suffixIcon: const Icon(
          Icons.search,
          color: Colors.white,
        ),
        hintText: 'Type your ingredient here...',
        hintStyle: TextStyle(
          color: Colors.white.withOpacity(0.52),
          fontSize: 24,
        ),
        fillColor: const Color(0xFF5E5E5E),
        filled: true,
        errorBorder: null,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 3,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 3,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 3,
          ),
        ),
        focusedErrorBorder: null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 3,
          ),
        ),
      ),
      onChanged: onChanged,
    );
  }

  void onChanged(String text) {
    if (text.isEmpty) {
      _removeOverlay();
    } else {
      _overlayEntry?.remove();
      _overlayEntry = _createOverlayEntry(
          ProviderScope.containerOf(context),
          ingredients
              .where((element) => element.name
                  .toLowerCase()
                  .replaceAll(' ', '')
                  .startsWith(text.trim().toLowerCase().replaceAll(' ', '')))
              .where(
                  (element) => !ref.read(includeListProvider).contains(element))
              .where(
                  (element) => !ref.read(excludeListProvider).contains(element))
              .toList());
      Overlay.of(context, debugRequiredFor: widget).insert(_overlayEntry!);
    }
  }

  OverlayEntry _createOverlayEntry(
      ProviderContainer parentProviderContainer, List<Ingredient> items) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);
    return OverlayEntry(
      builder: (context) => ProviderScope(
        parent: parentProviderContainer,
        child: Positioned(
          left: offset.dx,
          top: offset.dy + size.height + 5.0,
          width: size.width,
          child: Material(
            color: Colors.transparent,
            child: DropdownSearchMenu(
              items: items,
              onActionTap: () {
                controller.clear();
                _removeOverlay();
              },
            ),
          ),
        ),
      ),
    );
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}

final includeListProvider = StateProvider.autoDispose<List<Ingredient>>((ref) {
  return [];
});

final excludeListProvider = StateProvider.autoDispose<List<Ingredient>>((ref) {
  return [];
});
