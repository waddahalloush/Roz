// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:draggable_float_widget/draggable_float_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:roz/Core/utils/media_query_ex.dart';
import 'package:roz/View%20Model/app_provider.dart';
import 'package:roz/View%20Model/video_call_provider.dart';
import 'package:roz/View/Widgets/VideoCallScreen/chat_gift_in_video_call.dart';
import '../../Core/constants/agora_keys.dart';
import '../Widgets/VideoCallScreen/chat_message_in_video_call.dart';
import '../Widgets/VideoCallScreen/video_call_chat.dart';
import '../Widgets/VideoCallScreen/video_call_modal_bottom.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';

class VideoCallingScreen extends StatefulWidget {
  const VideoCallingScreen({Key? key}) : super(key: key);

  @override
  State<VideoCallingScreen> createState() => _VideoCallingScreenState();
}

class _VideoCallingScreenState extends State<VideoCallingScreen> {
  int? _remoteUid;
  int uid = 0;
  late RtcEngine agoraEngine;
  showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  @override
  void initState() {
    initForAgora();
    super.initState();
  }

  Future<void> initForAgora() async {
    //create the engine
    agoraEngine = createAgoraRtcEngine();
    await agoraEngine.initialize(const RtcEngineContext(appId: agoraId));
    await agoraEngine.enableVideo();
    agoraEngine.registerEventHandler(RtcEngineEventHandler(
      onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
        showMessage("Local user uid:${connection.localUid} joined the channel");
      },
      onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
        showMessage("Remote user uid:$remoteUid joined the channel");
        setState(() {
          _remoteUid = remoteUid;
        });
      },
      onUserOffline: (RtcConnection connection, int remoteUid,
          UserOfflineReasonType reason) {
        showMessage("Remote user uid:$remoteUid left the channel");
        setState(() {
          _remoteUid = null;
        });
      },
    ));
    join();
  }

  void join() async {
    await agoraEngine.startPreview();

    // Set channel options including the client role and channel profile
    ChannelMediaOptions options = const ChannelMediaOptions(
      clientRoleType: ClientRoleType.clientRoleAudience,
      isAudioFilterable: true,
      channelProfile: ChannelProfileType.channelProfileCommunication1v1,
    );

    await agoraEngine.joinChannel(
      token: agoraToken,
      channelId: agoraChannelName,
      options: options,
      uid: uid,
    );
  }

  @override
  void dispose() async {
    await agoraEngine.leaveChannel();
    await agoraEngine.stopPreview();
    agoraEngine.stopDirectCdnStreaming();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log("==================rebuild==============");
    return SafeArea(child: Consumer<VideoCallProvider>(
      builder: (context, myType, child) {
        return GestureDetector(
          onTap: () {
            myType.changeChatIconsVisilility();
          },
          onDoubleTap: () {},
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            extendBodyBehindAppBar: true,
            extendBody: true,
            bottomNavigationBar: Visibility(
              visible: myType.isVisible,
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
                      onPressed: () {
                        agoraEngine.switchCamera();
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        myType.volumMute ? Icons.volume_off : Icons.volume_up,
                        size: 30,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        myType.muteVolume();
                        agoraEngine.muteRecordingSignal(myType.volumMute);
                      },
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Visibility(
              visible: myType.isVisible,
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _remoteUid = null;
                  });
                  agoraEngine.stopPreview();
                  agoraEngine
                      .leaveChannel()
                      .whenComplete(() => Navigator.pop(context));
                },
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
                  SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                      child: remoteVideo()),
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
                          visible: myType.isVisible,
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
                                    itemCount: myType.chatemojiList.length,
                                    itemBuilder: (context, idx) =>
                                        ChatGiftWithVideoCall(
                                      senderPicture:
                                          "assets/images/profile.png",
                                      time: "X 1",
                                      senderName: "Basel Barakat",
                                      chatMessage:
                                          myType.chatemojiList[idx].disc,
                                      chatEmoji:
                                          myType.chatemojiList[idx].emoji,
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
                                        controller: myType.scrollController,
                                        physics: const BouncingScrollPhysics(),
                                        itemCount:
                                            myType.chatMessageList.length,
                                        itemBuilder: (context, idc) =>
                                            ChatMessageWithVideoCall(
                                          senderPicture:
                                              "assets/images/profile.png",
                                          time: "03:45",
                                          senderName: "Basel Barakat",
                                          chatMessage:
                                              myType.chatMessageList[idc],
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
                        itemCount: myType.chatGifList.length,
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
                                      AssetImage(myType.chatGifList[index]))),
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
                      visible: myType.isVisible,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xFF230f4E),
                            ),
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  child: Text(
                                    'Matched',
                                    style: TextStyle(
                                        color: context
                                                    .read<AppProvider>()
                                                    .isDark ==
                                                0
                                            ? Colors.yellow[700]
                                            : Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 3, bottom: 3),
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
                              color: context.read<AppProvider>().isDark == 0
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
                                  padding: EdgeInsets.symmetric(horizontal: 4),
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
                        debug: true,
                        initPositionXInLeft: false,
                        initPositionYInTop: true),
                    height: 120,
                    width: 100,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: AgoraVideoView(
                          controller: VideoViewController(
                            useAndroidSurfaceView: true,
                            rtcEngine: agoraEngine,
                            canvas: VideoCanvas(
                                uid: uid,
                                mirrorMode:
                                    VideoMirrorModeType.videoMirrorModeAuto,
                                sourceType:
                                    VideoSourceType.videoSourceCameraPrimary),
                          ),
                        )),
                  )
                ],
              ),
            ),
          ),
        );
      },
    ));
  }

  Widget remoteVideo() => AgoraVideoView(
        controller: VideoViewController.remote(
          rtcEngine: agoraEngine,
          connection: const RtcConnection(
            channelId: agoraChannelName,
          ),
          canvas: VideoCanvas(
              uid: _remoteUid,
              mirrorMode: VideoMirrorModeType.videoMirrorModeAuto,
              sourceType: VideoSourceType.videoSourceCameraPrimary),
        ),
      );
}
