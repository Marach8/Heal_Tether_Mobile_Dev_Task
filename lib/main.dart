import 'dart:ui';
import 'package:heal_tether_task/src/global_export.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: HealTApp()));
}


class HealTApp extends StatelessWidget {
  const HealTApp({super.key});

  @override
  Widget build(context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaler: const TextScaler.linear(0.83),
      ),
      child: MaterialApp(
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
          },
        ),
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        darkTheme: HealTThemeData.darkTheme,
        theme: HealTThemeData.lightTheme,
        home: const HealTHomeScreen(),
      ),
    );
  }
}