import 'package:flutter/material.dart';

class MyGrid extends StatelessWidget {
  final int id;
  final String title;
  final IconData myIcon;
  final String route;

  const MyGrid(
      {Key? key,
      required this.id,
      required this.title,
      required this.myIcon,
      required this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => gotoPage(context),
      child: Card(
        elevation: 4.0,
        borderOnForeground: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              myIcon,
              size: 50,
              color: Colors.green[700],
            ),
            SizedBox(height: 20),
            Text(title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.green[700],
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
      ),
    );
  }

  gotoPage(BuildContext context) {
    Navigator.pushNamed(context, route);
  }
}
