import 'package:flutter/material.dart';
import 'package:bot_2000/core/view_model/view_note_methods.dart';

class AddSubnote extends StatelessWidget {
  AddSubnote({
    Key? key,
    this.noteId,
  }) : super(key: key);
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final String? noteId;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: ListTile(
          contentPadding: const EdgeInsets.all(0),
          leading: IconButton(
            onPressed: () => _postData(),
            icon: const Icon(
              Icons.add,
            ),
            splashRadius: 12,
          ),
          title: Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: TextFormField(
              onEditingComplete: () => _postData(),
              controller: _controller,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Lütfen bir şeyler yazınız.';
                } else {
                  return null;
                }
              },
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
        ),
      ),
    );
  }

  void _postData() async {
    if (_formKey.currentState!.validate()) {
      final _noteMethods = ViewNoteMethods();
      await _noteMethods.postSubNote(
          relationId: noteId ?? '', text: _controller.text);
      _controller.clear();
    }
  }
}
