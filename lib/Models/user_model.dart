///This is a sample model class that manipulates data sent to or payload received
///from an api service.
///
/// The factory [UserModel.fromJson] converts payloads in Json formats into
/// a [UserModel] object that can be used anywhere within the app.
///
/// The method [toJson] converts the [UserModel] object into a Map.
///
class UserModel {
  final String? name;
  final String? email;

  UserModel({
    this.name,
    this.email,
  });

  factory UserModel.fromJson(Map data) {
    return UserModel(name: data['name'], email: data['email']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
    };
  }
}
