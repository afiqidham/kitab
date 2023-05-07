class RegisterModel {
  late String email;
  late String password;
  late String phone;
  late String position;
  late String first;
  late String last;

  RegisterModel(
      {required this.email,
      required this.password,
      required this.phone,
      required this.position,
      required this.first,
      required this.last});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['phone'] = phone;
    data['position'] = position;
    data['first'] = first;
    data['last'] = last;
    return data;
  }
}
