import 'package:isar/isar.dart';
import 'package:pos/models/users/user.dart';


@Collection()
class Auth {
  final user = IsarLink<User>();
  final String? apiToken;

  Auth({this.apiToken});

  Map<String, dynamic> toJsonMap() {
    return {
      'user': user,
      'apiToken': apiToken,
    };
  }

  // factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);
}
