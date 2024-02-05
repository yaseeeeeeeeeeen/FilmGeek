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
      'userName': userName,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'profession': profession,
      'isLoggedIn': isLoggedIn,
    };
  }

  // Convert a Map into a User object
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      userName: map['userName'],
      email: map['email'],
      password: map['password'],
      phoneNumber: map['phoneNumber'],
      profession: map['profession'],
      isLoggedIn: map['isLoggedIn'],
    );
  }
}