import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:roz/Core/Theme/app_theme.dart';
import 'package:roz/Core/utils/app_router.dart';
import 'Bloc/cubit/app_cubit.dart';
import 'Core/Localization/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => AppCubit()
        ..getSavedTheme()
        ..getSavedLanguage(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Roz App',
          debugShowCheckedModeBanner: false,
          locale: context.read<AppCubit>().locale,
          supportedLocales: const <Locale>[Locale('en'), Locale('ar')],
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: context.read<AppCubit>().isDark == 0
              ? AppTheme.darkTheme
              : AppTheme.lightTheme,
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: AppRouter.splashRoute,
        );
      },
    );
  }
}
