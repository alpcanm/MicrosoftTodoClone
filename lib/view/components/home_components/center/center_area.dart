import 'package:bot_2000/core/view_model/view_model.dart';
import 'package:bot_2000/view/components/home_components/center/bottom/center_bottom.dart';
import 'package:bot_2000/view/components/home_components/center/top/center_stream.dart';
import 'package:bot_2000/view/components/home_components/center/top/components/center_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CenterArea extends StatelessWidget {
  const CenterArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _viewModel = Provider.of<ViewModel>(context);
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: _viewModel.noteBookId != ''
            ? [
                const CenterHeader(),
                const Flexible(child: CenterStream()),
                SizedBox(
                    height: 150,
                    child: CenterBottom(
                      notebookId: _viewModel.noteBookId,
                    ))
              ]
            : [],
      ),
    );
  }
}
