import 'package:flutter/material.dart';

Future main() async {
  runApp(const EasyGPT());
}

class EasyGPT extends StatelessWidget {
  const EasyGPT({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Easy GPT",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: SafeArea(
          child: Center(
            child: Text("data"),
          ),
        ),
      ),
    );
  }
}
