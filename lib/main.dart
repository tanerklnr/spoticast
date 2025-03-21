import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/home_screen.dart';
import 'screens/search_screen.dart';
import 'screens/library_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/main_screen.dart';
import 'theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Sistem UI ayarları
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Color(0xFF121212),
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );

  // SharedPreferences'ı başlat
  final prefs = await SharedPreferences.getInstance();
  
  // Onboarding durumunu kontrol et ve varsayılan olarak false yap
  bool hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;
  
  // Test için onboarding durumunu sıfırla
  await prefs.setBool('hasSeenOnboarding', false);

  runApp(MyApp(hasSeenOnboarding: hasSeenOnboarding));
}

class MyApp extends StatelessWidget {
  final bool hasSeenOnboarding;

  const MyApp({super.key, required this.hasSeenOnboarding});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Spoticast',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.darkTheme,
          home: hasSeenOnboarding ? const MainScreen() : const OnboardingScreen(),
        );
      },
    );
  }
}
