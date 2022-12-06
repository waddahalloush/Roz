import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:roz/View%20Model/discover_provider.dart';
import 'package:roz/View/Widgets/discover_screen_widgets/dating_user_widget.dart';
import '../../../Core/utils/Animation Page/fade_transition.dart';
import '../../../Core/utils/Animation Page/scale_transition.dart';
import '../../../Core/utils/user_contact_dialog.dart';
import '../../Screens/add_story_screen.dart';
import '../../Screens/dial_screen.dart';
import '../../Screens/users_profile_screen.dart';

class DescoverYouLiked extends StatelessWidget {
  const DescoverYouLiked({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final DiscoverProvider cubit;

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      showChildOpacityTransition: false,
      color: Colors.transparent,
      backgroundColor: Colors.deepPurple,
      onRefresh: () async {},
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4,
            childAspectRatio: 9 / 12,
            mainAxisSpacing: 2),
        itemCount: cubit.storyList.length,
        itemBuilder: (context, index) => DatingUsersWidget(
          isTrend: index,
          age: cubit.storyList[index].age.toString(),
          image: cubit.storyList[index].imgPath,
          name: cubit.storyList[index].name,
          price: cubit.storyList[index].count.toString(),
          onOffColor: cubit.storyList[index].status == 'Online'
              ? Colors.greenAccent
              : cubit.storyList[index].status == "Private"
                  ? Colors.red
                  : Colors.grey.shade300,
          onOffString: cubit.storyList[index].status,
          onTap: () {
            cubit.storyList[index].imgProfile.isEmpty
                ? Navigator.push(
                    context,
                    ScaleRoute(
                      page: UserProfileScreen(
                          status: cubit.storyList[index].status,
                          imgProfile: cubit.storyList[index].imgProfile,
                          image: cubit.storyList[index].imgPath,
                          name: cubit.storyList[index].name),
                    ))
                : Navigator.push(
                    context,
                    ScaleRoute(
                      page: AddStoryScreen(
                          storyImg: cubit.storyList[index].imgProfile,
                          userImg: cubit.storyList[index].imgPath,
                          status: cubit.storyList[index].status,
                          statusColor: cubit.storyList[index].status == 'Online'
                              ? Colors.greenAccent
                              : cubit.storyList[index].status == "Private"
                                  ? Colors.red
                                  : Colors.grey.shade300,
                          name: cubit.storyList[index].name),
                    ));
          },
          videoCall: () {
            cubit.storyList[index].status == "Private"
                ? userContactDialog(context, cubit.storyList[index].imgPath,
                    () {
                    Navigator.push(
                        context,
                        FadeRoute(
                            page: DialScreen(
                          image: cubit.storyList[index].imgPath,
                          name: cubit.storyList[index].name,
                        )));
                  })
                : Navigator.push(
                    context,
                    FadeRoute(
                        page: DialScreen(
                      image: cubit.storyList[index].imgPath,
                      name: cubit.storyList[index].name,
                    )));
          },
        ),
      ),
    );
  }
}
