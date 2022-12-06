import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../../View Model/app_provider.dart';

class ThemeModWidget extends StatelessWidget {
  const ThemeModWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      initialLabelIndex: context.read<AppProvider>().isDark == 0 ? 0 : 1,
      minHeight: 30,
      minWidth: 40, changeOnTap: true,
      cornerRadius: 10.0,
      activeFgColor: Colors.white,
      inactiveBgColor: Colors.grey,
      inactiveFgColor: Colors.white,
      totalSwitches: 2,
      icons: const [
        FontAwesomeIcons.lightbulb,
        FontAwesomeIcons.solidLightbulb,
      ],
      iconSize: 30.0,

      activeBgColors: const [
        [Colors.black45, Colors.black26],
        [Colors.yellow, Colors.orange]
      ],

      animate:
          true, // with just animate set to true, default curve = Curves.easeIn
      curve: Curves
          .easeInOut, // animate must be set to true when using custom curve
      onToggle: (index) {
        context.read<AppProvider>().changeTheme(index!);
      },
    );
  }
}
