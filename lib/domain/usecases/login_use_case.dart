import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../common/failures.dart';
import '../entities/user.dart';
import '../repositories/dto/login_dto.dart';
import '../repositories/login_repository.dart';

abstract class AbstractLoginUseCase {
  AbstractLoginRepository repository;
  Future<Either<Failure, User>> loginUsingEmail(LoginUsingEmailRequest request);
  Future<Either<Failure, User>> loginUsingPhone(LoginUsingPhoneRequest request);
}

class LoginUseCase implements AbstractLoginUseCase {
  AbstractLoginRepository repository;

  LoginUseCase({@required this.repository});

  @override
  Future<Either<Failure, User>> loginUsingEmail(LoginUsingEmailRequest request) async {
    return await repository.loginUserUsingEmail(request);
  }

  @override
  Future<Either<Failure, User>> loginUsingPhone(LoginUsingPhoneRequest request) async {
    return await repository.loginUserUsingPhone(request);
  }
}
