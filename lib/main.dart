import 'package:fitness_app/Themedata/theme.dart';
import 'package:fitness_app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(395, 850),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      builder: (context, child) => ChangeNotifierProvider(
          create: (context) => Themeprov(),
          builder: (context, child) {
            final provider = Provider.of<Themeprov>(context);
            return MaterialApp(
              title: 'Fitness App',
              debugShowCheckedModeBanner: false,
              theme: Mythemes.lightTheme,
              darkTheme: Mythemes.darktheme,
              themeMode: provider.themeMode,
              home: const MyHomePage(),
            );
          }),
    );
  }
}
