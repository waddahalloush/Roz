import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:roz/Core/constants/app_strings.dart';
import 'package:roz/Core/utils/Global%20Widgets/login_formfield.dart';
import 'package:roz/Core/utils/media_query_ex.dart';
import 'package:roz/View/Screens/chat_screen.dart';

import '../../Bloc/cubit/app_cubit.dart';
import '../../Core/utils/Animation Page/fade_transition.dart';
import '../../Models/add_new_message_model.dart';

class AddMessageScreen extends StatelessWidget {
  const AddMessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    final List<String> circleImageList = [
      'assets/images/img_circle_0.png',
      'assets/images/img_circle_1.png',
      'assets/images/img_circle_2.png',
      'assets/images/img_circle_0.png',
      'assets/images/img_circle_1.png',
      'assets/images/img_circle_2.png',
    ];

    List<AddNewMessageModel> addNewMsgList = [
      AddNewMessageModel(
          name: 'Belle Benson',
          time: '03:45 PM',
          imgPath: 'assets/images/card_img_0.png',
          messageCount: 2),
      AddNewMessageModel(
          name: 'Ruby Diaz',
          time: '11:49 AM',
          imgPath: 'assets/images/card_img_1.png',
          messageCount: 3),
      AddNewMessageModel(
          name: 'Myley Corbyon',
          time: 'Yesterday',
          imgPath: 'assets/images/card_img_2.png',
          messageCount: 1),
      AddNewMessageModel(
          name: 'Tony Z',
          time: '11:30 PM',
          imgPath: 'assets/images/card_img_1.png',
          messageCount: 0),
      AddNewMessageModel(
          name: 'Ruby Raman',
          time: 'Yesterday',
          imgPath: 'assets/images/card_img_4.png',
          messageCount: 1),
    ];
    return SafeArea(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: InkWell(
                onTap: () {},
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Theme.of(context).primaryColorLight,
                  child: IconButton(
                    icon: const Icon(MdiIcons.messageReplyTextOutline),
                    color: Colors.white,
                    iconSize: 20,
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                AppStrings.addNewMessage(context),
                style: Theme.of(context).primaryTextTheme.headline2,
              ),
            ),
            const Spacer(),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).iconTheme.color,
                  size: 20,
                )),
          ],
        ),
        LoginFormField(
          hint: AppStrings.searchMsgMatch(context),
          controller: searchController,
          suffix: const Icon(
            Icons.search,
            color: Colors.indigo,
            size: 20,
          ),
        ),
        Align(
          alignment: context.read<AppCubit>().locale.languageCode == "ar"
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              AppStrings.newMatch(context),
              style: Theme.of(context).primaryTextTheme.headline2,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 70,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: circleImageList.length,
              itemBuilder: (ctx, index) {
                return InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.blue, width: 3)),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: const Color(0xFFF1405B),
                        backgroundImage: AssetImage(
                          circleImageList[index],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Align(
          alignment: context.read<AppCubit>().locale.languageCode == "ar"
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              AppStrings.allMsg(context),
              style: Theme.of(context).primaryTextTheme.headline1,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: addNewMsgList.length,
              itemBuilder: (ctx, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: context.read<AppCubit>().isDark == 0
                          ? const Color(0xFF1D0529)
                          : Colors.white54,
                    ),
                    height: context.height * 0.12,
                    width: MediaQuery.of(context).size.width,
                    child: ListTile(
                      title: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(1.5),
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11),
                                color: Colors.purple,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  addNewMsgList[index].imgPath,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    addNewMsgList[index].name,
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .bodyText1,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4),
                                    child: CircleAvatar(
                                      radius: 4,
                                      backgroundColor:
                                          Colors.lightGreenAccent[400],
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                'Hi, How are you? Nice to meet\nyou? Free now, you?',
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyText2,
                              )
                            ],
                          )
                        ],
                      ),
                      trailing: SizedBox(
                        height: 60,
                        width: 53,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: Text(
                                addNewMsgList[index].time,
                                style:
                                    Theme.of(context).primaryTextTheme.caption,
                              ),
                            ),
                            const Expanded(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: CircleAvatar(
                                  radius: 11,
                                  backgroundColor: Color(0xFFD6386F),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text('2',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            FadeRoute(
                                page: ChatScreen(
                                    image: addNewMsgList[index].imgPath,
                                    name: addNewMsgList[index].name)));
                      },
                    ),
                  ),
                );
              }),
        )
      ],
    ));
  }
}
