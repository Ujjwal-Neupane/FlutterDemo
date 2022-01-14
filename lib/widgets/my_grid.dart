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
    return Material(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        customBorder:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onTap: () async {
          gotoPage(context);
          await Future.delayed(Duration(seconds: 1));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              myIcon,
              size: 40,
              color: Colors.green[700],
            ),
            SizedBox(height: 5),
            Text(title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.green[700],
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
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
