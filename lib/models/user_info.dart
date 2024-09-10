class UserInfo {
  String id;
  String preferredUsername;
  String email;
  String firstName;
  String lastName;

  UserInfo({
    required this.id,
    required this.preferredUsername,
    required this.email,
    required this.firstName,
    required this.lastName,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json){
    return UserInfo(
      id: json['id'],
      preferredUsername: json['username'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'username': preferredUsername,
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
      };

}