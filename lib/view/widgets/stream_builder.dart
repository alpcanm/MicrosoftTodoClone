import 'package:flutter/material.dart';

class StreamBuilderExtension<T> extends StatelessWidget {
  const StreamBuilderExtension({
    Key? key,
    required this.body,
    required this.stream,
  }) : super(key: key);
  final Widget Function(BuildContext context, AsyncSnapshot<T> snapshot) body;
  final Stream<T> stream;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: stream,
      builder: (context, AsyncSnapshot<T> snapshot) {
        if (snapshot.hasError) {
          return SizedBox(height: 200, child: Text(snapshot.error.toString()));
        } else {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Text('None');
            case ConnectionState.waiting:
              return const Center(
                child: SizedBox(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                  width: 60,
                  height: 60,
                ),
              );
            case ConnectionState.active:
              return body.call(context, snapshot);
            case ConnectionState.done:
              return const Text('Done');
            default:
              return const Text('Default');
          }
        }
      },
    );
  }
}
