import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roz/Core/utils/media_query_ex.dart';

import '../../../Bloc/cubit/app_cubit.dart';

class UserProfileAppbar extends StatelessWidget {
  const UserProfileAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(right: 8),
          alignment: Alignment.centerRight,
          width: MediaQuery.of(context).size.width,
          color: context.read<AppCubit>().isDark == 0
              ? const Color(0xFF130032)
              : Theme.of(context).scaffoldBackgroundColor,
          height: 65,
          child: IconButton(
            icon: const Icon(Icons.menu),
            color: Theme.of(context).iconTheme.color,
            onPressed: () {},
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 8),
          alignment: Alignment.centerLeft,
          color: const Color(0xFFDC3664),
          width: context.width / 2 - 35,
          height: 65,
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Theme.of(context).iconTheme.color,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
