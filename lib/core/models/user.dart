import 'dart:convert';

class User {
  String? userId;
  String? name;
  String? surname;
  String? mail;
  DateTime? creatadAt;
  String? phoneNumber;
  String? photoURL;
  String? password;
  bool? mailVerified;

  User({
    this.userId,
    this.name,
    this.surname,
    this.mail,
    this.creatadAt,
    this.phoneNumber,
    this.photoURL,
    this.password,
    this.mailVerified,
  });

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'name': name,
      'surname': surname,
      'mail': mail,
      'created_at': creatadAt.toString(),
      'phone_number': phoneNumber,
      'photo_url': photoURL,
      'password': password,
      'mail_verified': mailVerified,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userId: map['user_id'].toString(),
      name: map['name'],
      surname: map['surname'],
      mail: map['mail'],
      creatadAt: DateTime.tryParse(map['created_at']),
      phoneNumber: map['phone_number'],
      photoURL: map['photo_url'],
      password: map['password'],
      mailVerified: map['mailVerified'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
