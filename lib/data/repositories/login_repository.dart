import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:micro_social/infrastructure/network_info.dart';
import '../data_sources/network/login_data_source.dart';

import '../../common/failures.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/dto/login_dto.dart';
import '../../domain/repositories/abstract_login_repository.dart';

class LoginRepository implements AbstractLoginRepository {
  final LoginDataSource dataSource;
  final NetworkInfo networkInfo;
  LoginRepository({@required this.dataSource, @required this.networkInfo});

  @override
  Future<Either<Failure, User>> loginUserUsingEmail(
      LoginUsingEmailRequest request) async {
    var isConnected = await networkInfo.isConnected;
    if (isConnected == false){
        return Left(ServerFailure());
    }
    final user =  await dataSource.loginUserUsingEmail(request);
    return Right(user.toDomain());
  }

  @override
  Future<Either<Failure, User>> loginUserUsingPhone(
      LoginUsingPhoneRequest request) {
    return null;
  }
}
