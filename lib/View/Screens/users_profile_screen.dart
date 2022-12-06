// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'package:roz/Core/utils/media_query_ex.dart';
import 'package:roz/View/Screens/chat_screen.dart';
import 'package:roz/View/Widgets/User%20Profile%20Widgets/user_profile_picture.dart';

import '../../Core/constants/app_strings.dart';
import '../../View Model/app_provider.dart';
import '../Widgets/User Profile Widgets/user_profile_appbar.dart';
import '../Widgets/User Profile Widgets/user_social_grid.dart';
import '../Widgets/my_profile_widgets/gifts_widget.dart';
import '../Widgets/my_profile_widgets/user_info_widget.dart';

class UserProfileScreen extends StatelessWidget {
  final String image;
  final String name;
  final String status;
  final List<String> imgProfile;
  const UserProfileScreen({
    Key? key,
    required this.image,
    required this.name,
    required this.status,
    required this.imgProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: InkWell(
      //   onTap: () {
      //     Navigator.pushNamed(context, AppRouter.matchRoute);
      //   },
      //   child: Container(
      //       width: 180,
      //       height: 55,
      //       margin: const EdgeInsets.symmetric(vertical: 8),
      //       decoration: BoxDecoration(
      //         boxShadow: const [BoxShadow(blurRadius: 1)],
      //         borderRadius: BorderRadius.circular(25),
      //         gradient: const LinearGradient(
      //           begin: Alignment.topLeft,
      //           end: Alignment.bottomRight,
      //           colors: [
      //             Color(0xFFFA457E),
      //             Color(0xFF7B49FF),
      //           ],
      //         ),
      //       ),
      //       child: Column(
      //         mainAxisSize: MainAxisSize.min,
      //         children: [
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceAround,
      //             mainAxisSize: MainAxisSize.min,
      //             children: [
      //               const Icon(
      //                 Icons.videocam,
      //                 color: Colors.white,
      //                 size: 30,
      //               ),
      //               const SizedBox(
      //                 width: 20,
      //               ),
      //               Text(
      //                 AppStrings.videoChat(context),
      //                 style: const TextStyle(
      //                     color: Colors.white,
      //                     fontSize: 15,
      //                     fontWeight: FontWeight.w900,
      //                     ),
      //               )
      //             ],
      //           ),
      //           Row(
      //             mainAxisSize: MainAxisSize.min,
      //             children: const [
      //               Icon(
      //                 Icons.monetization_on,
      //                 color: Colors.amber,
      //                 size: 15,
      //               ),
      //               SizedBox(
      //                 width: 10,
      //               ),
      //               Text(
      //                 "1.5 token/per minute",
      //                 style: TextStyle(
      //                     color: Colors.white,
      //                     fontSize: 10,
      //                     ),
      //               )
      //             ],
      //           ),
      //         ],
      //       )),
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const UserProfileAppbar(),
          UserProfilePictureWidget(
            image: image,
            name: name,
            status: status,
          ),
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(right: 8),
                alignment: Alignment.centerRight,
                width: MediaQuery.of(context).size.width,
                color: context.read<AppProvider>().isDark == 0
                    ? const Color(0xFF130032)
                    : Theme.of(context).scaffoldBackgroundColor,
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.only(left: 8),
                alignment: Alignment.centerLeft,
                color: const Color(0xFFAD45B3),
                width: MediaQuery.of(context).size.width / 2 - 35,
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
                    Row(
                      children: [
                        Text(
                          name,
                          style: Theme.of(context).primaryTextTheme.headline1,
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFAD45B3)),
                            child: const Icon(
                              Icons.favorite,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFAD45B3)),
                            child: const Icon(
                              Icons.thumb_up,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ChatScreen(image: image, name: name),
                                ));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFAD45B3)),
                            child: const Icon(
                              Icons.message,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        )
                      ],
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
                      alignment:
                          context.read<AppProvider>().locale.languageCode == 'ar'
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                      child: Text(
                        AppStrings.img(context),
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()
                              ..shader = const LinearGradient(
                                colors: [
                                  Color(0xFFFA457E),
                                  Color.fromARGB(255, 81, 69, 250),
                                  Color.fromARGB(255, 250, 69, 168),
                                  Color(0xFF7B49FF),
                                ],
                                // begin: Alignment.centerLeft,
                                // end: Alignment.centerRight,
                              ).createShader(
                                  const Rect.fromLTRB(3.0, 0.0, 200.0, 70.0))),
                      ),
                    ),
                    SizedBox(
                      height: imgProfile.isEmpty
                          ? context.height * 0.03
                          : context.height * 0.15,
                      width: context.width,
                      child: UserSocialGrid(
                        imageProfile: imgProfile,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Align(
                        alignment:
                            context.read<AppProvider>().locale.languageCode == 'ar'
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                        child: Text(
                          AppStrings.video(context),
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()
                                ..shader = const LinearGradient(
                                  colors: [
                                    Color(0xFFFA457E),
                                    Color.fromARGB(255, 81, 69, 250),
                                    Color.fromARGB(255, 250, 69, 168),
                                    Color(0xFF7B49FF),
                                  ],
                                  // begin: Alignment.centerLeft,
                                  // end: Alignment.centerRight,
                                ).createShader(const Rect.fromLTRB(
                                    3.0, 0.0, 200.0, 70.0))),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: imgProfile.isEmpty
                          ? context.height * 0.03
                          : context.height * 0.15,
                      width: context.width,
                      child: UserSocialGrid(
                        imageProfile: imgProfile,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 8, bottom: 5),
                      alignment:
                          context.read<AppProvider>().locale.languageCode == 'ar'
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                      child: Text(
                        AppStrings.shortBio(context),
                        style: Theme.of(context).primaryTextTheme.headline2,
                      ),
                    ),
                    Align(
                      alignment:
                          context.read<AppProvider>().locale.languageCode == 'ar'
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
                            context.read<AppProvider>().locale.languageCode == 'ar'
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                        child: Row(mainAxisSize: MainAxisSize.min, children: [
                          Icon(Icons.card_giftcard,
                              color: Theme.of(context).iconTheme.color,
                              size: 20),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            AppStrings.gift(context),
                            style: Theme.of(context).primaryTextTheme.headline2,
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
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 100),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "ID : 648373",
                          style: Theme.of(context).primaryTextTheme.headline6,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
