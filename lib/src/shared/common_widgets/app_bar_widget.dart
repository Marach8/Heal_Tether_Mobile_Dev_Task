import 'package:heal_tether_task/src/global_export.dart';

class HealTAppBar extends StatelessWidget implements PreferredSizeWidget{
  final List<Widget>? actions;
  final Widget? title, flexibleSpace, leading;
  final bool? centerTitle;
  final PreferredSizeWidget? bottom;
  final Color? backgroundColor;
  final double? leadingWidth;


  const HealTAppBar({
    super.key,
    this.actions,
    this.title,
    this.centerTitle,
    this.bottom,
    this.leading,
    this.flexibleSpace,
    this.backgroundColor,
    this.leadingWidth
  });

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: AppBar(
        backgroundColor: backgroundColor,
        flexibleSpace: flexibleSpace,
        automaticallyImplyLeading: false,
        centerTitle: centerTitle,
        leading: leading,
        leadingWidth: leadingWidth ?? 40,
        title: title,
        actions: actions,
        bottom: bottom,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); 
}
