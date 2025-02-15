import 'package:heal_tether_task/src/global_export.dart';

class HealTTextTheme{
  const HealTTextTheme._();

  static TextTheme lightTextTheme = TextTheme( 
    headlineMedium: TextStyle(
      color: HealTColors.hex1B1B1B,
      fontSize: HealTFontSizes.size20,
      fontWeight: HealTFontWeights.w700,
      overflow: TextOverflow.ellipsis,
    ),


    titleSmall: TextStyle(
      color: HealTColors.hex1B1B1B,
      fontSize: HealTFontSizes.size16,
      fontWeight: HealTFontWeights.w500,
      overflow: TextOverflow.ellipsis,
    ),

    
    bodySmall: TextStyle(
      color: HealTColors.hex1B1B1B,
      fontSize: HealTFontSizes.size14,
      fontWeight: HealTFontWeights.w500,
      overflow: TextOverflow.ellipsis,
    ),
    
    labelMedium: TextStyle(
      color: HealTColors.hex1B1B1B,
      fontSize: HealTFontSizes.size12,
      fontWeight: HealTFontWeights.w400,
      overflow: TextOverflow.ellipsis,
    ),
  );



  static TextTheme darkTextTheme = TextTheme( 

    headlineMedium: TextStyle(
      color: HealTColors.white,
      fontSize: HealTFontSizes.size20,
      fontWeight: HealTFontWeights.w700,
      overflow: TextOverflow.ellipsis,
    ),

    titleSmall: TextStyle(
      color: HealTColors.white,
      fontSize: HealTFontSizes.size16,
      fontWeight: HealTFontWeights.w500,
      overflow: TextOverflow.ellipsis,
    ),

    bodySmall: TextStyle(
      color: HealTColors.white,
      fontSize: HealTFontSizes.size14,
      fontWeight: HealTFontWeights.w500,
      overflow: TextOverflow.ellipsis,
    ),

    labelMedium: TextStyle(
      color: HealTColors.white,
      fontSize: HealTFontSizes.size10,
      fontWeight: HealTFontWeights.w400,
      overflow: TextOverflow.ellipsis,
    ),
  );

}