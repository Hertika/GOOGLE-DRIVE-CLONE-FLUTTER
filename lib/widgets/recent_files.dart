import 'package:driveclone/controllers/files_screen_controller.dart';
import 'package:driveclone/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:driveclone/widgets/storage_container.dart';

class RecentFiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Recent Files",
            style: textStyle(20, textColor, FontWeight.bold),
          ),
        ),
        const SizedBox(height: 15),
        GetX<FilesScreenController>(
          builder: (FilesScreenController controller) {
            return Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.recentfileList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 13.0),
                    child: Container(
                      height: 65,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          controller.recentfileList[index].fileType == "image"
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(18),
                                  child: Image(
                                    width: 65,
                                    height: 60,
                                    image: NetworkImage(
                                        controller.recentfileList[index].url),
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Container(
                                  width: 65,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey, width: 0.15),
                                      borderRadius: BorderRadius.circular(14)),
                                  child: Center(
                                    child: Image(
                                      width: 42,
                                      height: 42,
                                      image: AssetImage(
                                          'assets/${controller.recentfileList[index].fileExtension}.png'),
                                    ),
                                  ),
                                ),
                          const SizedBox(height: 5),
                          Text(
                            controller.recentfileList[index].name,
                            style: textStyle(13, textColor, FontWeight.w500),
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
