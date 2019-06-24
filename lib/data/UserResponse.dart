import 'package:quicknote/data/MessageData.dart';

import 'User.dart';

class UserResponse {
  User user;
  MessageData md;
  UserResponse(this.user, this.md);

  factory UserResponse.fromJson(Map<String, dynamic> map) {
    return UserResponse(
        User.fromJson(map['user']), MessageData.fromJson(map['md']));
  }
}
