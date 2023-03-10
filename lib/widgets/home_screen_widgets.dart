import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jusst_echnologies_task/provider/home_screen_provider.dart';
import 'package:jusst_echnologies_task/screens/next_screen.dart';

Widget submitContainer() {
  return InkWell(
    onTap: () {
      Get.to(NextScreen());
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          width: Get.width / 2,
          height: Get.height / 20,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text("Click Here for another data",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ],
    ),
  );
}

Widget streamBuilderContainer(HomeScreenProvider provider) {
  return Container(
    width: Get.width,
    height: Get.height / 5,
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(20),
    ),
    child: StreamBuilder(
      stream: provider!.channel.stream,
      builder: (context, snapshot) {
        return Center(
            child: Column(
          children: [
            SizedBox(height: 10),
            Text(
              snapshot.hasData
                  ? 'Data Coming From Web Socket'
                  : "No Data Coming from websocket",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              snapshot.hasData ? '${snapshot.data.toString()}' : '',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ));
      },
    ),
  );
}
