import 'package:bot_2000/core/auto_route/route_const.dart';
import 'package:bot_2000/core/responsive.dart';
import 'package:bot_2000/core/view_model/note_viewmodel.dart';
import 'package:bot_2000/core/view_model/view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auto_route/auto_route.dart';

class ToDoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ToDoAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Responsive.isMobile(context)
          ? IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
          : const SizedBox(),
      actions: [
        PopupMenuButton(
            itemBuilder: (context) => [
                  PopupMenuItem(
                    child: const Text('Çıkış Yap'),
                    value: 1,
                    onTap: () => _logOut(context),
                  ),
                ])
      ],
    );
  }

  void _logOut(BuildContext context) {
    final _viewModel = Provider.of<ViewModel>(context, listen: false);
    final _noteVm = Provider.of<NoteViewModel>(context, listen: false);
    _noteVm.currentNote = null;
    _viewModel.logOut();
    context.router.replaceNamed(RouteConsts.LOGIN_PAGE);
  }
}
