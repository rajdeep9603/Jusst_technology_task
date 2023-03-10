import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jusst_echnologies_task/provider/home_screen_provider.dart';
import 'package:jusst_echnologies_task/screens/next_screen.dart';
import 'package:jusst_echnologies_task/widgets/home_screen_widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenProvider? provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<HomeScreenProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<HomeScreenProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Jusst technologies"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.height / 10),
              Center(child: CircularProgressIndicator()),
              SizedBox(height: Get.height / 10),
              streamBuilderContainer(provider!),
              SizedBox(height: 30),
              submitContainer(),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void dispose() {
    provider!.channel.sink.close();
    // _controller.dispose();
    super.dispose();
  }
}
