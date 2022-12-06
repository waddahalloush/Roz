// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:roz/Core/utils/Animation%20Page/fade_transition.dart';
import 'package:roz/Core/utils/media_query_ex.dart';
import 'package:roz/View/Screens/dial_screen.dart';
import '../../../Core/utils/Global Widgets/rounded_gradiant_button.dart';
import '../../../Core/utils/user_contact_dialog.dart';
import '../../Screens/photo_view_screen.dart';

class UserProfilePictureWidget extends StatelessWidget {
  final String image;
  final String name;
  final String status;
  const UserProfilePictureWidget({
    Key? key,
    required this.image,
    required this.name,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PhotoViewScreen(
                    image: image,
                  ),
                ));
          },
          child: SizedBox(
            height: context.height * 0.4,
            width: context.width,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
        ),
        Positioned(
            right: 15,
            top: 15,
            child: RoundedGradiantButton(
                dimenstion: 40,
                icon: Icons.videocam,
                onTaap: () {
                  status == "Private"
                      ? userContactDialog(context, image, () {
                          Navigator.push(
                              context,
                              FadeRoute(
                                  page: DialScreen(
                                image: image,
                                name: name,
                              )));
                        })
                      : Navigator.push(
                          context,
                          FadeRoute(
                              page: DialScreen(
                            image: image,
                            name: name,
                          )));
                }))
      ],
    );
  }
}
