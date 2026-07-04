import 'package:april_14/features/login/models/login_response_model.dart';

class LoginService {
  Future<LoginResponseModel> login(String email, String password) async {
    // Simulate a network call with a delay
    await Future.delayed(Duration(seconds: 2));

    final response = {
      "token": "dummy_token",
      "userId": "dummy_user_id",
      "email": email,
    };
    
    // For demonstration, we return a dummy response
    return LoginResponseModel.fromJson(response);
  }
}