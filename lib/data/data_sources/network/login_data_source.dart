import '../../../domain/repositories/dto/login_dto.dart';
import 'dataMapping/login_user_dto.dart';

abstract class LoginDataSource {
  Future<LoginUserDTO> loginUserUsingEmail(LoginUsingEmailRequest request);
  Future<LoginUserDTO> loginUserUsingPhone(LoginUsingPhoneRequest request);
}
