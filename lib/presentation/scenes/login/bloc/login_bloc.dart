import '../../../../domain/repositories/login_repository.dart';
import '../../../../domain/usecases/login_use_case.dart';

class LoginBloc {
  AbstractLoginUseCase usercase;

  LoginBloc({AbstractLoginUseCase usercase});

  Future<void> loginUsingEmail(String email, String password) async {
    LoginUsingEmailRequest request = LoginUsingEmailRequest(email, password);
    final result = await usercase.loginUsingEmail(request);
    result.fold((error) {
        print(error);
    }, (user) {
      print(user);
    });
  }

  void loginUsingPhone(String phoneNumber) async {
    LoginUsingPhoneRequest request = LoginUsingPhoneRequest(phoneNumber);
    final result = await usercase.loginUsingPhone(request);
    result.fold((error) {
        print(error);
    }, (user) {
      print(user);
    });
  }
}
