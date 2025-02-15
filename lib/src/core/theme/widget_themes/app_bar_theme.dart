import 'package:heal_tether_task/src/global_export.dart';

class HealTAppBarTheme{
  const HealTAppBarTheme._();

  static AppBarTheme lightAppBarTheme = AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: true,
    backgroundColor: HealTColors.white,
    titleTextStyle: TextStyle(
      color: HealTColors.hex1B1B1B,
      fontSize: HealTFontSizes.size16,
      fontWeight: HealTFontWeights.w500,
      overflow: TextOverflow.ellipsis,
    ),
  );


  static AppBarTheme darkAppBarTheme = AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: true,
    backgroundColor: HealTColors.black,
    titleTextStyle: TextStyle(
      color: HealTColors.white,
      fontSize: HealTFontSizes.size16,
      fontWeight: HealTFontWeights.w500,
      overflow: TextOverflow.ellipsis,
    ),
  );
}
