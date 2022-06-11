class Usuario {
  Usuario({
    this.userId,
    this.userName,
    this.userEmail,
    this.userPassword,
    this.avatar,
  });

  int userId;
  String userName;
  String userEmail;
  String userPassword;
  String avatar;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        userId: json["id"],
        userName: json["name"],
        userEmail: json["email"],
        userPassword: json["password_hash"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": userId,
        "name": userName,
        "email": userEmail,
        "password_hash": userPassword,
        "avatar": avatar,
      };
}
