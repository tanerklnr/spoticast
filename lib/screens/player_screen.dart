import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme/app_theme.dart';
import '../models/podcast.dart';

class PlayerScreen extends StatefulWidget {
  final Podcast podcast;

  const PlayerScreen({
    super.key,
    required this.podcast,
  });

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  bool isPlaying = false;
  double currentProgress = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            HapticFeedback.lightImpact();
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Şimdi Çalıyor',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    Container(
                      width: 300.w,
                      height: 300.w,
                      decoration: BoxDecoration(
                        color: AppTheme.surfaceColor,
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.r),
                        child: Image.asset(
                          widget.podcast.imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Center(
                              child: Icon(
                                Icons.headphones,
                                size: 80.sp,
                                color: AppTheme.primaryColor,
                              ),
                            );
                          },
                        ),
                      ),
                    ).animate().scale(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeOutBack,
                        ),
                    SizedBox(height: 32.h),
                    Text(
                      widget.podcast.title,
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      widget.podcast.publisher,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32.w),
                      child: Text(
                        widget.podcast.description,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey[600],
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(24.w),
              child: Column(
                children: [
                  Slider(
                    value: currentProgress,
                    onChanged: (value) {
                      setState(() {
                        currentProgress = value;
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '0:00',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        '0:00',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.shuffle),
                        onPressed: () {
                          HapticFeedback.lightImpact();
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.skip_previous),
                        onPressed: () {
                          HapticFeedback.lightImpact();
                        },
                      ),
                      Container(
                        width: 64.w,
                        height: 64.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppTheme.primaryColor,
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.primaryColor.withOpacity(0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: IconButton(
                          icon: Icon(
                            isPlaying ? Icons.pause : Icons.play_arrow,
                            color: Colors.white,
                            size: 32.sp,
                          ),
                          onPressed: () {
                            HapticFeedback.lightImpact();
                            setState(() {
                              isPlaying = !isPlaying;
                            });
                          },
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.skip_next),
                        onPressed: () {
                          HapticFeedback.lightImpact();
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.repeat),
                        onPressed: () {
                          HapticFeedback.lightImpact();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
} 