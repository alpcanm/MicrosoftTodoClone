import 'package:bot_2000/core/view_model/note_book_view_model.dart';
import 'package:bot_2000/view/components/profile_bar.dart';
import 'package:bot_2000/view/widgets/buttons/sidebar_button.dart';
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
      children: [ProfileBar.bar(context), noteBookList()],
    ));
  }

   noteBookList() {
    final noteBookVM = Provider.of<NoteBookVM>(context, listen: false);

return Text("a");
    // return ListView.builder(
    //   shrinkWrap: true,
    //   itemBuilder: (context, index) {
    //     return SideButton.button(noteBookVM.noteBookList![index]!.title!);
    //   },
    //   itemCount: noteBookVM.noteBookList!.length,
    // );
  }
}
