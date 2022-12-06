// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:roz/Core/constants/app_strings.dart';
import 'package:roz/Core/constants/asset_manager.dart';
import 'package:roz/Core/utils/media_query_ex.dart';

import '../../View Model/app_provider.dart';

class RatingScreen extends StatelessWidget {
  const RatingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.red, Colors.purple])),
      child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: TabBar(
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white,
                    indicatorColor: Colors.white,
                    labelStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                    ),
                    unselectedLabelStyle: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w900,
                    ),
                    tabs: [
                      Tab(
                        text: AppStrings.rich(context),
                      ),
                      Tab(
                        text: AppStrings.queen(context),
                      ),
                    ]),
              ),
              Expanded(
                child: TabBarView(children: [
                  Column(
                    children: [
                      Stack(children: [
                        Lottie.asset("assets/lottie/fireworks.json",
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                            width: context.width,
                            height: context.height * 0.09),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Align(
                              alignment: Alignment.bottomLeft,
                              child: TopRatitedWidget(
                                name: "PRINCE",
                                img: 'assets/images/img_circle_2.png',
                                framimg: "assets/images/frw.png",
                                diamond: "162574",
                                dimin: 75,
                              ),
                            ),
                            BounceInDown(
                              child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Column(
                                    children: [
                                      Stack(children: [
                                        Positioned(
                                          top: 31,
                                          left: 12,
                                          child: Container(
                                            height: 120,
                                            width: 120,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/img_circle_1.png'),
                                                  fit: BoxFit.fill),
                                            ),
                                          ),
                                        ),
                                        Image.asset(
                                          "assets/images/frg.png",
                                          height: 120 * 1.4,
                                          width: 120 * 1.2,
                                          fit: BoxFit.fill,
                                        )
                                      ]),
                                      const Text(
                                        "Basel",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            height: 25,
                                            width: 20,
                                            child: Image.asset(
                                              AssetManager.diamond,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          const Text(
                                            "196754",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w900),
                                          ),
                                        ],
                                      )
                                    ],
                                  )),
                            ),
                            const Align(
                              alignment: Alignment.bottomRight,
                              child: TopRatitedWidget(
                                name: "NANA",
                                img: 'assets/images/img_circle_0.png',
                                framimg: "assets/images/frb.png",
                                diamond: "113673",
                                dimin: 75,
                              ),
                            ),
                          ],
                        ),
                      ]),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(30))),
                          child: LiquidPullToRefresh(
                            showChildOpacityTransition: false,
                            color: Colors.transparent,
                            backgroundColor: Colors.amber,
                            onRefresh: () async {},
                            child: ListView.builder(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                physics: const BouncingScrollPhysics(),
                                itemCount: 20,
                                itemBuilder: (context, i) => Container(
                                      alignment: Alignment.center,
                                      height: context.height * 0.11,
                                      width: context.width,
                                      margin: const EdgeInsets.only(top: 5),
                                      decoration: BoxDecoration(
                                        color:
                                            context.read<AppProvider>().isDark == 0
                                                ? const Color(0xFF1D0529)
                                                : Colors.white54,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: ListTile(
                                        leading: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              "${i + 4}",
                                              style: Theme.of(context)
                                                  .primaryTextTheme
                                                  .bodyText1,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const CircleAvatar(
                                              radius: 23,
                                              backgroundColor: Colors.black,
                                              child: CircleAvatar(
                                                radius: 20,
                                                backgroundImage: AssetImage(
                                                    'assets/images/card_img_1.png'),
                                              ),
                                            )
                                          ],
                                        ),
                                        title: Text(
                                          "Romantic X",
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .headline2,
                                        ),
                                        trailing: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SizedBox(
                                              height: 25,
                                              width: 20,
                                              child: Image.asset(
                                                AssetManager.diamond,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Text(
                                              "102334",
                                              style: Theme.of(context)
                                                  .primaryTextTheme
                                                  .headline2,
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Stack(children: [
                        Lottie.asset("assets/lottie/fireworks.json",
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                            width: context.width,
                            height: context.height * 0.12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Align(
                              alignment: Alignment.bottomLeft,
                              child: TopRatitedWidget(
                                name: "PRINCE",
                                img: 'assets/images/img_circle_2.png',
                                framimg: "assets/images/frw.png",
                                diamond: "162574",
                                dimin: 75,
                              ),
                            ),
                            BounceInDown(
                              child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 120 * 1.2,
                                        height: 120 * 1.4,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.transparent),
                                        child: Stack(children: [
                                          Positioned(
                                            top: 30,
                                            left: 11,
                                            child: Container(
                                              height: 120,
                                              width: 120,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/img_circle_1.png'),
                                                    fit: BoxFit.fill),
                                              ),
                                            ),
                                          ),
                                          Image.asset(
                                            "assets/images/frg.png",
                                            height: 120 * 1.4,
                                            width: 120 * 1.2,
                                            fit: BoxFit.fill,
                                          )
                                        ]),
                                      ),
                                      const Text(
                                        "Basel",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            height: 25,
                                            width: 20,
                                            child: Image.asset(
                                              AssetManager.diamond,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          const Text(
                                            "196754",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w900),
                                          ),
                                        ],
                                      )
                                    ],
                                  )),
                            ),
                            const Align(
                              alignment: Alignment.bottomRight,
                              child: TopRatitedWidget(
                                name: "NANA",
                                img: 'assets/images/img_circle_0.png',
                                framimg: "assets/images/frb.png",
                                diamond: "113673",
                                dimin: 75,
                              ),
                            ),
                          ],
                        ),
                      ]),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(30))),
                          child: LiquidPullToRefresh(
                            showChildOpacityTransition: false,
                            color: Colors.transparent,
                            backgroundColor: Colors.amber,
                            onRefresh: () async {},
                            child: ListView.builder(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                physics: const BouncingScrollPhysics(),
                                itemCount: 20,
                                itemBuilder: (context, i) => Container(
                                      height: context.height * 0.1,
                                      width: context.width,
                                      margin: const EdgeInsets.only(top: 5),
                                      decoration: BoxDecoration(
                                        color:
                                            context.read<AppProvider>().isDark == 0
                                                ? const Color(0xFF1D0529)
                                                : Colors.white54,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: ListTile(
                                        leading: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              "${i + 4}",
                                              style: Theme.of(context)
                                                  .primaryTextTheme
                                                  .bodyText1,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const CircleAvatar(
                                              radius: 17,
                                              backgroundColor: Colors.black,
                                              child: CircleAvatar(
                                                radius: 16,
                                                backgroundImage: AssetImage(
                                                    'assets/images/card_img_1.png'),
                                              ),
                                            )
                                          ],
                                        ),
                                        title: Text(
                                          "Romantic X",
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .headline2,
                                        ),
                                        trailing: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SizedBox(
                                              height: 25,
                                              width: 20,
                                              child: Image.asset(
                                                AssetManager.diamond,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Text(
                                              "102334",
                                              style: Theme.of(context)
                                                  .primaryTextTheme
                                                  .headline2,
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                          ),
                        ),
                      )
                    ],
                  ),
                ]),
              )
            ],
          )),
    );
  }
}

class TopRatitedWidget extends StatelessWidget {
  final String img;
  final String framimg;
  final String name;
  final String diamond;

  final double dimin;
  const TopRatitedWidget({
    Key? key,
    required this.img,
    required this.framimg,
    required this.name,
    required this.diamond,
    required this.dimin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(alignment: Alignment.center, children: [
            Container(
              // padding: const EdgeInsets.all(10),
              height: dimin,
              width: dimin,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image:
                    DecorationImage(image: AssetImage(img), fit: BoxFit.fill),
              ),
            ),
            Image.asset(
              framimg,
              height: dimin * 1.2,
              width: dimin * 1.2,
              fit: BoxFit.fill,
            )
          ]),
          Text(
            name,
            style: const TextStyle(
                color: Colors.white, fontSize: 13, fontWeight: FontWeight.w900),
          ),
          Row(
            children: [
              SizedBox(
                height: 25,
                width: 20,
                child: Image.asset(
                  AssetManager.diamond,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                diamond,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w900),
              ),
            ],
          )
        ],
      ),
    );
  }
}
