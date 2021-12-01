import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        children: [
          leftSide(),
          rightSide(),
        ],
      ),
    );
  }

  Expanded leftSide() => Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ListTile(
            title: Text("User name"),
            leading: CircleAvatar(),
            subtitle: Text("Mail"),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemBuilder: (a, b) {
              return sideButton();
            },
            itemCount: 7,
          )
        ],
      ));

  Widget sideButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(
            Icons.ac_unit,
            size: 24,
          ),
          label: const Text("Data")),
    );
  }

  Expanded rightSide() => Expanded(
      flex: 5,
      child: Container(
        color: Colors.deepPurple[200],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Title"),
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (a, b) {
                return Text("data");
              },
              itemCount: 15,
            )
          ],
        ),
      ));
}
