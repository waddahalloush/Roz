// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roz/Bloc/cubit/app_cubit.dart';
import 'package:roz/Core/constants/app_strings.dart';
import 'package:roz/Core/utils/edit_status_dialog.dart';

import '../../Core/utils/app_router.dart';
import '../Widgets/edit_profile_widget.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController statusController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          title: Text(
            AppStrings.editProfInfo(context),
            style: Theme.of(context).primaryTextTheme.headline1,
          ),
        ),
        body: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            var cubit = context.read<AppCubit>();
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                    children: [
                      EditProfileWidget(
                        title: AppStrings.uploadProfile(context),
                        icon: Icons.photo_album,
                        onTap: () {
                          cubit.upLoadImageProfile(context);
                          Navigator.pushReplacementNamed(
                              context, AppRouter.homeRoute);
                        },
                      ),
                      EditProfileWidget(
                        title: AppStrings.changeStatus(context),
                        icon: Icons.edit_note,
                        onTap: () =>
                            editStatusDialog(context, statusController),
                      ),
                      EditProfileWidget(
                        title: AppStrings.uploadVideo(context),
                        icon: Icons.video_camera_back_rounded,
                        onTap: () {
                          cubit.upLoadVideo(context);
                        },
                      ),
                      EditProfileWidget(
                        title: AppStrings.uploadImage(context),
                        icon: Icons.image_rounded,
                        onTap: () {
                          cubit.upLoadImage(context);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
