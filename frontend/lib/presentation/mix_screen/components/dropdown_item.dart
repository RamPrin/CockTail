import 'package:capstone/components/animated_button.dart';
import 'package:capstone/domain/ingredient.dart';
import 'package:capstone/presentation/mix_screen/state/notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DropdownSearchMenu extends ConsumerWidget {
  const DropdownSearchMenu({super.key, required this.items, this.onActionTap});

  final VoidCallback? onActionTap;

  final List<Ingredient> items;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: const Color(0xFF5E5E5E),
        border: Border.all(
          color: Colors.white,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: items.isEmpty
          ? const Center(
              child: Text(
                "No such ingredient",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            )
          : ListView.separated(
              itemBuilder: (context, index) => DropdownItem(
                item: items[index],
                onActionTap: onActionTap,
              ),
              separatorBuilder: (context, index) =>
                  const Divider(color: Colors.white),
              itemCount: items.length,
            ),
    );
  }
}

class DropdownItem extends ConsumerWidget {
  const DropdownItem({super.key, required this.item, this.onActionTap});

  final Ingredient item;
  final VoidCallback? onActionTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Text(
            item.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const Spacer(),
          AnimatedButton(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFFB00000),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            onTap: () {
              ref.read(mixScreenStateNotifierProvider.notifier).include(item);
              onActionTap?.call();
            },
          ),
          const SizedBox(
            width: 10,
          ),
          AnimatedButton(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFF1A1D1D),
                ),
                child: const Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                ref.read(mixScreenStateNotifierProvider.notifier).exclude(item);
                onActionTap?.call();
              })
        ],
      ),
    );
  }
}
