import 'package:driveclone/widgets/storage_container.dart';
import 'package:driveclone/widgets/upload_options.dart';
import 'package:flutter/material.dart';
// import 'package:storage_container.dart'; // Assuming StorageContainer is defined in a separate file
// import 'package:upload_options.dart'; // Assuming UploadOptions is defined in a separate file

class StorageScreen extends StatelessWidget {
  const StorageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const SizedBox(height: 40),
          StorageContainer(),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: UploadOptions(),
          ),
        ],
      ),
    );
  }
}
