import 'package:capstone/components/background.dart';
import 'package:capstone/components/header.dart';
import 'package:capstone/core/utils/expansions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CockScaffold extends HookConsumerWidget {
  const CockScaffold({
    super.key,
    required this.pageAsset,
    required this.child,
  });

  final Widget child;
  final String pageAsset;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = context.isMobile;

     final scrollController = useScrollController();

    useValueChanged(MediaQuery.of(context).size,
        (_, __) => FocusManager.instance.primaryFocus?.unfocus());

    final scrollCallback = useCallback(
        () => scrollController.addListener(() {
              FocusManager.instance.primaryFocus?.unfocus();
            }),
        [scrollController]);

    useEffect(() {
      scrollController.addListener(scrollCallback);
      return () => scrollController.removeListener(scrollCallback);
    }, [scrollController]);

    return Material(
      child: Background(
        child: ListView(
          controller: scrollController,
          children: [
            CockHeader(pageAsset: pageAsset),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 100),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
