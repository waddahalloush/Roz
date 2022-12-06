// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:roz/Core/utils/Global%20Widgets/rounded_gradiant_button.dart';

class DatingUsersWidget extends StatelessWidget {
  final String image;
  final String name;
  final String age;
  final String price;
  final String onOffString;
  final Color onOffColor;
  final VoidCallback videoCall;
  final VoidCallback onTap;
  final int isTrend;
  const DatingUsersWidget({
    Key? key,
    required this.image,
    required this.name,
    required this.age,
    required this.price,
    required this.onOffString,
    required this.onOffColor,
    required this.videoCall,
    required this.onTap,
    required this.isTrend,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(children: [
        Stack(alignment: Alignment.bottomCenter, children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover)),
          ),
        ]),
        Positioned(
            left: 12,
            bottom: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.female,
                          color: Colors.white,
                          size: 18,
                        ),
                        Text(
                          age.toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: onOffColor),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(onOffString,
                          style: TextStyle(
                              fontSize: 15,
                              color: onOffColor,
                              fontWeight: FontWeight.w900)),
                    ],
                  ),
                )
              ],
            )),
        Positioned(
            right: 10,
            bottom: 10,
            child: RoundedGradiantButton(
                icon: Icons.videocam, dimenstion: 35, onTaap: videoCall)),
      ]),
    );
  }
}
