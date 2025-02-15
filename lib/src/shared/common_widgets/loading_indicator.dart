import 'package:heal_tether_task/src/global_export.dart';

class HealTLoadingIndicator extends StatelessWidget {
  final double? size, strokeWidth;
  const HealTLoadingIndicator({
    super.key,
    this.size,
    this.strokeWidth
  });

  @override
  Widget build(BuildContext context) {
    final brightness = HealTHelperFuncs.getBrightness(context);
    final inDarkMode = brightness == Brightness.dark;
    return SizedBox(
      height: size, width: size,
      child: FittedBox(
        fit: BoxFit.cover,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth ?? 2,
          strokeCap: StrokeCap.round,
          backgroundColor: HealTColors.transparent,
          color: inDarkMode ? HealTColors.white : HealTColors.hex1B1B1B
        ),
      ),
    );
  }
}