import 'dart:io';

import 'package:driveclone/utils.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:mime/mime.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:video_compress/video_compress.dart';

class FirebaseService {
  Uuid uuid = Uuid();
  
  Future<Object?> compressFile(File file, String fileType) async {
    if (fileType.startsWith("image")) {
      Directory directory = await getTemporaryDirectory();
      String targetpath = directory.path + "/${uuid.v4()}.jpg";
      XFile? result = await FlutterImageCompress.compressAndGetFile(
        file.path,
        targetpath,
        quality: 75,
      );
      return result;
    } else if (fileType.startsWith("video")) {
      MediaInfo? info = await VideoCompress.compressVideo(
        file.path,
        quality: VideoQuality.MediumQuality,
        deleteOrigin: false,
        includeAudio: true,
      );
      if (info != null) {
        print(info.file);
        return File(info.path!);
      }
    }
    return file;
  }

  Future<void> uploadFile(String foldername) async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();

      for (File file in files) {
        String? fileType = lookupMimeType(file.path);
        print(fileType);
        if (fileType != null) {
          String filteredFileType = fileType.split('/')[0];
          String fileName = file.path.split('/').last;
          String fileExtension = fileName.substring(fileName.lastIndexOf('.') + 1);
          print(fileExtension);

          Object? compressedFile =
              await compressFile(file, filteredFileType);

          UploadTask uploadTask = FirebaseStorage.instance
              .ref()
              .child('files')
              .child('File_${uuid.v4()}.$fileExtension')
              .putFile(compressedFile as File);

          TaskSnapshot snapshot = await uploadTask.whenComplete(() {});
          String fileUrl = await snapshot.ref.getDownloadURL();

          await userCollection
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection('files')
              .add({
            "fileName": fileName,
            "fileUrl": fileUrl,
            "fileType": filteredFileType,
            "fileExtension": fileExtension,
            "folder": foldername,
            "size": (compressedFile as File).readAsBytesSync().lengthInBytes ~/ 1024,
            "dateUploaded": DateTime.now(),
          });
        }
      }
      if (foldername == '') {
        Get.back();
      }
    } else {
      print("Cancelled");
    }
  }
}
