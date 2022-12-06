// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:roz/Bloc/cubit/app_cubit.dart';
import 'package:roz/Core/constants/app_strings.dart';

class ChatScreen extends StatelessWidget {
  final String image;
  final String name;
  const ChatScreen({
    Key? key,
    required this.image,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                clipBehavior: Clip.none,
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.topRight,
                        width: MediaQuery.of(context).size.width,
                        color: Theme.of(context).scaffoldBackgroundColor,
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: IconButton(
                          icon: const Icon(
                            Icons.more_vert,
                            size: 28,
                          ),
                          color: Theme.of(context).iconTheme.color,
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.topLeft,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xffD6376E), Color(0xFFAD45B3)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        width: MediaQuery.of(context).size.width / 1.9,
                        height: MediaQuery.of(context).size.height * 0.15,
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
                    top: 50,
                    child: CircleAvatar(
                      radius: 57,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 55,
                        backgroundImage: AssetImage(image),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.10,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).primaryTextTheme.headline1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 4),
                    child: CircleAvatar(
                      radius: 4,
                      backgroundColor: Colors.lightGreenAccent[400],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Image.asset(
                        'assets/images/chat icon.png',
                        height: 30,
                      ),
                      color: Theme.of(context).iconTheme.color,
                      onPressed: () {},
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: IconButton(
                        icon: ShaderMask(
                            blendMode: BlendMode.srcIn,
                            shaderCallback: (Rect bounds) {
                              return const LinearGradient(
                                colors: [
                                  Color(0xFFFA809D),
                                  Color.fromARGB(255, 178, 32, 94)
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ).createShader(bounds);
                            },
                            child: const Icon(FontAwesomeIcons.video)),
                        color: Theme.of(context).iconTheme.color,
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: MediaQuery.of(context).size.width * 0.65,
                      height: MediaQuery.of(context).size.height * 0.09,
                      decoration: BoxDecoration(
                          color: context.read<AppCubit>().isDark == 0
                              ? Colors.grey.shade800
                              : Colors.grey.shade300,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            topLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          )),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: ListTile(
                          title: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 5),
                                      child: Text(
                                        'You',
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .subtitle1,
                                      ),
                                    ),
                                    Text(
                                      'Hey,Im Fine, Free now, U?',
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .bodyText2,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          trailing: Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(
                              '01:12 AM',
                              style:
                                  Theme.of(context).primaryTextTheme.overline,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                alignment: Alignment.center,
                child: Chip(
                  backgroundColor: const Color(0xFF7974AA),
                  label: Text(
                    'Today',
                    style: Theme.of(context).primaryTextTheme.headline3,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.height * 0.09,
                      decoration: BoxDecoration(
                          color: context.read<AppCubit>().isDark == 0
                              ? Colors.grey.shade800
                              : Colors.grey.shade200,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                            topRight: Radius.circular(30),
                          )),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: ListTile(
                          title: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 5),
                                      child: Text(
                                        'Belle Benson',
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .subtitle1,
                                      ),
                                    ),
                                    Text(
                                      'Hi, Good Morning',
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .bodyText2,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          trailing: Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(
                              '08:19 AM',
                              style:
                                  Theme.of(context).primaryTextTheme.overline,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomSheet: BottomAppBar(
          color: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: TextField(
                  style: Theme.of(context).primaryTextTheme.subtitle2,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    hintText: AppStrings.typeMsg(context),
                    hintStyle: Theme.of(context).primaryTextTheme.subtitle1,
                  ),
                ),
              ),
              SizedBox(
                  height: 65,
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.send)),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.card_giftcard)),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
