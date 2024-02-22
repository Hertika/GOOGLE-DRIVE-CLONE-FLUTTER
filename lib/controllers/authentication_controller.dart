import 'package:driveclone/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  Rx<User?> user =Rx<User?>(FirebaseAuth.instance.currentUser);


  @override
  void onInit() {
    super.onInit();
    user.bindStream(auth.authStateChanges());
    
  }

  signin() async {
    try {
      GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );
        UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
        User? user = userCredential.user;
        if (user != null) {
          // Assuming you have initialized Firestore and userCollection somewhere else
          userCollection.doc(user.uid).set({
            "username": user.displayName,
            "profilepic": user.photoURL,
            "email": user.email,
            "uid": user.uid,
            "userCreated": DateTime.now(),
          });
          print("User Signed in");
        }
      }
    } catch (error) {
      print("Error signing in with Google: $error");
    }
  }
}

// Firestore security rules

