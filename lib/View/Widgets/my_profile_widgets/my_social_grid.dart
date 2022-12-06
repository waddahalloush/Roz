// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:roz/Core/utils/media_query_ex.dart';
import 'package:roz/View/Screens/gallery_screen.dart';

class MySocialGrid extends StatelessWidget {
  final List<String> imgList;
  const MySocialGrid({
    Key? key,
    required this.imgList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return imgList.isEmpty
        ? const SizedBox(
            height: 20,
          )
        : GridView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: MediaQuery.of(context).size.width,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 1.0,
            ),
            itemCount: imgList.length,
            itemBuilder: (ctx, index) {
              return GridTile(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              GalleryViewScreen(images: imgList , idx: index,),
                        ));
                  },
                  child: Stack(alignment: Alignment.center, children: [
                    Container(),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(19),
                      child: Image.asset(
                        imgList[index],
                        height: context.height * 0.3,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      left: 2,
                      top: 0,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: const Icon(
                            Icons.remove_circle,
                            size: 23,
                            color: Color(0xFFAD45B3),
                          ),
                        ),
                      ),
                    )
                  ]),
                ),
              );
            },
          );
  }
}
