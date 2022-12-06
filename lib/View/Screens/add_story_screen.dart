// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:story/story.dart';

import 'package:roz/Core/utils/Global%20Widgets/rounded_gradiant_button.dart';
import 'package:roz/Core/utils/app_router.dart';
import 'package:roz/Core/utils/media_query_ex.dart';
import 'package:roz/View/Screens/users_profile_screen.dart';

import '../../Core/utils/Animation Page/scale_transition.dart';

class AddStoryScreen extends StatelessWidget {
  final String name;
  final String userImg;
  final String status;
  final Color statusColor;
  final List<String> storyImg;

  const AddStoryScreen({
    Key? key,
    required this.name,
    required this.userImg,
    required this.status,
    required this.statusColor,
    required this.storyImg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoryPageView(
        itemBuilder: (context, pageIndex, storyIndex) {
          return Stack(
            children: [
              Positioned.fill(
                child: Container(color: Colors.black),
              ),
              Positioned.fill(
                child: Image.asset(
                  storyImg[storyIndex],
                  fit: BoxFit.cover,
                ),
              ),
            ],
          );
        },
        gestureItemBuilder: (context, pageIndex, storyIndex) {
          return SizedBox(
            width: context.width,
            height: context.height,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      color: Colors.white,
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 32),
                      child: RoundedGradiantButton(
                          icon: Icons.videocam,
                          dimenstion: 55,
                          onTaap: () {
                            Navigator.pushReplacementNamed(
                                context, AppRouter.videocallRoute);
                          })),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 44, left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              ScaleRoute(
                                page: UserProfileScreen(
                                    status: status,
                                    imgProfile: storyImg,
                                    image: userImg,
                                    name: name),
                              ));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 32,
                                width: 32,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(userImg),
                                      fit: BoxFit.cover,
                                    ),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.white, width: 2)),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                name,
                                style: const TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 15,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "5.806",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.call_rounded,
                            color: statusColor,
                            size: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              status,
                              style: TextStyle(
                                fontSize: 15,
                                color: statusColor,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        pageLength: 1,
        storyLength: (int pageIndex) {
          return storyImg.length;
        },
        onPageLimitReached: () {
          Navigator.pushReplacement(
              context,
              ScaleRoute(
                page: UserProfileScreen(
                    status: status,
                    imgProfile: storyImg,
                    image: userImg,
                    name: name),
              ));
        },
      ),
    );
  }
}
