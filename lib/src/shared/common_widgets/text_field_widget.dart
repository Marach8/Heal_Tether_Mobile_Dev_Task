import 'package:heal_tether_task/src/global_export.dart';
import 'package:iconsax/iconsax.dart';

class HealTTextField extends ConsumerWidget {
  final bool? enabled;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final String? hintText;
  const HealTTextField({
    super.key,
    this.enabled,
    this.onChanged,
    this.hintText,
    this.suffixIcon
  });

  @override
  Widget build(context, ref) {
    final brightness = HealTHelperFuncs.getBrightness(context);
    final inDarkMode = brightness == Brightness.dark;

    return TextField(
      enabled: enabled, 
      cursorColor: inDarkMode ? HealTColors.white : HealTColors.hex1B1B1B,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: const Icon(Iconsax.search_normal_14, size: 20),
        suffixIcon: suffixIcon
      ),
    );
  }
}



