// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:roz/Core/utils/media_query_ex.dart';

class ProfilePictureWidget extends StatelessWidget {
  final ImageProvider<Object> image;
  const ProfilePictureWidget({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.of(context).push(CupertinoPageRoute(
        //   builder: (context) =>
        //        PhotoViewScreen(image: image),
        // ));
      },
      child: SizedBox(
          height: context.height * 0.32,
          width: context.width * 0.75,
          child: Ink.image(
            image: image,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          )),
    );
  }
}
