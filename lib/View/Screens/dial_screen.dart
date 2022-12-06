// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:roz/Core/utils/media_query_ex.dart';
import 'package:roz/View/Screens/video_calling_screen.dart';

import '../../Core/utils/Animation Page/fade_transition.dart';
import '../../Core/utils/app_router.dart';
import '../../Core/utils/exit_alert_dialog.dart';

class DialScreen extends StatefulWidget {
  final String image;
  final String name;
  const DialScreen({
    Key? key,
    required this.image,
    required this.name,
  }) : super(key: key);

  @override
  State<DialScreen> createState() => _DialScreenState();
}

class _DialScreenState extends State<DialScreen> {
  startTime() {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.of(context)
          .pushReplacement(FadeRoute(page: const VideoCallingScreen()));
    });
  }

  @override
  void initState() {
    startTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: context.width,
          height: context.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(widget.image),
                  opacity: 0.85,
                  fit: BoxFit.cover)),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              DialUserPic(
                image: widget.image,
                size: 120,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(widget.name,
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Colors.white)),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Waiting for ${widget.name} to accept your call",
                style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const Spacer(),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     DialButton(
              //       iconSrc: context.read<AppCubit>().volumMute
              //           ? Icons.volume_off
              //           : Icons.volume_up,
              //       text: "Microphone",
              //       press: () {
              //         context.read<AppCubit>().muteVolume();
              //       },
              //     ),
              //     DialButton(
              //       iconSrc: Icons.videocam,
              //       text: "Video",
              //       press: () {
              //         Navigator.pushReplacementNamed(
              //             context, AppRouter.videocallRoute);
              //       },
              //     ),
              //     DialButton(
              //       iconSrc: Icons.wechat,
              //       text: "Message",
              //       press: () {
              //         Navigator.pushReplacement(
              //             context,
              //             FadeRoute(
              //                 page: ChatScreen(image: image, name: name)));
              //       },
              //     ),
              //   ],
              // ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        showExitAlert(context);
                      },
                      onDoubleTap: () {
                        Navigator.pushReplacementNamed(
                            context, AppRouter.homeRoute);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: 70,
                        height: 70,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xFFDD3663)),
                        child: const Icon(
                          Icons.call_end,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showExitAlert(context);
                      },
                      onDoubleTap: () {
                        Navigator.pushReplacementNamed(
                            context, AppRouter.homeRoute);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: 70,
                        height: 70,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.teal),
                        child: const Icon(
                          Icons.call_end,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DialButton extends StatelessWidget {
  final String text;
  final IconData iconSrc;

  final VoidCallback press;
  const DialButton({
    Key? key,
    required this.text,
    required this.press,
    required this.iconSrc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          IconButton(
            icon: Icon(
              iconSrc,
              size: 30,
              color: Colors.white,
            ),
            onPressed: press,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
            ),
          )
        ],
      ),
    );
  }
}

class DialUserPic extends StatelessWidget {
  final double size;
  final String image;
  const DialUserPic({
    Key? key,
    required this.size,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 3)),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
