import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:roz/Core/constants/app_strings.dart';
import 'package:roz/Core/constants/asset_manager.dart';
import 'package:roz/Core/utils/app_router.dart';
import 'package:roz/Core/utils/Global%20Widgets/login_formfield.dart';
import 'package:roz/View/Widgets/profile_details_widgets/image_widget.dart';
import 'package:roz/Core/utils/Global%20Widgets/gradiant_button.dart';

class ProfileDetailScreen extends StatelessWidget {
  const ProfileDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController lNamecontroller = TextEditingController();
    TextEditingController fNamecontroller = TextEditingController();
    DateTime? date = DateTime.now();
    TextEditingController dobcontroller = TextEditingController();
    List<String> sex = ["Woman", "Man"];
    String? selectedSex = "Man";
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFEEFCFF),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                AppStrings.profileDet(context),
                style: const TextStyle(
                    fontSize: 22,
                   
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF33196B)),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                AppStrings.fillDet(context),
                style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF33196B),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              ProfileWidget(
                  onClicked: () {},
                  image: const AssetImage(AssetManager.profileImage)),
              const SizedBox(
                height: 20,
              ),
              LoginFormField(
                  hint: AppStrings.fname(context), controller: fNamecontroller),
              LoginFormField(
                  hint: AppStrings.lname(context), controller: lNamecontroller),
              LoginFormField(
                  hint: AppStrings.dob(context),
                  controller: dobcontroller,
                  suffix: IconButton(
                      onPressed: () async {
                        DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: date,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2055));
                        if (newDate == null) return;
                      },
                      icon: const Icon(
                        Icons.date_range_outlined,
                        size: 15,
                        color: Colors.indigo,
                      ))),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                height: 43,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  border: const GradientBoxBorder(
                    gradient: LinearGradient(colors: [
                      Color(0xFF862254),
                      Color(0xFFFA457E),
                      Color(0xFF483585),
                      Color(0xFF7B49FF),
                    ]),
                    width: 2,
                  ),
                ),
                child: DropdownButtonFormField(
                    focusColor: const Color.fromARGB(255, 165, 64, 64),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    ),
                    hint: Text(
                      AppStrings.gender(context),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                    ),
                    value: selectedSex,
                    items: sex
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(
                                e,
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 15,
                                   ),
                              ),
                            ))
                        .toList(),
                    onChanged: (String? val) => selectedSex = val),
              ),
              GradiantButton(
                  text: AppStrings.continu(context),
                  onpress: () {
                    Navigator.of(context).pushNamed(AppRouter.locationRoute);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
