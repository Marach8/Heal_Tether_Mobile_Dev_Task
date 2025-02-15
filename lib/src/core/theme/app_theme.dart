import 'package:heal_tether_task/src/global_export.dart';

class HealTThemeData{
  const HealTThemeData._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: HealTStrings.AXIFORMA,
    brightness: Brightness.light,
    scaffoldBackgroundColor: HealTColors.white,
    textTheme: HealTTextTheme.lightTextTheme,
    inputDecorationTheme: HealTInputDecorationTheme.lightInputDecorationTheme,
    appBarTheme: HealTAppBarTheme.lightAppBarTheme,
  );


  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: HealTStrings.AXIFORMA,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: HealTColors.black,
    textTheme: HealTTextTheme.darkTextTheme,
    inputDecorationTheme: HealTInputDecorationTheme.darkInputDecorationTheme,
    appBarTheme: HealTAppBarTheme.darkAppBarTheme,
  );
}
