import '../../local/storagea_repository.dart';
import '../../models/universal_response.dart';
import '../api_provider.dart';

class LoginRepo {
  LoginRepo({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<bool> loginUser({
    required String username,
    required String password,
  }) async {
    UniversalResponse universalResponse =
    await apiProvider.loginUser(username: username, password: password);
    if (universalResponse.error.isEmpty) {
      await StorageRepository.putString("token", universalResponse.data as String);
      return true;
    }
    return false;
  }
}