import 'package:heal_tether_task/src/global_export.dart';

class UsersListWidget extends ConsumerWidget {
  const UsersListWidget({
    super.key,
  });

  @override
  Widget build(context, ref) {
    final brightness = HealTHelperFuncs.getBrightness(context);
    final inDarkMode = brightness == Brightness.dark;
    final users = ref.watch(usersProvider);
    final inFilterMode = ref.read(globalStringProvider(HealTStrings.SEARCH_KEY)).isNotEmpty;
    
    return Expanded(
      child: HealTScalingAnimatedSwitcher(
        child: users is AsyncLoading ? HealTLoadingIndicator()
        : (users.value ?? []).isEmpty ? HealTEmptyStateWidget(
          text: inFilterMode ? HealTStrings.NO_RECORDS_FOUND : null,
        )
        : ListView.builder(
          key: ValueKey(2),
          itemCount: users.value?.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (_, listIndex){
            final user = users.value?.elementAtOrNull(listIndex);
            
            return HealTContainer(
              color: inDarkMode ? HealTColors.black : HealTColors.white, 
              radius: 8,
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(15),
              border: Border.all(
                width: 0.2,
                color: inDarkMode ? HealTColors.white : HealTColors.hex1B1B1B
              ),
              child: Row(
                children: [
                  HealTContainer(
                    height: 35, width: 35,
                    color: HealTColors.black,
                    alignment: Alignment.center,
                    child: HealTImgLoader(imagePath: HealTImgStrings.AVATAR)
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HealTFilterWidget(
                          providerIdentity: HealTStrings.SEARCH_KEY,
                          title: user?.name ?? '',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          user?.email ?? '',
                          style: Theme.of(context).textTheme.labelMedium,
                        )
                      ],
                    ),
                  ),        
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}