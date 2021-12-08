import 'package:bot_2000/view/components/home_components/center/bottom/center_bottom.dart';
import 'package:bot_2000/view/components/home_components/center/top/center_stream.dart';
import 'package:flutter/material.dart';

class CenterArea extends StatelessWidget {
  const CenterArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: const [
          Flexible(child: CenterStream()),
          SizedBox(height: 150, child: CenterBottom())
        ],
      ),
    );
  }
}
