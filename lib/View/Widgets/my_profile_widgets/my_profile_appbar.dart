import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Bloc/cubit/app_cubit.dart';

class MyProfileAppbar extends StatelessWidget {
  const MyProfileAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(right: 8),
          alignment: Alignment.centerLeft,
          width: MediaQuery.of(context).size.width / 2,
          color: context.read<AppCubit>().isDark == 0
              ? const Color(0xFF130032)
              : Theme.of(context).scaffoldBackgroundColor,
          height: 65,
          child: IconButton(
            icon: const Icon(Icons.settings_outlined),
            color: Theme.of(context).iconTheme.color,
            onPressed: () {
              context.read<AppCubit>().openDrawer();
            },
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 2,
          color: const Color(0xFFDC3664),
          height: 65,
        ),
      ],
    );
  }
}
