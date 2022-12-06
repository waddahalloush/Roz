// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:roz/Bloc/cubit/app_cubit.dart';

import '../../Core/constants/app_strings.dart';
import '../Widgets/discover_screen_widgets/descover_youliked.dart';
import '../Widgets/discover_screen_widgets/discover_appbar_widget.dart';
import '../Widgets/discover_screen_widgets/discover_country.dart';
import '../Widgets/discover_screen_widgets/discover_follwers.dart';
import '../Widgets/discover_screen_widgets/discover_home.dart';

class DescoverScreen extends StatelessWidget {
  const DescoverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        var cubit = context.read<AppCubit>();
        return SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DefaultTabController(
              length: 4,
              child: Column(
                children: [
                  const DiscoverAppBarWidget(),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: TabBar(
                        labelPadding: const EdgeInsets.symmetric(horizontal: 5),
                        indicatorColor: const Color(0xFF3B2CB6),
                        indicatorSize: TabBarIndicatorSize.label,
                        labelStyle: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF3B2CB6),
                       
                          fontWeight: FontWeight.bold,
                        ),
                        unselectedLabelStyle:
                            Theme.of(context).primaryTextTheme.caption,
                        tabs: [
                          Tab(
                            text: AppStrings.disHome(context),
                          ),
                          Tab(
                            text: AppStrings.disNew(context),
                          ),
                          Tab(
                            text: AppStrings.disFollower(context),
                          ),
                          Tab(
                            text: AppStrings.disYouLike(context),
                          ),
                        ]),
                  ),
                  Expanded(
                      child: TabBarView(children: [
                    DescoverHomeWidget(cubit: cubit),
                    DescoverCountryWidget(cubit: cubit),
                    DescoverFollwersWidget(cubit: cubit),
                    DescoverYouLiked(cubit: cubit),
                  ]))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
