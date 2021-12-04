import 'package:flutter/material.dart';

class RightBottom extends StatefulWidget {
  const RightBottom({Key? key}) : super(key: key);

  @override
  _RightBottomState createState() => _RightBottomState();
}

class _RightBottomState extends State<RightBottom> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [Text("b")],
    );
  }
}
