import 'package:flutter/material.dart';

class RightBottom extends StatelessWidget {
  const RightBottom({
    Key? key,
    required this.lastUpdate,
    required this.createdAt,
  }) : super(key: key);
  final String lastUpdate;
  final String createdAt;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: SizedBox(
        child: Column(children: [
          Text(
            'Son güncelleme: $lastUpdate',
            style: Theme.of(context).textTheme.caption,
            textAlign: TextAlign.center,
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Şu tarihte oluşturuldu: $createdAt',
                style: Theme.of(context).textTheme.caption,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete_outlined),
                iconSize: 32,
              )
            ],
          ),
        ]),
      ),
    );
  }
}
