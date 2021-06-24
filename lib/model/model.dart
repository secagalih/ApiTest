class UserModel {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  UserModel(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.avatar});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }
}

class DataModel {
  List<UserModel> data;

  DataModel({
    required this.data,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
        data:
            (json["data"] as List).map((i) => UserModel.fromJson(i)).toList());
  }
}
