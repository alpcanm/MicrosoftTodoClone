import 'dart:convert';

class User {
  String? userId;
  String? name;
  String? surname;
  String? mail;
  String? password;

  User({
    this.userId,
    this.name,
    this.surname,
    this.mail,
    this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      '_id': userId,
      'name': name,
      'surname': surname,
      'email': mail,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userId: map['_id'].toString(),
      name: map['name'],
      surname: map['surname'],
      mail: map['email'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
