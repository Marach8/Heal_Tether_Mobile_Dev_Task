import 'dart:convert';
import 'package:heal_tether_task/src/global_export.dart';

final homeRepoProvider = Provider<HomeRepoImpl>((ref){
  final networkService = ref.read(networkServiceProvider);
  return HomeRepoImpl(networkService, ref);
});


class HomeRepoImpl implements HomeRepo {
  HomeRepoImpl(this.networkService, this.ref);

  final NetworkService networkService;
  final Ref ref;


  @override
  Future<ApiResponse<UsersResponseModel>> fetchUsers() async{
    try {
      final response = await networkService.get(HealTUrls.USERS);

      return Successful(
        data: UsersResponseModel.fromJson(jsonDecode(response.body)),
      );
    } catch (e) {
      return Error(error: HealTException.getException(e));
    }
  }
}
