import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'main_screen.dart';
import '../theme/app_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingPage> _pages = [
    OnboardingPage(
      title: 'Podcast Dünyasına Hoş Geldiniz',
      description: 'En iyi podcastleri keşfedin ve dinleyin.',
      image: 'assets/images/onboardingscreen1.jpg',
    ),
    OnboardingPage(
      title: 'Kişiselleştirilmiş Öneriler',
      description: 'Size özel podcast önerileri ile yeni içerikler keşfedin.',
      image: 'assets/images/onboardingscreen2.jpg',
    ),
    OnboardingPage(
      title: 'Kesintisiz Dinleme Deneyimi',
      description: 'Kaliteli ses ve kesintisiz dinleme deneyimi.',
      image: 'assets/images/onboardingscreen3.jpg',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenOnboarding', true);

    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: _pages.length,
            itemBuilder: (context, index) {
              return _buildPage(_pages[index]);
            },
          ),
          Positioned(
            bottom: 50.h,
            left: 0,
            right: 0,
            child: Column(
              children: [
                SmoothPageIndicator(
                  controller: _pageController,
                  count: _pages.length,
                  effect: WormEffect(
                    dotHeight: 8.h,
                    dotWidth: 8.w,
                    spacing: 8.w,
                    dotColor: Colors.grey[600]!,
                    activeDotColor: AppTheme.primaryColor,
                  ),
                ),
                SizedBox(height: 32.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: _currentPage == _pages.length - 1
                      ? ElevatedButton(
                          onPressed: _completeOnboarding,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.primaryColor,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                              horizontal: 48.w,
                              vertical: 16.h,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text(
                            'Başla',
                            style: GoogleFonts.inter(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ).animate().fadeIn().scale()
                      : TextButton(
                          onPressed: () {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Text(
                            'Atla',
                            style: GoogleFonts.inter(
                              fontSize: 16.sp,
                              color: AppTheme.primaryColor,
                            ),
                          ),
                        ),
                ),
                SizedBox(height: 32.h),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(OnboardingPage page) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 300.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppTheme.surfaceColor,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                page.image,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.music_note,
                    size: 64.sp,
                    color: AppTheme.textSecondaryColor,
                  );
                },
              ),
            ),
          ).animate().fadeIn().scale(),
          SizedBox(height: 32.h),
          Text(
            page.title,
            style: GoogleFonts.inter(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: AppTheme.textPrimaryColor,
            ),
            textAlign: TextAlign.center,
          ).animate().fadeIn().slideY(begin: 0.2),
          SizedBox(height: 16.h),
          Text(
            page.description,
            style: GoogleFonts.inter(
              fontSize: 16.sp,
              color: AppTheme.textSecondaryColor,
            ),
            textAlign: TextAlign.center,
          ).animate().fadeIn().slideY(begin: 0.2),
        ],
      ),
    );
  }
}

class OnboardingPage {
  final String title;
  final String description;
  final String image;

  OnboardingPage({
    required this.title,
    required this.description,
    required this.image,
  });
}
