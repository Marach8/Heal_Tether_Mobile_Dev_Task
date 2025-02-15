import 'package:heal_tether_task/src/global_export.dart';

class HealTEmptyStateWidget extends StatelessWidget {
  const HealTEmptyStateWidget({super.key, this.imageHeight, this.text});

  final double? imageHeight;
  final String? text;
  @override
  Widget build(context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HealTImgLoader(
            imagePath: HealTImgStrings.EMPTY_STATE,
            height: imageHeight ?? 200,
          ),
          const SizedBox(height: 20),
          Text(
            textAlign: TextAlign.center,
            text ?? HealTStrings.DATA_UNAVAILABLE,
            style: Theme.of(context).textTheme.titleMedium
          )
        ],
      ),
    );
  }
}

