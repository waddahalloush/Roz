import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:roz/Core/utils/Global%20Widgets/login_formfield.dart';

import '../../Core/constants/app_strings.dart';
import '../../Core/utils/app_router.dart';
import '../../Core/utils/Global Widgets/gradiant_button.dart';
import '../Widgets/account_info_widget.dart';

class UploadIdScreen extends StatefulWidget {
  const UploadIdScreen({Key? key}) : super(key: key);

  @override
  State<UploadIdScreen> createState() => _UploadIdScreenState();
}

class _UploadIdScreenState extends State<UploadIdScreen> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  DateTime? date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          leading: IconButton(
            icon: const Icon(FontAwesomeIcons.arrowLeft),
            color: Theme.of(context).iconTheme.color,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                AppStrings.uploadId(context),
                style: Theme.of(context).primaryTextTheme.headline1,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                AppStrings.idsecure(context),
                style: Theme.of(context).primaryTextTheme.subtitle1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              LoginFormField(
                  hint: AppStrings.fullname(context),
                  controller: fullNameController),
              LoginFormField(
                  hint: AppStrings.phone(context), controller: phoneController),
              AccountInfoWidget(
                  icon: Icons.calendar_month,
                  title: AppStrings.dob(context),
                  onTap: () async {
                    DateTime? newDate = await showDatePicker(
                        context: context,
                        initialDate: date!,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2055));
                    if (newDate == null) return;
                  }),
              const SizedBox(
                height: 50,
              ),
              GradiantButton(
                  text: AppStrings.sendData(context),
                  onpress: () {
                    Navigator.of(context).pushNamed(AppRouter.homeRoute);
                  })
            ],
          ),
        ),
      ),
    );
  }
}


 // Container(
              //   margin:
              //       const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(25),
              //     border: const GradientBoxBorder(
              //       gradient: LinearGradient(colors: [
              //         Color(0xFF862254),
              //         Color(0xFFFA457E),
              //         Color(0xFF483585),
              //         Color(0xFF7B49FF),
              //       ]),
              //       width: 2,
              //     ),
              //   ),
              //   child: DropdownButtonFormField(
              //       focusColor: const Color.fromARGB(255, 165, 64, 64),
              //       decoration: const InputDecoration(
              //         contentPadding: EdgeInsets.all(5),
              //       ),
              //       hint: Text(
              //         AppStrings.gender(context),
              //         style: Theme.of(context).textTheme.caption,
              //       ),
              //       value: selectData,
              //       items: data
              //           .map((e) => DropdownMenuItem(
              //                 value: e,
              //                 child: Text(e,
              //                     style: Theme.of(context)
              //                         .primaryTextTheme
              //                         .subtitle1),
              //               ))
              //           .toList(),
              //       onChanged: (String? val) => setState(() {
              //             selectData = val;
              //           })),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: DottedBorder(
              //     borderType: BorderType.RRect,
              //     color: const Color.fromRGBO(134, 34, 84, 1),
              //     radius: const Radius.circular(30),
              //     padding: const EdgeInsets.all(6),
              //     child: Container(
              //       height: context.height * 0.3,
              //       width: context.width,
              //       margin: const EdgeInsets.all(20),
              //       alignment: Alignment.center,
              //       child: Column(
              //         mainAxisSize: MainAxisSize.min,
              //         children: [
              //           Stack(
              //             alignment: Alignment.bottomCenter,
              //             clipBehavior: Clip.none,
              //             children: [
              //               const Icon(
              //                 MdiIcons.fileDocument,
              //                 color: Color(0xFF4C407B),
              //                 size: 80,
              //               ),
              //               Positioned(
              //                 top: 65,
              //                 child: CircleAvatar(
              //                   radius: 18,
              //                   backgroundColor: const Color(0xFF4C407B),
              //                   child: CircleAvatar(
              //                     radius: 16,
              //                     backgroundColor:
              //                         context.read<AppCubit>().isDark == 0
              //                             ? Colors.black
              //                             : Theme.of(context)
              //                                 .scaffoldBackgroundColor,
              //                     child: Icon(
              //                       Icons.arrow_upward,
              //                       color: Theme.of(context).iconTheme.color,
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           ),
              //           Padding(
              //               padding: const EdgeInsets.only(top: 25),
              //               child: GradiantTextButton(size: 20,
              //                   text: AppStrings.uploadDoc(context),
              //                   onPress: () {})),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),