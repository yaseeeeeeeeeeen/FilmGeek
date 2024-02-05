class User {
  int? id;
  String userName;
  String email;
  String password;
  String phoneNumber;
  String profession;
  int isLoggedIn;

  User({
    this.id,
    required this.userName,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.profession,
    required this.isLoggedIn,
  });

  // Convert a User object into a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_name': userName,
      'email': email,
      'password': password,
      'phone_number': phoneNumber,
      'profession': profession,
      'is_logged_in': isLoggedIn,
    };
  }

  // Convert a Map into a User object
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      userName: map['user_name'],
      email: map['email'],
      password: map['password'],
      phoneNumber: map['phone_number'],
      profession: map['profession'],
      isLoggedIn: map['is_logged_in'],
    );
  }
}