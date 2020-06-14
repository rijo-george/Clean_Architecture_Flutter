import 'package:flutter/foundation.dart';

class User {
  final String id;
  final String name;
  final String imageUrl;
  final String token;
  User({@required this.id, @required this.name, @required this.imageUrl, @required this.token});
}
