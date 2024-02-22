import 'package:flutter/material.dart';

import 'package:driveclone/firebase.dart';

class StorageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade100,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.001),
            offset: const Offset(10, 10),
            blurRadius: 10,
          ),
          BoxShadow(
            color: Colors.grey.withOpacity(0.001),
            offset: const Offset(-10, 10),
            blurRadius: 10,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 25.0, bottom: 35),
        child: Column(
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 10),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "20",
                        style: textStyle(50, const Color(0xff635C9B), FontWeight.bold),
                      ),
                      Text(
                        "%",
                        style: textStyle(17, const Color(0xff635C9B), FontWeight.bold),
                      )
                    ],
                  ),
                  Text(
                    "Used",
                    style: textStyle(20, Colors.black.withOpacity(0.7), FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Used",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "45 GB",
                      style: textStyle(20, const Color(0xff635C9B), FontWeight.w600),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey.withOpacity(0.25),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Free",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "100 GB",
                      style: textStyle(20, const Color(0xff635C9B), FontWeight.w600),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Placeholder textStyle function
  TextStyle textStyle(double fontSize, Color color, FontWeight fontWeight) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
    );
  }
}
