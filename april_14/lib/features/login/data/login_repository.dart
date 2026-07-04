import 'package:april_14/features/login/data/login_service.dart';
import 'package:april_14/features/login/models/login_response_model.dart';

class LoginRepository {
  final LoginService _loginService = LoginService();
  
  Future<LoginResponseModel> login(String email, String password) async {
    return await _loginService.login(email, password);
  }
}
