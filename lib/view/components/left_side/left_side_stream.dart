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
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [ProfileBar.bar(context), noteBooks()],
    ));
  }

  StreamBuilder<List<NoteBook?>> noteBooks() {
    final noteBookVM = Provider.of<ViewModel>(context);
    return StreamBuilder<List<NoteBook?>>(
        stream: noteBookVM.noteBookList,
        builder:
            (BuildContext context, AsyncSnapshot<List<NoteBook?>> snapshot) {
          if (snapshot.hasError) {
            return const Text("An Error");
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
                      subTitle: _noteBook.noteList?.length.toString() ?? "0",
                      title: _noteBook.text!,
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

  @override
  void dispose() {
    final noteBookVM = Provider.of<ViewModel>(context, listen: false);

    super.dispose();
  }
}
