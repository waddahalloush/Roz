import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../Bloc/cubit/app_cubit.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      changeOnTap: true,
      minWidth: 40,
      minHeight: 30,
      cornerRadius: 10.0,
      activeBgColors: const [
        [Colors.deepPurpleAccent, Colors.redAccent],
        [Colors.redAccent, Colors.deepPurpleAccent]
      ],
      activeFgColor: Colors.white,
      inactiveBgColor: Colors.grey,
      inactiveFgColor: Colors.black,
      initialLabelIndex: 0,
      animate: true,
      curve: Curves.easeInOut,
      totalSwitches: 2,
      labels: context.read<AppCubit>().locale.languageCode == "ar"
          ? ['AR', 'EN']
          : ['EN', 'AR'],
      onToggle: (index) {
        context.read<AppCubit>().locale.languageCode == "ar"
            ? context.read<AppCubit>().changeLanguage('en')
            : context.read<AppCubit>().changeLanguage('ar');
      },
    );
  }
}
