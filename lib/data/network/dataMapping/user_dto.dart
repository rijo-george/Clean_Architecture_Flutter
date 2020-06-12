import 'package:flutter/foundation.dart';

import '../../../domain/entities/user.dart';

class UserDTO {
  String token;

  UserDTO({ @required this.token});

  User toDomain(){
    return User(id: "", name: "Rijo", imageUrl: token);
  }

  Map<String, dynamic> toJson(){
    return {
      '':''
    };
  }
}