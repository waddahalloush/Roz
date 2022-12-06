// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:roz/Bloc/cubit/app_cubit.dart';
import 'package:roz/Core/constants/app_strings.dart';
import 'package:roz/Core/utils/app_router.dart';
import 'package:roz/Core/utils/Global%20Widgets/gradiant_button.dart';
import 'package:roz/Core/utils/Global%20Widgets/gradiant_text.dart';

import '../../Models/intrestes_model.dart';

class LikeIntrestScreen extends StatelessWidget {
  const LikeIntrestScreen({Key? key}) : super(key: key);

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
          actions: [
            TextButton(
                onPressed: () {},
                child: Text(
                  AppStrings.skip(context),
                  style: Theme.of(context).primaryTextTheme.headline6,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                AppStrings.likeintrest(context),
                style: Theme.of(context).primaryTextTheme.headline1,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                AppStrings.sharelike(context),
                style: Theme.of(context).primaryTextTheme.subtitle1,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocBuilder<AppCubit, AppState>(
                  builder: (context, state) {
                    return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: intrestesList(context).length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8,
                                childAspectRatio: 16 / 6),
                        itemBuilder: (context, index) => InkWell(
                              onTap: () => context
                                  .read<AppCubit>()
                                  .changeIsClickedIntrest(context, index),
                              child: intrestesList(context)[index].isClicked
                                  ? LikeIntrestWidget(
                                      icon: intrestesList(context)[index].icon,
                                      text: intrestesList(context)[index].name)
                                  : UnLikeIntrestWidget(
                                      icon: intrestesList(context)[index].icon,
                                      text: intrestesList(context)[index].name),
                            ));
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GradiantTextButton(size: 20,
                  text: AppStrings.loadMore(context), onPress: () {}),
              const SizedBox(
                height: 20,
              ),
              GradiantButton(
                  text: AppStrings.continu(context),
                  onpress: () {
                    Navigator.of(context).pushNamed(AppRouter.uploadIdRoute);
                  }),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LikeIntrestWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  const LikeIntrestWidget({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Theme.of(context).iconTheme.color,
            size: 20,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: Theme.of(context).primaryTextTheme.overline,
          )
        ],
      ),
    );
  }
}

class UnLikeIntrestWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  const UnLikeIntrestWidget({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Theme.of(context).iconTheme.color,
          size: 20,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: Theme.of(context).primaryTextTheme.overline,
        )
      ],
    );
  }
}
