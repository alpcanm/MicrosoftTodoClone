import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'Page NOT FOUND',
            style: Theme.of(context).textTheme.headline1,
          ),
        ],
      ),
    );
  }
}
