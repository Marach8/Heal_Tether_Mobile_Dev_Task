import 'dart:async';
import 'package:heal_tether_task/src/global_export.dart';

class HealTHelperFuncs{
  const HealTHelperFuncs._();

  static double getScreenWidth (BuildContext context)
    => MediaQuery.sizeOf(context).width;
  
  static double getScreenHeight (BuildContext context)
    => MediaQuery.sizeOf(context).height;

  static Brightness getBrightness(BuildContext context)
    => MediaQuery.platformBrightnessOf(context);


  static ProviderContainer getRef(BuildContext context) 
    => ProviderScope.containerOf(context, listen: false);


  static setAProvider({
    BuildContext? context,
    required StateProvider provider,
    required dynamic value,
    WidgetRef? widgetRef,
    Ref? ref,
    int? duration
  }){
    dynamic reference;
    if(widgetRef != null){
      reference = widgetRef;
    }
    else if(ref != null){
      reference = ref;
    }
    else{
      reference = getRef(context!);
    }
    Future.delayed(
      Duration(milliseconds: duration ?? 0),
      () => reference.read(provider.notifier).state = value
    );
  }


  static Timer? _debounce;
  static void callDebouncer(int duration, Function func, [List<dynamic>? args]) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(
      Duration(milliseconds: duration),
      () {
        if (args != null) {Function.apply(func, args);}
        else {func();}
      }
    );
  }

  static void disposeDebouncer() {
    _debounce?.cancel();
  }

}