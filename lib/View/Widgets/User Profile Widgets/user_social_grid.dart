// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:roz/View/Screens/gallery_screen.dart';

class UserSocialGrid extends StatelessWidget {
  final List<String> imageProfile;
  const UserSocialGrid({
    Key? key,
    required this.imageProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return imageProfile.isEmpty
        ? const SizedBox(
            height: 20,
          )
        : GridView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: MediaQuery.of(context).size.width,
              mainAxisSpacing: 5.0,
              childAspectRatio: 16 / 12,
              crossAxisSpacing: 5.0,
            ),
            itemCount: imageProfile.length,
            itemBuilder: (ctx, index) {
              return GridTile(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              GalleryViewScreen(images: imageProfile , idx: index,),
                        ));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(19),
                    child: Image.asset(
                      imageProfile[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          );
  }
}
