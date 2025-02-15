import 'package:heal_tether_task/src/global_export.dart';
import 'package:flutter/services.dart';

class HealTAnnotatedRegion extends StatelessWidget {
  final Widget child;

  const HealTAnnotatedRegion({
    super.key,
    required this.child,
  });

  @override
  Widget build(context) {
    final brightness = HealTHelperFuncs.getBrightness(context);
    final inDarkMode = brightness == Brightness.dark;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: !inDarkMode ? HealTColors.white : HealTColors.black,
        statusBarColor: inDarkMode ? HealTColors.white : HealTColors.black,
        statusBarIconBrightness: brightness,
        systemNavigationBarIconBrightness: brightness,
      ),
      child: child
    );
  }
}