import 'package:driveclone/controllers/navigation_controller.dart';
import 'package:driveclone/screens/storage_screen.dart';
import 'package:flutter/material.dart';
import 'package:driveclone/widgets/header.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart'; 
import 'package:driveclone/screens/files_screen.dart';// Importing Header widget
// import 'package:driveclone/widgets/storage_container.dart' // Assuming StorageScreen is defined in a separate file

class NavScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(25),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      body: Column(
        children: [
          Header(), 
          // StorageScreen()// No text provided
          Obx(  () => Get.find<NavigationController>().tab.value=="Storage" 
          ? StorageScreen()
          : FileScreen())
         
        ],
      ),
    );
  }
}
