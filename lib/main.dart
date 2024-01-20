import 'package:flutter_apps/app/core/routes/route_config.dart';
import 'package:flutter_apps/app/provider/movies_provider.dart';
import 'package:flutter_apps/app/provider/menu_provider.dart';
import 'package:flutter_apps/app/provider/theme_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ThemeProvider.instance.changeTheme(ThemeEnum.pink);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider.instance),
        ChangeNotifierProvider(create: (_) => MenuProvider()),
        ChangeNotifierProvider(create: (_) => MoviesProvider()),
      ],
      builder: (context, child) {
        return MaterialApp.router(
          title: 'ABHA App',
          scrollBehavior: MyCustomScrollBehavior(),
          debugShowCheckedModeBanner: false,
          theme: Provider.of<ThemeProvider>(context).currentThemeData,
          routerConfig: RouteConfig.returnRouter(),
        );
      },
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  /// Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}
