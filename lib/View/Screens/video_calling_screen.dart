// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:draggable_float_widget/draggable_float_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:roz/Core/utils/media_query_ex.dart';
import 'package:roz/View/Widgets/VideoCallScreen/chat_gift_in_video_call.dart';

import '../../Bloc/cubit/app_cubit.dart';
import '../Widgets/VideoCallScreen/chat_message_in_video_call.dart';
import '../Widgets/VideoCallScreen/video_call_chat.dart';
import '../Widgets/VideoCallScreen/video_call_modal_bottom.dart';

class VideoCallingScreen extends StatelessWidget {
  const VideoCallingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          var cubit = context.read<AppCubit>();
          return GestureDetector(
            onTap: () {
              cubit.changeChatIconsVisilility();
            },
            onDoubleTap: () {},
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              extendBodyBehindAppBar: true,
              extendBody: true,
              bottomNavigationBar: Visibility(
                visible: cubit.isVisible,
                child: BottomAppBar(
                  color: Colors.transparent,
                  // this creates a notch in the center of the bottom bar
                  shape: const CircularNotchedRectangle(),
                  notchMargin: 6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.card_giftcard,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          showVideoCallGiftsBottomSheet(
                            context,
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.wechat,
                          color: Colors.white,
                          size: 32,
                        ),
                        onPressed: () {
                          showVideoCallChatSheet(context);
                        },
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.flip_camera_ios,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(
                          cubit.volumMute ? Icons.volume_off : Icons.volume_up,
                          size: 30,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          cubit.muteVolume();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: Visibility(
                visible: cubit.isVisible,
                child: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Colors.black,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xffD6376E),
                          Color(0xFFAD45B3),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.transparent,
                      child: Icon(
                        Icons.call,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              body: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: const BoxDecoration(color: Colors.tealAccent),
                    ),
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.black, Colors.transparent],
                              begin: Alignment.bottomCenter,
                              end: Alignment.center,
                            ),
                          ),
                        ),
                        Visibility(
                            visible: cubit.isVisible,
                            child: Positioned(
                              left: 10,
                              bottom: 80,
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.centerRight,
                                    width: context.width / 2.2,
                                    height: context.height / 5,
                                    decoration: const BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: cubit.chatemojiList.length,
                                      itemBuilder: (context, idx) =>
                                          ChatGiftWithVideoCall(
                                        senderPicture:
                                            "assets/images/profile.png",
                                        time: "X 1",
                                        senderName: "Basel Barakat",
                                        chatMessage:
                                            cubit.chatemojiList[idx].disc,
                                        chatEmoji:
                                            cubit.chatemojiList[idx].emoji,
                                      ),
                                    ),
                                  ),
                                  ShaderMask(
                                    shaderCallback: (bounds) {
                                      return LinearGradient(
                                              colors: [
                                            Colors.white.withOpacity(0.1),
                                            Colors.white,
                                          ],
                                              stops: const [
                                            0.001,
                                            0.08,
                                          ],
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              tileMode: TileMode.mirror)
                                          .createShader(bounds);
                                    },
                                    child: Container(
                                        alignment: Alignment.centerRight,
                                        width: context.width / 2.2,
                                        height: context.height / 3,
                                        decoration: const BoxDecoration(
                                          color: Colors.transparent,
                                        ),
                                        child: ListView.builder(
                                          controller: cubit.scrollController,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemCount:
                                              cubit.chatMessageList.length,
                                          itemBuilder: (context, idc) =>
                                              ChatMessageWithVideoCall(
                                            senderPicture:
                                                "assets/images/profile.png",
                                            time: "03:45",
                                            senderName: "Basel Barakat",
                                            chatMessage:
                                                cubit.chatMessageList[idc],
                                            chatEmoji: "",
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                            )),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: cubit.chatGifList.length,
                          itemBuilder: (context, index) => Container(
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [Colors.black, Colors.transparent],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.center,
                                ),
                                image: DecorationImage(
                                    image:
                                        AssetImage(cubit.chatGifList[index]))),
                          ),
                        ),
                        Positioned(
                          top: 5,
                          left: 5,
                          child: IconButton(
                            icon: const Icon(FontAwesomeIcons.arrowLeftLong),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      right: 10,
                      bottom: 50,
                      child: Visibility(
                        visible: cubit.isVisible,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: const Color(0xFF230f4E),
                              ),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    child: Text(
                                      'Matched',
                                      style: TextStyle(
                                          color: cubit.isDark == 0
                                              ? Colors.yellow[700]
                                              : Colors.white),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 3, bottom: 3),
                                    child: Image.asset(
                                      'assets/images/heart.png',
                                      height: 18,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Text(
                                'Sara Christin',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: 'Cairo'),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              height: 40,
                              width: 90,
                              decoration: BoxDecoration(
                                color: cubit.isDark == 0
                                    ? Colors.black38
                                    : Colors.grey[800],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 6,
                                    child: CircleAvatar(
                                      radius: 5,
                                      backgroundColor:
                                          Theme.of(context).primaryColorLight,
                                    ),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4),
                                    child: Text(
                                      '27:15',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    DraggableFloatWidget(
                      config: const DraggableFloatWidgetBaseConfig(
                          initPositionXInLeft: false, initPositionYInTop: true),
                      height: 120,
                      width: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/images/sample1.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
