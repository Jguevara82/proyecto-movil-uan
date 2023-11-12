class User {
  final String username;
  final String password;

  User({required this.username, required this.password});

  User.fromJson(Map<String, dynamic> json)
      : username = json['username'].toString(),
        password = json['password'].toString();
}
