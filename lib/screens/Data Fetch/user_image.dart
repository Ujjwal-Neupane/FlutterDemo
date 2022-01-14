import 'package:flutter/material.dart';

class UserImage extends StatelessWidget {
  final String uImage;

  const UserImage({Key? key, required this.uImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'user_profile',
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black, width: 3.5),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(uImage),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
