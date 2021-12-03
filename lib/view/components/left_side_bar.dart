import 'package:bot_2000/core/models/notes/note_book.dart';
import 'package:bot_2000/core/view_model/note_book_view_model.dart';
import 'package:bot_2000/view/components/profile_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LeftSideBar extends StatefulWidget {
  const LeftSideBar({Key? key}) : super(key: key);

  @override
  State<LeftSideBar> createState() => _LeftSideBarState();
}

class _LeftSideBarState extends State<LeftSideBar> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [ProfileBar.bar(context), noteBooks()],
    ));
  }

  StreamBuilder<List<NoteBook?>?> noteBooks() {
    final noteBookVM = Provider.of<NoteBookVM>(context, listen: false);
    return StreamBuilder<List<NoteBook?>?>(
        stream: noteBookVM.getNoteBooks(),
        initialData: [NoteBook(text: "Alpcan")],
        builder:
            (BuildContext context, AsyncSnapshot<List<NoteBook?>?> snapshot) {
          if (snapshot.hasError) {
            return const Text("An Error");
          } else {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Text("Note");
              case ConnectionState.waiting:
                return const Text("Waiting");
              case ConnectionState.active:
                List<NoteBook?> _result = snapshot.data!;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Text(_result.length.toString());
                  },
                  itemCount: _result.length,
                );
              case ConnectionState.done:
                return const Text("Done");
              default:
                return const Text("Default");
            }
          }
        });
  }
}
