import 'dart:convert';

class User {
  String? userId;
  String? name;
  String? surname;
  String? mail;
  String? creatadAt;
  String? phoneNumber;
  String? photoURL;
  
  User({
    this.userId,
    this.name,
    this.surname,
    this.mail,
    this.creatadAt,
    this.phoneNumber,
    this.photoURL,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'name': name,
      'surname': surname,
      'mail': mail,
      'creatadAt': creatadAt,
      'phoneNumber': phoneNumber,
      'photoURL': photoURL,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userId: map['userId'],
      name: map['name'],
      surname: map['surname'],
      mail: map['mail'],
      creatadAt: map['creatadAt'],
      phoneNumber: map['phoneNumber'],
      photoURL: map['photoURL'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
