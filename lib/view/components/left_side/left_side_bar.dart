import 'package:bot_2000/core/models/notes/note_book.dart';
import 'package:bot_2000/core/view_model/view_model.dart';
import 'package:bot_2000/view/components/left_side/notebook_button.dart';
import 'package:bot_2000/view/components/left_side/profile_bar.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [ProfileBar.bar(context), noteBooks],
    );
  }

  StreamBuilder<List<NoteBook?>> get noteBooks {
    final _noteBookVM = Provider.of<ViewModel>(context);
    return StreamBuilder<List<NoteBook?>>(
        stream: _noteBookVM.getNoteBooks(),
        builder:
            (BuildContext context, AsyncSnapshot<List<NoteBook?>> snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Text("None");
              case ConnectionState.waiting:
                return const Text("Waiting");
              case ConnectionState.active:
                List<NoteBook?> _result = snapshot.data!;
                return ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    NoteBook _noteBook = _result[index]!;
                    return NoteBookButton(
                      subTitle: _noteBook.noteList?.length.toString(),
                      title: _noteBook.text!,
                      noteBookId: _noteBook.noteBookId!,
                    );
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
