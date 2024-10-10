class Users {
  int?id;
  String? username, email;
  int? password;

  Users(
      {required this.username, required this.email, required this.password,this.id});

  factory Users.fromMap(Map m1) {
    return Users(
      id: m1['id'],
      username: m1['username'],
      email: m1['email'],
      password: m1['password'],
    );
  }


  Map<String, dynamic> toMap() {
    return {
      'id':id,
      'username':username,
      'email':email,
      'password':password
    };
  }
}