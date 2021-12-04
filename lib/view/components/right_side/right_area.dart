import 'package:bot_2000/view/components/right_side/right_bottom.dart';
import 'package:bot_2000/view/components/right_side/top/top.dart';
import 'package:flutter/material.dart';

class RightArea extends StatelessWidget {
  const RightArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(child: Container(color: Colors.blue, child: RightTop())),
          SizedBox(
              height: 200,
              child: Container(color: Colors.black45, child: RightBottom()))
        ],
      ),
    );
  }
}
