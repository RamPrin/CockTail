import 'package:capstone/presentation/mix_screen/components/dropdown_item.dart';
import 'package:capstone/domain/ingredient.dart';
import 'package:capstone/presentation/mix_screen/state/notifier.dart';
import 'package:capstone/presentation/mix_screen/state/state_model.dart';
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
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _overlayEntry = _createOverlayEntry();
        Overlay.of(context).insert(_overlayEntry!);
      } else {
        _removeOverlay();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTapOutside: (event) {
        
      },
      focusNode: _focusNode,
      controller: _controller,
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
    _overlayEntry?.remove();
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context, debugRequiredFor: widget).insert(_overlayEntry!);
  }

  OverlayEntry _createOverlayEntry() {
    final state = ref.read(mixScreenStateNotifierProvider);
    final items = switch (state) {
      Loading _ => <Ingredient>[],
      Error _ => <Ingredient>[],
      Data data =>
        _filterItemsByQuery(data.getFreeIngredients(), _controller.text),
    };

    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);
    return OverlayEntry(
      builder: (context) => ProviderScope(
        parent: ProviderScope.containerOf(this.context),
        child: Positioned(
          left: offset.dx,
          top: offset.dy + size.height + 5.0,
          width: size.width,
          child: Material(
            color: Colors.transparent,
            child: DropdownSearchMenu(
              items: items,
              onActionTap: () {
                _controller.clear();
                _removeOverlay();
              },
            ),
          ),
        ),
      ),
    );
  }

  List<Ingredient> _filterItemsByQuery(List<Ingredient> items, String query) {
    if (query.isEmpty) {
      return items;
    } else {
      return items.where((element) => element.followsQuery(query)).toList();
    }
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    _overlayEntry?.dispose();
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}
