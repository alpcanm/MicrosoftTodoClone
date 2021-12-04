import 'package:bot_2000/view/components/center/center_area.dart';
import 'package:bot_2000/view/components/left_side/left_area.dart';
import 'package:bot_2000/view/components/right_side/right_area.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        children: const [
          SizedBox(width: 300, child: LeftArea()),
          Expanded(child: CenterArea()),
          RightArea()
        ],
      ),
    );
  }
}
