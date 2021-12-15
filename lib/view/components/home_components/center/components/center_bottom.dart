import 'package:flutter/material.dart';
import 'package:bot_2000/core/view_model/view_note_methods.dart';

class CenterBottom extends StatefulWidget {
  const CenterBottom({
    Key? key,
    required this.notebookId,
  }) : super(key: key);
  final String notebookId;
  @override
  _CenterBottomState createState() => _CenterBottomState();
}

class _CenterBottomState extends State<CenterBottom> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
        child: Card(
          color: Theme.of(context).cardColor,
          child: Form(
            key: _formKey,
            child: ListTile(
              leading: IconButton(
                onPressed: () => _postData(),
                icon: const Icon(
                  Icons.add,
                  size: 28,
                ),
                splashRadius: 30,
              ),
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onEditingComplete: () => _postData(),
                  controller: _controller,
                  style: Theme.of(context).textTheme.bodyText1,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Lütfen bir şeyler yazınız.";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _postData() async {
    if (_formKey.currentState!.validate()) {
      final _noteMethods = ViewNoteMethods();
      await _noteMethods.postNote(
          relationId: widget.notebookId, text: _controller.text);
      _controller.clear();
    }
  }
}
