class UserRequestEntity {
  final String? email;
  final String? password;
  final String? username;
  final int? openId;

  const UserRequestEntity(
      {this.email, this.password, this.username, this.openId});

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        'username': username,
        'open_id': openId
      };

  UserRequestEntity copyWith(
          {String? email, String? password, String? username, int? openId}) =>
      UserRequestEntity(
        email: email ?? this.email,
        password: password ?? this.password,
        username: username ?? this.username,
        openId: openId ?? this.openId,
      );
}

class UserResponseEntity {
  final int? code;
  final String? msg;
  final UserEntity? data;

  const UserResponseEntity({this.code, this.msg, this.data});

  factory UserResponseEntity.fromJson(Map<String, dynamic> json) =>
      UserResponseEntity(
          code: json['code'],
          msg: json['msg'],
          data: UserEntity.fromJson(json['data']));
}

class UserEntity {
  final int? id;
  final String? email;
  final String? password;
  final String? accessToken;
  final String? username;
  final String? avatar;

  const UserEntity(
      {this.id,
      this.email,
      this.password,
      this.username,
      this.accessToken,
      this.avatar});

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      accessToken: json['access_token'],
      avatar: json['avatar'],
      username: json['username']);
}
