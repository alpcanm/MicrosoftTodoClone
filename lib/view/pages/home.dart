import 'package:bot_2000/view/components/left_side/left_side_stream.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        children: [
          const LeftSideBar(),
          rightSide(),
        ],
      ),
    );
  }

  Expanded rightSide() => Expanded(
      flex: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Title"),
          ListView.builder(
            shrinkWrap: true,
            itemBuilder: (a, b) {
              return const Text("data");
            },
            itemCount: 15,
          )
        ],
      ));
}
