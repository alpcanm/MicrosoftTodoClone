import 'package:flutter/material.dart';

class CenterBottom extends StatefulWidget {
  const CenterBottom({Key? key}) : super(key: key);

  @override
  _CenterBottomState createState() => _CenterBottomState();
}

class _CenterBottomState extends State<CenterBottom> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
        child: Card(
          color: Theme.of(context).cardColor,
          child: ListTile(
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add,
                size: 28,
              ),
              splashRadius: 30,
            ),
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
