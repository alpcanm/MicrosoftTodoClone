import 'package:bot_2000/core/responsive.dart';
import 'package:bot_2000/core/view_model/window_state.dart';
import 'package:bot_2000/view/components/home_components/center/center_area.dart';
import 'package:bot_2000/view/components/home_components/left_side/left_area.dart';
import 'package:bot_2000/view/components/home_components/right_side/right_area.dart';
import 'package:bot_2000/view/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Widget _leftArea = const LeftArea();
  final Widget _centerArea = const CenterArea();
  final Widget _rightArea = const RightArea();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ToDoAppBar(),
      body: Row(
        children: _isMobil ? _mobilePattern : _desktopPatter,
      ),
    );
  }

  List<Widget> get _mobilePattern {
    final _windovState = Provider.of<WindowState>(context);


    return [
      !_windovState.firstWindowOpen
          ? Expanded(child: _leftArea)
          : const SizedBox(),
      _windovState.firstWindowOpen && !_windovState.secondWindowOpen
          ? Expanded(child: _centerArea)
          : const SizedBox(),
      _windovState.secondWindowOpen
          ? Expanded(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.close),
                  iconSize: 24,
                  splashRadius: 24,
                  onPressed: () {
                    _windovState.secondWindowOpen = false;
                  },
                ),
                _rightArea,
              ],
            ))
          : const SizedBox()
    ];
  }

  List<Widget> get _desktopPatter {
    return [
      SizedBox(width: 300, child: _leftArea),
      Expanded(child: _centerArea),
      SizedBox(width: 300, child: _rightArea)
    ];
  }

  bool get _isMobil {
    return Responsive.isMobile(context);
  }
}
