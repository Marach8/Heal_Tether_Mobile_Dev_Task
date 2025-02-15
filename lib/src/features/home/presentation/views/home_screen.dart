import 'package:heal_tether_task/src/global_export.dart';
import 'package:heal_tether_task/src/shared/common_widgets/text_field_widget.dart';

class HealTHomeScreen extends ConsumerStatefulWidget {
  const HealTHomeScreen({super.key});

  @override
  ConsumerState<HealTHomeScreen> createState() => _HealTHomeScreenState();
}

class _HealTHomeScreenState extends ConsumerState<HealTHomeScreen> {
  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _performInitializations());
  }

  void _performInitializations()async{
    final response = await ref.read(usersProvider.notifier).fetchUsers();
    if(mounted && !response.isSuccessful!){
      showAppNotification(
        context: context,
        icon: Icon(Icons.warning),
        text: response.responseMessage ?? HealTStrings.ERR_OCCURED
      );
    }
  }


  @override
  void dispose(){
    HealTHelperFuncs.disposeDebouncer();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return HealTAnnotatedRegion(
      child: GestureDetector(
        onVerticalDragUpdate: (details) async{
          final inFilterMode = ref.read(globalStringProvider(HealTStrings.SEARCH_KEY)).isNotEmpty;
          if (!inFilterMode && details.primaryDelta! > 0){
            final response = await ref.read(usersProvider.notifier).fetchUsers();
            if(context.mounted && !response.isSuccessful!){
              showAppNotification(
                context: context,
                icon: Icon(Icons.warning,),
                text: response.responseMessage ?? HealTStrings.ERR_OCCURED
              );
            }
          }
        },
        child: Scaffold(
          appBar: HealTAppBar(
            title: Text(
              HealTStrings.ALL_USERS,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer(
                  builder: (_, ref1, __) {
                    bool enabled = true;
                    final users = ref.watch(usersProvider);
                    final inFilterMode = ref.read(globalStringProvider(HealTStrings.SEARCH_KEY)).isNotEmpty;
                    
                    //We want to disable the textField only when we are loading and 
                    //when we weren't able to fetch data from the fetchUsers api call
                    if(users is AsyncLoading){enabled = false;}
                    else if((users.value ?? []).isEmpty && !inFilterMode){enabled = false;}
                    
                    return HealTScalingAnimatedSwitcher(
                      child: HealTTextField(
                        enabled: enabled,
                        hintText: HealTStrings.ENETER_SEARCH_KEY,
                        onChanged: (text) => HealTHelperFuncs.callDebouncer(
                          200,
                          () => ref.read(usersProvider.notifier).filterUsers(text)
                        )
                      ),
                    );
                  }
                ),
                    
                const SizedBox(height: 20),
                const UsersListWidget(),
              ],
            ),
          )
        ),
      ),
    );
  }
}
