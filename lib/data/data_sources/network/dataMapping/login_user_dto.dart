import 'package:flutter/foundation.dart';

import '../../../../domain/entities/user.dart';


class LoginUserDTO {
  String id;
  String name;
  String imageUrl;
  String token;

  LoginUserDTO({@required this.id,@required this.name,@required this.imageUrl, @required this.token});

  User toDomain(){
    return User(id: id, name: name, imageUrl: imageUrl, token: token);
  }

  Map<String, dynamic> toJson(){
    return {
      '':''
    };
  }
}