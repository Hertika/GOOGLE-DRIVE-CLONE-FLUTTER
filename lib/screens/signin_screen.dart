import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:driveclone/controllers/authentication_controller.dart';
import 'package:driveclone/utils.dart';

class SigninScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomLeft,
          colors: [
            Colors.deepPurpleAccent,
            Colors.purpleAccent,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).viewInsets.top + 52,
              ),
              child: const Image(
                width: 200,
                height: 200,
                image: AssetImage('assets/filemanager.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            const Spacer(),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 35),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 5,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Simplyfy your",
                        style: textStyle(25, const Color(0xff635c9B), FontWeight.w700)),
                    Text("filing system",
                        style: textStyle(25, const Color(0xff635c9B), FontWeight.w700)),
                    const SizedBox(height: 20),
                    Text("Keep your files", style: textStyle(20, Colors.black, FontWeight.w600)),
                    Text("organized more easily",
                        style: textStyle(20, Colors.black, FontWeight.w600)),
                    const SizedBox(height: 30),
                    InkWell(
                      onTap: () => Get.find<AuthController>().signin(),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.7,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.deepOrangeAccent.withOpacity(0.8),
                        ),
                        child: Center(
                            child: Text("Let's go",
                                style: textStyle(23, Colors.white, FontWeight.w700))),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle textStyle(double size, Color color, FontWeight weight) {
    return TextStyle(
      fontSize: size,
      color: color,
      fontWeight: weight,
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: SigninScreen(),
//   ));
// }
