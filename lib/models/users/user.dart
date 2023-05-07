import 'package:isar/isar.dart';

part 'user.g.dart';

@Collection()
class User {
  Id? userId = Isar.autoIncrement;
  late final String? email;
  late final String? first;
  late final String? last;
  late final String? position;
  final String? profilePic;
  late final String? phone;
  late final String? token;
  final String? password;

  User(
      {this.email,
      this.userId,
      this.first,
      this.last,
      this.position,
      this.phone,
      this.token,
      this.profilePic,
      this.password});

  factory User.fromJson(Map<String, dynamic> json) => User(
      userId: json['userId'],
      email: json['email'],
      first: json['first'],
      last: json['last'],
      position: json['position'],
      profilePic: json['profilePic'],
      phone: json['phone'],
      token: json['token'],
      password: json['password']);

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'first': first,
        'last': last,
        'position': position,
        'profilePic': profilePic,
        'phone': phone,
        'email': email,
        'password': password,
        'token': token,
      };
}
