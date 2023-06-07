class User {
  final String id;
  final String email;
  final String password;
  final String userName;
  final String imageUrl;
  final String token;

  User({
    required this.id,
    required this.email,
    required this.password,
    required this.userName,
    required this.imageUrl,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        password: json["password"],
        userName: json["userName"],
        imageUrl: json["imageUrl"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "password": password,
        "userName": userName,
        "imageUrl": imageUrl,
        "token": token,
      };
}
