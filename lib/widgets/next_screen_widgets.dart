import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jusst_echnologies_task/provider/Next_screen_provider.dart';
import 'package:jusst_echnologies_task/widgets/common_container.dart';

Widget fillData(NextScreenProvider provider){
  return InkWell(
    onTap: (){
      print("message send to server");
      provider!.sendMessage();
    },
    child: commonContainer(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      width: Get.width/1.7,
      height: Get.height/20,
      child: Text("Fill all Data To send Socket",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
    ),
  );
}

Widget showFormDataStreamBuilder(NextScreenProvider provider){
  return Container(
    width: Get.width,
    height: Get.height/5,
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(20),
    ),
    child: StreamBuilder(
      stream: provider!.channel.stream,
      builder: (context, snapshot) {
        return Center(child: Column(
          children: [
            SizedBox(height: 10),
            Text(snapshot.hasData ? 'Your Data Coming From Web Socket'  : "No Data Coming from websocket" , style: TextStyle(color: Colors.white),),
            SizedBox(height: 10),
            Text(snapshot.hasData ? '${snapshot.data.toString()}' : '',style: TextStyle(color: Colors.white),),
          ],
        ));
      },
    ),
  );
}