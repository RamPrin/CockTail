import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class CockSlider extends HookConsumerWidget {
  const CockSlider({super.key, required this.onChanged,required this.label,this.initialValue = 5});

  final int initialValue;

  final Function(int value) onChanged;

  final String label;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = useState(initialValue);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 30,),
        SfSliderTheme(
          data: SfSliderThemeData(
              thumbColor: const Color(0xFFF5F5F5),
              overlayRadius: 0,
              activeTrackColor: const Color(0xFFB00000).withOpacity(0.8),
              inactiveTrackColor: const Color(0xFF5E5E5E).withOpacity(0.54),
              activeTrackHeight: 18,
              inactiveTrackHeight: 18,
              disabledActiveTrackColor:
                  const Color(0xFFB00000).withOpacity(0.2),
              disabledInactiveTrackColor: Colors.transparent,
              trackCornerRadius: 0,
              activeTickColor: Colors.white,
              inactiveTickColor: Colors.white,
              tickSize: const Size(12, 3),
              tickOffset: const Offset(-18, 0)),
          child: SizedBox(
            height: 200,
            width: 70,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Builder(builder: (context) {
                  return Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        height: 10,
                        width: 18,
                        decoration: BoxDecoration(
                          color: const Color(0xFFB00000).withOpacity(0.8),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(100),
                            bottomRight: Radius.circular(100),
                          ),
                        ),
                      ),
                      Container(
                        width: 18 + 6,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          // color: const Color(0xFF5E5E5E),
                          border: Border.all(
                            width: 3,
                            color: Colors.white,
                          ),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(100),
                            bottomRight: Radius.circular(100),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
                SfSlider.vertical(
                  value: value.value,
                  stepSize: 1,
                  max: 10,
                  min: 1,
                  thumbShape: _SfThumbShape(),
                  onChanged: (newValue) {
                    value.value = newValue;
                    onChanged.call(newValue.toInt());
                  },
                  showTicks: true,
                  interval: 1,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _SfThumbShape extends SfThumbShape {
  @override
  void paint(PaintingContext context, Offset center,
      {required RenderBox parentBox,
      required RenderBox? child,
      required SfSliderThemeData themeData,
      SfRangeValues? currentValues,
      dynamic currentValue,
      required Paint? paint,
      required Animation<double> enableAnimation,
      required TextDirection textDirection,
      required SfThumb? thumb}) {
    final Path path = Path();
    center -= Offset(themeData.activeTrackHeight / 2 + 6, 0);
    path.moveTo(center.dx, center.dy);
    path.lineTo(center.dx - 15, center.dy + 10);
    path.lineTo(center.dx - 15, center.dy - 10);
    path.close();
    context.canvas.drawPath(
        path,
        Paint()
          ..color = themeData.thumbColor!
          ..style = PaintingStyle.fill
          ..strokeWidth = 2);
    context.canvas.drawPath(
        path,
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3);
  }
}
