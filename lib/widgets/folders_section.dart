import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driveclone/screens/display_files_screen.dart';
import 'package:driveclone/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:driveclone/controllers/files_screen_controller.dart';
// import 'package:driveclone/controllers/files_controller.dart;
import 'package:driveclone/widgets/storage_container.dart';

class FoldersSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<FilesScreenController>(
      builder: (FilesScreenController folderController) {
        if (folderController != null && folderController.foldersList != null) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: folderController.foldersList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  if (FirebaseAuth.instance.currentUser != null) {
                    Get.to(DisplayFilesScreen(
                      folderController.foldersList[index].name, "folder"
                    ));
                  } else {
                    // Handle case when user is not authenticated
                    // You can show a snackbar or navigate to a login screen
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please sign in to access folders'))
                    );
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.00001),
                        offset: const Offset(10, 10),
                        blurRadius: 5,
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/folder.jpg',
                        width: 82,
                        height: 82,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        folderController.foldersList[index].name,
                        style: textStyle(18, textColor, FontWeight.bold),
                      ),
                      StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('users')
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .collection('files')
                            .where('folder', isEqualTo: folderController.foldersList[index].name)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          }
                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          }
                          return Text(
                            "${snapshot.data!.docs.length} items",
                            style: textStyle(14, Colors.grey[400]!, FontWeight.bold),
                          );
                        },
                      )
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
