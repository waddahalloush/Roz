import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:roz/Bloc/cubit/app_cubit.dart';
import 'package:roz/Core/utils/media_query_ex.dart';
import '../../Core/constants/app_strings.dart';
import '../../Core/utils/app_router.dart';
import '../../Core/utils/Global Widgets/login_formfield.dart';
import '../../Core/utils/Global Widgets/gradiant_button.dart';

class EmailLoginScreen extends StatelessWidget {
  const EmailLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return SafeArea(
        child: Scaffold(backgroundColor: const Color(0xFFEEFCFF),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Lottie.asset("assets/lottie/register.json",
                    width: context.width, height: context.height * 0.4),
                const SizedBox(
                  height: 30,
                ),
                Align(
                  alignment:
                      context.read<AppCubit>().locale.languageCode == "ar"
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      AppStrings.account(context),
                      style: const TextStyle(
                          fontSize: 15,
                        
                          color: Colors.indigo,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
                LoginFormField(
                  controller: emailController,
                  hint: AppStrings.tffHint1(context),
                ),
                LoginFormField(
                  controller: passwordController,
                  hint: AppStrings.tffHint2(context),
                ),
                const SizedBox(
                  height: 30,
                ),
                GradiantButton(
                    text: AppStrings.login(context),
                    onpress: () {
                      Navigator.of(context)
                          .pushNamed(AppRouter.verifyCodeRoute);
                    })
              ]),
        ),
      ),
    ));
  }
}
