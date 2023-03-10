import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jusst_echnologies_task/provider/Next_screen_provider.dart';
import 'package:jusst_echnologies_task/widgets/common_container.dart';
import 'package:jusst_echnologies_task/widgets/common_textfield.dart';
import 'package:jusst_echnologies_task/widgets/next_screen_widgets.dart';
import 'package:provider/provider.dart';

class NextScreen extends StatefulWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  _NextScreenState createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  NextScreenProvider? provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<NextScreenProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<NextScreenProvider>(context, listen: true);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Send Data to WebSocket"),
        ),
        body: Container(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    commonTextFormField(
                        controller: provider!.controller1,
                        hintText: "Full name"),
                    SizedBox(height: 10),
                    commonTextFormField(
                        controller: provider!.controller2, hintText: "Surname"),
                    SizedBox(height: 10),
                    commonTextFormField(
                        controller: provider!.controller3, hintText: "Country"),
                    SizedBox(height: 10),
                    commonTextFormField(
                        controller: provider!.controller4,
                        hintText: "Interest"),
                    SizedBox(height: 10),
                    commonTextFormField(
                        controller: provider!.controller5,
                        hintText: "Work form Where"),
                    SizedBox(height: 20),
                    fillData(provider!),
                    SizedBox(height: 20),
                    showFormDataStreamBuilder(provider!),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  @override
  void dispose() {
    provider!.channel.sink.close();
    // _controller.dispose();
    super.dispose();
  }
}
