import 'package:heal_tether_task/src/global_export.dart';

abstract interface class HomeRepo {

  Future<ApiResponse<UsersResponseModel>> fetchUsers();

}