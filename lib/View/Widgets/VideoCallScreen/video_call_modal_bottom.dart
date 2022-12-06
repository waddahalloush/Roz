// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roz/Core/utils/media_query_ex.dart';
import 'package:roz/View%20Model/video_call_provider.dart';
import 'package:roz/View/Widgets/VideoCallScreen/video_call_get_coins_bottom_sheet.dart';

import '../../../Core/constants/asset_manager.dart';

void showVideoCallGiftsBottomSheet(BuildContext context) =>
    showModalBottomSheet(
        barrierColor: Colors.transparent,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => DraggableScrollableSheet(
              initialChildSize: 0.7,
              builder: (context, scrollController) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: context.width,
                height: context.height,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(35))),
                child: const VideoCallGiftsSheet(),
              ),
            ));

class VideoCallGiftsSheet extends StatelessWidget {
  const VideoCallGiftsSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.dehaze_sharp,
                color: Colors.white,
              )),
          Row(
            children: [
              const CircleAvatar(
                radius: 13,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(AssetManager.coin),
              ),
              const SizedBox(
                width: 5,
              ),
              Text("25", style: Theme.of(context).primaryTextTheme.headline5),
              const Spacer(),
              TextButton.icon(
                  style: TextButton.styleFrom(
                    visualDensity: VisualDensity.compact,
                    backgroundColor: Colors.amber,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    showVideoCallGetCoinsBottomSheet(context);
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.indigo,
                    size: 18,
                  ),
                  label: const Text(
                    "Get Coins",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.indigo,
                        fontWeight: FontWeight.w900),
                  ))
            ],
          ),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            children: const [
              VideoCallGiftsWidget(
                count: 1,
                emoji: "\u{1f604}",
                gif: "assets/images/smile3.gif",
                desc: "Sent You Smile",
              ),
              VideoCallGiftsWidget(
                count: 5,
                emoji: "\u{1f917}",
                gif: "assets/images/smile2.gif",
                desc: "Sent You Emoji",
              ),
              VideoCallGiftsWidget(
                count: 10,
                emoji: "\u{1f609}",
                gif: "assets/images/dis5.gif",
                desc: "Sent You Wink",
              ),
              VideoCallGiftsWidget(
                count: 20,
                emoji: "\u{1f605}",
                gif: "assets/images/dis4.gif",
                desc: "Sent You Shy Emoji",
              ),
              VideoCallGiftsWidget(
                count: 50,
                emoji: "\u{1f970}",
                gif: "assets/images/diss.gif",
                desc: "Sent You Love Emoji",
              ),
              VideoCallGiftsWidget(
                count: 80,
                emoji: "\u{1f62D}",
                gif: "assets/images/dis3.gif",
                desc: "Sent You Cry Emoji",
              ),
              VideoCallGiftsWidget(
                count: 100,
                emoji: "\u{1f928}",
                gif: "assets/images/boy2.gif",
                desc: "Sent You Boy",
              ),
              VideoCallGiftsWidget(
                count: 120,
                emoji: "\u{1f973}",
                gif: "assets/images/pr2.gif",
                desc: "Sent You Girl",
              ),
              VideoCallGiftsWidget(
                count: 150,
                emoji: "\u{1f924}",
                gif: "assets/images/dis7.gif",
                desc: "Sent You OMG Emoji",
              ),
              VideoCallGiftsWidget(
                count: 160,
                emoji: "\u{1f60D}",
                gif: "assets/images/pr.gif",
                desc: "Sent You Love Girl",
              ),
              VideoCallGiftsWidget(
                count: 180,
                emoji: "\u{1f63B}",
                gif: "assets/images/catt.gif",
                desc: "Sent You Cat",
              ),
              VideoCallGiftsWidget(
                count: 190,
                emoji: "\u{1f498}",
                gif: "assets/images/h2.gif",
                desc: "Sent You HeartBeat",
              ),
              VideoCallGiftsWidget(
                count: 200,
                emoji: "\u{2764}",
                gif: "assets/images/h5.gif",
                desc: "Sent You Heart",
              ),
              VideoCallGiftsWidget(
                count: 210,
                emoji: "\u{1f608}",
                gif: "assets/images/po.gif",
                desc: "Sent You Dragon",
              ),
              VideoCallGiftsWidget(
                count: 230,
                emoji: "\u{1F48B}",
                gif: "assets/images/kiss.gif",
                desc: "Sent You Kiss",
              ),
              VideoCallGiftsWidget(
                count: 250,
                emoji: "\u{1F98B}",
                gif: "assets/images/fly.gif",
                desc: "Sent You Butterfly",
              ),
              VideoCallGiftsWidget(
                count: 260,
                emoji: "\u{1F98A}",
                gif: "assets/images/dd.gif",
                desc: "Sent You Wolf",
              ),
              VideoCallGiftsWidget(
                count: 280,
                emoji: "\u{1F436}",
                gif: "assets/images/dog.gif",
                desc: "Sent You Dog",
              ),
              VideoCallGiftsWidget(
                count: 300,
                emoji: "\u{1F981}",
                gif: "assets/images/lion.gif",
                desc: "Sent You Lion",
              ),
              VideoCallGiftsWidget(
                count: 310,
                emoji: "\u{1F490}",
                gif: "assets/images/flw.gif",
                desc: "Sent You Flowers",
              ),
              VideoCallGiftsWidget(
                count: 320,
                emoji: "\u{1F339}",
                gif: "assets/images/rrr.gif",
                desc: "Sent You Valentine",
              ),
              VideoCallGiftsWidget(
                count: 330,
                emoji: "\u{1F30B}",
                gif: "assets/images/exp.gif",
                desc: "Sent You Bomb",
              ),
              VideoCallGiftsWidget(
                count: 340,
                emoji: "\u{1F37B}",
                gif: "assets/images/ex3.gif",
                desc: "Sent You Party",
              ),
              VideoCallGiftsWidget(
                count: 350,
                emoji: "\u{1F30D}",
                gif: "assets/images/q2.gif",
                desc: "Sent You Color Bomb",
              ),
            ],
          )
        ],
      ),
    );
  }
}

class VideoCallGiftsWidget extends StatelessWidget {
  final String emoji;
  final String gif;
  final String desc;
  final int count;
  const VideoCallGiftsWidget({
    Key? key,
    required this.emoji,
    required this.gif,
    required this.desc,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<VideoCallProvider>().chatGifInVideoCall(gif, emoji, desc);
        Navigator.pop(context);
      },
      child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  emoji,
                  style: const TextStyle(fontSize: 35),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.monetization_on,
                      color: Colors.amber,
                      size: 16,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(count.toString(),
                        style: Theme.of(context).primaryTextTheme.headline5),
                  ],
                ),
              ])),
    );
  }
}
