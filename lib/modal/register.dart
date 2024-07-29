class RegModal {
  final int? id;
  final String username;
  final String qualification;
  final String email;
  final String phonenumber;
  final String state;
  final String password;

  RegModal({
    this.id,
    required this.username,
    required this.qualification,
    required this.email,
    required this.phonenumber,
    required this.state,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'qualification': qualification,
      'email': email,
      'phonenumber': phonenumber,
      'state': state,
      'password': password,
    };
  }

  factory RegModal.fromMap(Map<String, dynamic> map) {
    return RegModal(
      id: map['id'],
      username: map['username'],
      qualification: map['qualification'],
      email: map['email'],
      phonenumber: map['phonenumber'],
      state: map['state'],
      password: map['password'],
    );
  }
}
