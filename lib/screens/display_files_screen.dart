import 'package:driveclone/firebase.dart';
import 'package:driveclone/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DisplayFilesScreen extends StatelessWidget {
  final String title;
  final String type;

  DisplayFilesScreen(this.title, this.type);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(48),
        child: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_back, color: textColor),
          ),
          title: Text(
            title,
            style: textStyle(18, textColor, FontWeight.bold),
          ),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () => type == "folder"
            ? FirebaseService().uploadFile(title)
            : FirebaseService().uploadFile(''),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.redAccent[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Icon(Icons.add, color: Colors.white, size: 32),
          ),
        ),
      ),
      body: GridView.builder(
        itemCount: 4,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 16, right: 10, top: 15),
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image(
                      image: NetworkImage(
                          'https://firebasestorage.googleapis.com/v0/b/driveclone-7ea73.appspot.com/o/files%2FFile_432089c4-979d-4c77-984f-2c99a72446ed.pdf?alt=media&token=b23d42d6-9529-4fd1-844b-eb11b891961c"'), // Placeholder URL
                        width: MediaQuery.of(context).size.width/2.5,
                        height: 25,
                        fit:BoxFit.cover,
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
