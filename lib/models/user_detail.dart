class User {
  int uid;
  String username;
  String email;
  String location;
  String phoneNo;
  String image;

  User({
    required this.uid,
    required this.username,
    required this.email,
    required this.location,
    required this.phoneNo,
    required this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'],
      username: json['username'],
      email: json['email'],
      location: json['location'],
      phoneNo: json['phoneNo'],
      image: json['image'],
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return '$uid. $username\n';
  }
}
