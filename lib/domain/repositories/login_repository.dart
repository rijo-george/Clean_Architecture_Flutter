import 'package:dartz/dartz.dart';

import '../../common/failures.dart';
import '../entities/user.dart';

abstract class AbstractLoginRepository{
    Future<Either <Failure, User>> loginUserUsingEmail(LoginUsingEmailRequest request);
    Future<Either <Failure, User>> loginUserUsingPhone(LoginUsingPhoneRequest request);
}

class LoginUsingEmailRequest{
    String email;
    String password;

    LoginUsingEmailRequest(String email, String password);
}

class LoginUsingPhoneRequest{
    String phoneNumber;

    LoginUsingPhoneRequest(String phoneNumber);
}