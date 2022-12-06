import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roz/Core/utils/media_query_ex.dart';

import '../../Bloc/cubit/app_cubit.dart';
import '../../Core/constants/app_strings.dart';
import '../../Core/utils/app_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: context.width - 100,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Theme.of(context).iconTheme.color,
                  )),
              Text(
                AppStrings.setting(context),
                style: Theme.of(context).primaryTextTheme.headline1,
              ),
              Text(
                AppStrings.settingSub(context),
                style: Theme.of(context).primaryTextTheme.subtitle1,
              ),
              SettingListTileWidget(
                icon: Icons.person,
                name: AppStrings.settingAccount(context),
                onTap: () {
                  Navigator.of(context).pushNamed(AppRouter.rozSettingRoute);
                },
              ),
              SettingListTileWidget(
                icon: Icons.account_balance_wallet,
                name: AppStrings.settingGetToken(context),
                onTap: () {
                  Navigator.of(context).pushNamed(AppRouter.plansRoute);
                },
              ),
              SettingListTileWidget(
                icon: Icons.lock,
                name: AppStrings.settingPrivacy(context),
                onTap: () {
                  Navigator.of(context).pushNamed(AppRouter.termsRoute);
                },
              ),
              SettingListTileWidget(
                icon: Icons.language,
                name: context.read<AppCubit>().locale.languageCode == 'ar'
                    ? AppStrings.settingEnglish(context)
                    : AppStrings.settingArabic(context),
                onTap: () {
                  context.read<AppCubit>().changeLanguage(
                      context.read<AppCubit>().locale.languageCode == 'ar'
                          ? "en"
                          : "ar");
                },
              ),
              SettingListTileWidget(
                icon: context.read<AppCubit>().isDark == 0
                    ? Icons.light_mode
                    : Icons.nights_stay,
                name: context.read<AppCubit>().isDark == 0
                    ? AppStrings.settingLight(context)
                    : AppStrings.settingDark(context),
                onTap: () {
                  context.read<AppCubit>().changeTheme(
                      context.read<AppCubit>().isDark == 0 ? 1 : 0);
                },
              ),
              SettingListTileWidget(
                icon: Icons.block,
                name: AppStrings.settingBlock(context),
                onTap: () {
                  Navigator.pushNamed(context, AppRouter.blockListRoute);
                },
              ),
              SettingListTileWidget(
                icon: Icons.star_border,
                name: AppStrings.settingRate(context),
                onTap: () {},
              ),
              SettingListTileWidget(
                icon: Icons.contact_support,
                name: AppStrings.settingContact(context),
                onTap: () {
                  Navigator.pushNamed(context, AppRouter.contactUsRoute);
                },
              ),
              SettingListTileWidget(
                icon: Icons.exit_to_app,
                name: AppStrings.settingLogout(context),
                onTap: () {
                  Navigator.pushReplacementNamed(context, AppRouter.loginRoute);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingListTileWidget extends StatelessWidget {
  final String name;
  final IconData icon;
  final VoidCallback onTap;
  const SettingListTileWidget({
    Key? key,
    required this.name,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: SizedBox(
        height: context.height * 0.068,
        child: ListTile(
          leading: Icon(
            icon,
            color: Theme.of(context).iconTheme.color,
            size: 20,
          ),
          trailing: Text(
            name,
            style: Theme.of(context).primaryTextTheme.headline2,
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
