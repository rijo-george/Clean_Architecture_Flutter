import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../common/exceptions.dart';
import '../../common/failures.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/abstract_login_repository.dart';
import '../../domain/repositories/dto/login_dto.dart';
import '../../infrastructure/network_info.dart';
import '../data_sources/network/dataMapping/login_user_dto.dart';
import '../data_sources/network/login_data_source.dart';

typedef Future<LoginUserDTO> _LoginUsingEmailOrPassword();

class LoginRepository implements AbstractLoginRepository {
  final LoginDataSource dataSource;
  final NetworkInfo networkInfo;
  LoginRepository({@required this.dataSource, @required this.networkInfo});

  @override
  Future<Either<Failure, User>> loginUserUsingEmail(
      LoginUsingEmailRequest request) async => await _loginUser(() {
      return dataSource.loginUserUsingEmail(request);
    });

  @override
  Future<Either<Failure, User>> loginUserUsingPhone(
      LoginUsingPhoneRequest request) async => await _loginUser(() {
      return dataSource.loginUserUsingPhone(request);
    });

  Future<Either<Failure, User>> _loginUser(
      _LoginUsingEmailOrPassword loginUser) async {
    var isConnected = await networkInfo.isConnected;
    if (isConnected == false) {
      return Left(ServerFailure());
    }
    try {
      final user = await loginUser();
      return Right(user.toDomain());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
