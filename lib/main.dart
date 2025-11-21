import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_translation/core/constants/app_fonts.dart';
import 'package:quran_translation/core/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:quran_translation/view_models/bottom_nav_vm.dart';
import 'package:quran_translation/widgets/appbar.dart';
import 'package:quran_translation/widgets/bottom_nav.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('fa'),
        Locale('ps'),
        Locale('ar'),
      ],
      path: 'assets/languages',
      fallbackLocale: const Locale('fa'),
      child: MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => BottomNavViewModel())],
        child: ScreenUtilInit(
          designSize: const Size(393, 852),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) => const MyApp(),
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [...context.localizationDelegates],
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: AppTheme.lightTheme(AppFonts.yekanBakh),
      home: MainRoute(),
    );
  }
}

class MainRoute extends StatelessWidget {
  const MainRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottom_nav_vm = Provider.of<BottomNavViewModel>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(),
      ),
      bottomNavigationBar: BottomNavBar(),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: KeyedSubtree(
          key: ValueKey<int>(bottom_nav_vm.currentIndex),
          child: bottom_nav_vm.screens[bottom_nav_vm.currentIndex],
        ),
      ),
    );
  }
}
