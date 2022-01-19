class UserModel {
  final String firstname;
  final String lastname;
  final String email;
  final String password;
  final String password2;

  UserModel({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.password,
    required this.password2
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstname: json['firstname'],
      lastname: json['lastname'],
      email: json['email'],
      password: json['password'],
      password2: json['password2'],
    );
  }
}