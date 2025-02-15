import 'package:heal_tether_task/src/global_export.dart';
import 'package:another_flushbar/flushbar.dart';

Future<dynamic> showAppNotification({
  required BuildContext context,
  required Widget? icon,
  required String text,
  int? duration,
  Color? bgColor
}) async {
  return await Flushbar(
    backgroundColor: HealTColors.transparent,
    flushbarPosition: FlushbarPosition.TOP,
    duration: Duration(seconds: duration ?? 5),
    messageText: Center(
      child: HealTContainer(
        radius: 10, color: bgColor ?? HealTColors.red,
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if(icon != null) icon,
            if(icon != null) const SizedBox(width: 10),
            Flexible(
              child: Text(
                text, maxLines: 2,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    ),
  ).show(context);
}