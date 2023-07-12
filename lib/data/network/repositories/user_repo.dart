import '../../local/storagea_repository.dart';
import '../../models/universal_response.dart';
import '../../models/user/user_model.dart';
import '../api_provider.dart';

class UserRepo {
  UserRepo({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<List<UserModel>> getAllUsers({
    required String username,
    required String password,
  }) async {
    UniversalResponse universalResponse = await apiProvider.getAllUsers();
    if (universalResponse.error.isEmpty) {
      return universalResponse.data as List<UserModel>;
    }
    return [];
  }

  Future<void> logOutUser() async {
    await StorageRepository.deleteString("token");
  }
}