import 'package:dartz/dartz.dart';

import '../../common/failures.dart';
import '../entities/user.dart';
import 'dto/login_dto.dart';

abstract class AbstractLoginRepository{
    Future<Either <Failure, User>> loginUserUsingEmail(LoginUsingEmailRequest request);
    Future<Either <Failure, User>> loginUserUsingPhone(LoginUsingPhoneRequest request);
}