// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:roz/Bloc/cubit/app_cubit.dart';
import 'package:roz/Core/constants/app_strings.dart';
import 'package:roz/Core/utils/app_router.dart';
import 'package:roz/Core/utils/media_query_ex.dart';
import '../Widgets/my_profile_widgets/gifts_widget.dart';
import '../Widgets/my_profile_widgets/my_profile_appbar.dart';
import '../Widgets/my_profile_widgets/profile_picture_widget.dart';
import '../Widgets/my_profile_widgets/user_info_widget.dart';
import '../Widgets/my_profile_widgets/user_reaction_widget.dart';
import '../Widgets/my_profile_widgets/my_social_grid.dart';

class MyProfileScreen extends StatelessWidget {
  final List<String> imgList = [
    'assets/images/sample1.jpg',
    'assets/images/sample1.jpg',
    'assets/images/sample1.jpg',
    'assets/images/sample1.jpg'
  ];
  final List<String> videoList = [
    'assets/images/sample1.jpg',
    'assets/images/sample1.jpg',
    'assets/images/sample1.jpg',
    'assets/images/sample1.jpg'
  ];

  MyProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          var cubit = context.read<AppCubit>();
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const MyProfileAppbar(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  cubit.imageProfile != null
                      ? ProfilePictureWidget(
                          image: FileImage(cubit.imageProfile!))
                      : const ProfilePictureWidget(
                          image: AssetImage("assets/images/profile.png")),
                  Container(
                    color: cubit.isDark == 0
                        ? const Color(0xFF130032)
                        : Colors.white,
                    height: MediaQuery.of(context).size.height * 0.32,
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const ProfileReactionWidget(
                          icon: Icons.favorite,
                          text: "2.7 k",
                        ),
                        const Divider(),
                        const ProfileReactionWidget(
                            icon: Icons.thumb_up, text: "3.5 k"),
                        const Divider(),
                        const ProfileReactionWidget(
                            icon: Icons.comment_outlined, text: "2.3 k"),
                        const Divider(),
                        FloatingActionButton(
                          mini: true,
                          onPressed: () {
                            Navigator.pushNamed(
                                context, AppRouter.editProfileRoute);
                          },
                          backgroundColor: Colors.indigo,
                          child: const Icon(
                            Icons.edit_outlined,
                            size: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 8),
                    width: MediaQuery.of(context).size.width / 2,
                    color: cubit.isDark == 0
                        ? const Color(0xFF130032)
                        : Theme.of(context).scaffoldBackgroundColor,
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 8),
                    color: const Color(0xFFAD45B3),
                    width: MediaQuery.of(context).size.width / 2,
                    height: 15,
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20, left: 20),
                            child: Text(
                              'Mathew Ben',
                              style:
                                  Theme.of(context).primaryTextTheme.headline1,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              UserInfoWidget(
                                icon: Icons.location_on,
                                text: "Syria",
                              ),
                              UserInfoWidget(
                                  icon: Icons.monetization_on,
                                  text: '20 token/minute'),
                              UserInfoWidget(
                                  icon: Icons.favorite, text: '50 followers'),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: context.width / 2,
                            child: TabBar(
                                indicatorColor: Colors.purple,
                                labelStyle: TextStyle(
                                    fontSize: 15,
                                   
                                    fontWeight: FontWeight.bold,
                                    foreground: Paint()
                                      ..shader = const RadialGradient(
                                        colors: [
                                          Color(0xFFFA457E),
                                          Color.fromARGB(255, 81, 69, 250),
                                          Color.fromARGB(255, 250, 69, 168),
                                          Color(0xFF7B49FF),
                                        ],
                                        // begin: Alignment.centerLeft,
                                        // end: Alignment.centerRight,
                                      ).createShader(const Rect.fromLTWH(
                                          100.0, 0.0, 200.0, 70.0))),
                                unselectedLabelStyle: Theme.of(context)
                                    .primaryTextTheme
                                    .subtitle1,
                                tabs: [
                                  Tab(
                                    text: AppStrings.img(context),
                                  ),
                                  Tab(
                                    text: AppStrings.video(context),
                                  ),
                                ]),
                          ),
                        ),
                        SizedBox(
                          height: (MediaQuery.of(context).size.height * 0.12),
                          width: MediaQuery.of(context).size.width,
                          child: TabBarView(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                height: imgList.isEmpty
                                    ? context.height * 0.03
                                    : context.height * 0.15,
                                width: context.width,
                                child: MySocialGrid(
                                  imgList: imgList,
                                ),
                              ),
                              Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  height: videoList.isEmpty
                                      ? context.height * 0.03
                                      : context.height * 0.15,
                                  width: context.width,
                                  child: MySocialGrid(imgList: videoList)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Align(
                            alignment:
                                context.read<AppCubit>().locale.languageCode ==
                                        'ar'
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                            child: Text(
                              AppStrings.shortBio(context),
                              style:
                                  Theme.of(context).primaryTextTheme.headline2,
                            ),
                          ),
                        ),
                        Align(
                          alignment:
                              context.read<AppCubit>().locale.languageCode ==
                                      'ar'
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                          child: Text(
                            AppStrings.shortBiosub(context),
                            style: Theme.of(context).primaryTextTheme.subtitle1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40, bottom: 10),
                          child: Align(
                            alignment:
                                context.read<AppCubit>().locale.languageCode ==
                                        'ar'
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                            child:
                                Row(mainAxisSize: MainAxisSize.min, children: [
                              Icon(Icons.card_giftcard,
                                  color: Theme.of(context).iconTheme.color,
                                  size: 20),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(
                                AppStrings.gift(context),
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headline2,
                              ),
                            ]),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.12,
                          width: MediaQuery.of(context).size.width,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: const [
                              GiftsWidget(
                                count: 1,
                                icon: Icons.motorcycle,
                              ),
                              GiftsWidget(
                                count: 18,
                                icon: MdiIcons.car,
                              ),
                              GiftsWidget(
                                count: 64,
                                icon: MdiIcons.crown,
                              ),
                              GiftsWidget(
                                count: 236,
                                icon: MdiIcons.tshirtCrew,
                              ),
                              GiftsWidget(
                                count: 90,
                                icon: Icons.airplanemode_active_outlined,
                              ),
                              GiftsWidget(
                                count: 126,
                                icon: Icons.roller_skating_rounded,
                              ),
                              GiftsWidget(
                                count: 111,
                                icon: Icons.catching_pokemon,
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "ID : 648373",
                            style: Theme.of(context).primaryTextTheme.headline6,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      )),
    );
  }
}
