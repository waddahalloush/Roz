import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roz/Bloc/cubit/app_cubit.dart';
import 'package:roz/Core/constants/app_strings.dart';

import 'package:roz/Core/utils/media_query_ex.dart';

void showVideoCallChatSheet(BuildContext context) => showModalBottomSheet(
    barrierColor: Colors.transparent,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.35,
          builder: (context, scrollController) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: context.width,
            height: context.height,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(35))),
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
                TextField(
                  controller: context.read<AppCubit>().chatController,
                  cursorColor: Colors.white,
                  autofocus: true,
                  style:
                      const TextStyle(fontSize: 22.0, color: Color(0xFFbdc6cf)),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black,
                    hintText: AppStrings.sayThing(context),
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.mic_rounded,
                              size: 25,
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: () {
                              context.read<AppCubit>().chatMessageInVideoCall(
                                  context.read<AppCubit>().chatController.text);
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.send,
                              size: 25,
                              color: Colors.white,
                            )),
                      ],
                    ),
                    suffixIconColor: Colors.white,
                    hintStyle: const TextStyle(
                        fontSize: 18.0, color: Color(0xFFbdc6cf)),
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 8.0, top: 8.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
