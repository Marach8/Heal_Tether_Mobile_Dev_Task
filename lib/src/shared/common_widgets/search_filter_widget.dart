import 'package:heal_tether_task/src/global_export.dart';

class HealTFilterWidget extends ConsumerWidget {
  final String title;
  final String providerIdentity;
  final TextStyle? style;
  final String? padLeft, padRight;

  const HealTFilterWidget({
    super.key,
    required this.title,
    required this.providerIdentity,
    required this.style,
    this.padLeft, 
    this.padRight
  });

  @override
  Widget build(context, ref) {
    final searchQuery = ref.watch(globalStringProvider(providerIdentity));
    final listOfStrings = title.trim().split('');

    return Text.rich(
      TextSpan(
        children: [
          if(padLeft != null) TextSpan(
            text: padLeft,
            style:style                              
          ),
          ...listOfStrings.map(
            (stringOfText){
              final shouldHighlightString = searchQuery.contains(stringOfText.toLowerCase());
              return TextSpan(
                text: stringOfText,
                style: shouldHighlightString ? style?.copyWith(
                  color: HealTColors.yellow
                ) : style                              
              );
            }
          ),
          if(padRight != null) TextSpan(
            text: padRight,
            style:style                              
          ),
        ]
      )
    );
  }
}