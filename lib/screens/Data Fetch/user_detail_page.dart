import 'package:flutter/material.dart';
import 'package:flutter_learn_demo/screens/Data%20Fetch/user_image.dart';

import '../../models/user_detail.dart';

class UserDetail extends StatelessWidget {
  const UserDetail({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(244, 255, 254, 254),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blue,
        //iconTheme: IconThemeData(color: Colors.white),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.dark_mode,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            profile(context),
            SizedBox(height: 26),
            followStat(),
            SizedBox(height: 26),
            heroAnimationDemo(context),
            SizedBox(height: 26),
            contactDetail()
          ],
        )),
      ),
    );
  }

//image and profile
  Widget profile(context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blue,
        // boxShadow: const [BoxShadow(blurRadius: 40.0)],
        borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(MediaQuery.of(context).size.width, 40.0)),
      ),
      child: Column(
        children: [
          // Card(
          //    margin: const EdgeInsets.all(15.0),
          //   elevation: 12.0,
          //   shape: CircleBorder(),
          //   clipBehavior: Clip.antiAlias,
          //   child: CircleAvatar(
          //     maxRadius: 54,
          //     backgroundImage: NetworkImage(user.image),
          //   ),
          Hero(
            tag: 'user_profile',
            child: GestureDetector(
              onTap: () => gotoUserImage(context),
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3.5),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(user.image),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(
            height: 20,
          ),
          Text(
            user.username,
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            user.email,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }

//ranking, following, followers
  Widget followStat() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: const [
            Text(
              '4.8',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Ranking',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        SizedBox(
          height: 24,
          child: VerticalDivider(
            thickness: 1,
            width: 36,
            color: Colors.grey,
          ),
        ),
        Column(
          children: const [
            Text(
              '35',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Following',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        SizedBox(
          height: 24,
          child: VerticalDivider(
            thickness: 1,
            width: 36,
            color: Colors.grey,
          ),
        ),
        Column(
          children: const [
            Text(
              '40',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Followers',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        )
      ],
    );
  }

  Widget contactDetail() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 0, right: 8, bottom: 8),
      child: Card(
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              contactInfo(Icons.phone, 'Phone No', user.phoneNo),
              SizedBox(
                height: 24,
              ),
              contactInfo(Icons.map, 'Location', user.location),
              SizedBox(
                height: 24,
              ),
              contactInfo(Icons.email, 'Email', user.email),
            ],
          ),
        ),
      ),
    );
  }

  Widget contactInfo(IconData iconData, String title, String value) {
    return Row(
      children: [
        Icon(iconData, color: Colors.blue),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
            SizedBox(
              height: 8,
            ),
            Text(value)
          ],
        )
      ],
    );
  }

  Widget heroAnimationDemo(BuildContext context) {
    return ElevatedButton(
      onPressed: () => gotoUserImage(context),
      child: Text('Hero Animation'),
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0.0),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
      ),
    );
  }

  gotoUserImage(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => UserImage(uImage: user.image)));
  }
}
