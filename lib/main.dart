import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:roz/Core/Theme/app_theme.dart';
import 'package:roz/Core/utils/app_router.dart';
import 'package:roz/View%20Model/app_provider.dart';
import 'Core/Localization/app_localizations.dart';
import 'View Model/Providers List/providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(providers: providersList, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, myType, child) {
        return MaterialApp(
          title: 'Roz App',
          debugShowCheckedModeBanner: false,
          locale: context.read<AppProvider>().locale,
          supportedLocales: const <Locale>[Locale('en'), Locale('ar')],
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: context.read<AppProvider>().isDark == 0
              ? AppTheme.darkTheme
              : AppTheme.lightTheme,
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: AppRouter.splashRoute,
        );
      },
    );
  }
}
