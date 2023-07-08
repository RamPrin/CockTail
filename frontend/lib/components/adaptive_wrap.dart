import 'package:capstone/core/utils/expansions.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AdaptiveWrap extends ConsumerWidget {
  const AdaptiveWrap({
    super.key,
    required this.children,
    this.spacing = 0,
    this.startSpacing = 0,
    this.crossStartSpacing = 0,
    this.endSpacing = 0,
    this.crossEndSpacing = 0,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  final List<Widget> children;
  final double spacing;
  final double startSpacing;
  final double crossStartSpacing;
  final double endSpacing;
  final double crossEndSpacing;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isMobile = context.isMobile;
    final childs = List<Widget>.from(children);

    for (int i = children.length - 1; i > 0; i--) {
      childs.insert(
          i,
          isMobile
              ? SizedBox(
                  height: spacing,
                )
              : SizedBox(
                  width: spacing,
                ));
    }
    if(endSpacing > 0) {
      childs.add(
        isMobile ? SizedBox(height: endSpacing) : SizedBox(width: endSpacing));
    }
    if(startSpacing > 0) {
      childs.insert(
        0,
        isMobile
            ? SizedBox(height: startSpacing)
            : SizedBox(width: startSpacing));
    }

    return isMobile
        ? Padding(
            padding: EdgeInsets.only(
                left: crossStartSpacing, right: crossEndSpacing),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: mainAxisAlignment,
              crossAxisAlignment: crossAxisAlignment,
              children: childs,
            ),
          )
        : Padding(
            padding: EdgeInsets.only(
                top: crossStartSpacing, bottom: crossEndSpacing),
            child: Row(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: mainAxisAlignment,
              crossAxisAlignment: crossAxisAlignment,
              children: childs,
            ),
          );
  }
}
