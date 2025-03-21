import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme/app_theme.dart';
import 'player_screen.dart';
import '../models/podcast.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            expandedHeight: 60.h,
            backgroundColor: AppTheme.backgroundColor,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.symmetric(horizontal: 16.w),
              title: Text(
                'Spoticast',
                style: GoogleFonts.inter(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primaryColor,
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.notifications_none,
                  size: 24.sp,
                  color: AppTheme.textPrimaryColor,
                ),
                onPressed: () {
                  HapticFeedback.lightImpact();
                },
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildGreeting(),
                  SizedBox(height: 24.h),
                  _buildCategories(context),
                  SizedBox(height: 24.h),
                  _buildRecentlyPlayed(context),
                  SizedBox(height: 24.h),
                  _buildTrendingPodcasts(context),
                  SizedBox(height: 24.h),
                  _buildAllPodcasts(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGreeting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'İyi Akşamlar',
          style: GoogleFonts.inter(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: AppTheme.textPrimaryColor,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'Bugün ne dinlemek istersin?',
          style: GoogleFonts.inter(
            fontSize: 16.sp,
            color: AppTheme.textSecondaryColor,
          ),
        ),
      ],
    );
  }

  Widget _buildRecentlyPlayed(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Son Çalınanlar',
          style: GoogleFonts.inter(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: AppTheme.textPrimaryColor,
          ),
        ),
        SizedBox(height: 16.h),
        SizedBox(
          height: 200.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: samplePodcasts.length,
            itemBuilder: (context, index) {
              final podcast = samplePodcasts[index];
              return GestureDetector(
                onTap: () {
                  HapticFeedback.lightImpact();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlayerScreen(podcast: podcast),
                    ),
                  );
                },
                child: Container(
                  width: 130.w,
                  margin: EdgeInsets.only(right: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 130.w,
                        height: 130.w,
                        decoration: BoxDecoration(
                          color: AppTheme.surfaceColor,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: podcast.imageUrl.isNotEmpty
                              ? Image.asset(
                                  podcast.imageUrl,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(
                                      Icons.music_note,
                                      size: 40.sp,
                                      color: AppTheme.textSecondaryColor,
                                    );
                                  },
                                )
                              : Icon(
                                  Icons.music_note,
                                  size: 40.sp,
                                  color: AppTheme.textSecondaryColor,
                                ),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        podcast.title,
                        style: GoogleFonts.inter(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.textPrimaryColor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        podcast.publisher,
                        style: GoogleFonts.inter(
                          fontSize: 11.sp,
                          color: AppTheme.textSecondaryColor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTrendingPodcasts(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Trend Podcastler',
          style: GoogleFonts.inter(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: AppTheme.textPrimaryColor,
          ),
        ),
        SizedBox(height: 16.h),
        SizedBox(
          height: 200.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: samplePodcasts.length,
            itemBuilder: (context, index) {
              final podcast = samplePodcasts[index];
              return GestureDetector(
                onTap: () {
                  HapticFeedback.lightImpact();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlayerScreen(podcast: podcast),
                    ),
                  );
                },
                child: Container(
                  width: 130.w,
                  margin: EdgeInsets.only(right: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 130.w,
                        height: 130.w,
                        decoration: BoxDecoration(
                          color: AppTheme.surfaceColor,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: podcast.imageUrl.isNotEmpty
                              ? Image.asset(
                                  podcast.imageUrl,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(
                                      Icons.music_note,
                                      size: 40.sp,
                                      color: AppTheme.textSecondaryColor,
                                    );
                                  },
                                )
                              : Icon(
                                  Icons.music_note,
                                  size: 40.sp,
                                  color: AppTheme.textSecondaryColor,
                                ),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        podcast.title,
                        style: GoogleFonts.inter(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.textPrimaryColor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        podcast.publisher,
                        style: GoogleFonts.inter(
                          fontSize: 11.sp,
                          color: AppTheme.textSecondaryColor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCategories(BuildContext context) {
    final categories = ['Tümü', 'Teknoloji', 'Bilim', 'Spor', 'Müzik', 'Eğitim'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Kategoriler',
          style: GoogleFonts.inter(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: AppTheme.textPrimaryColor,
          ),
        ),
        SizedBox(height: 16.h),
        SizedBox(
          height: 40.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(right: 8.w),
                child: FilterChip(
                  label: Text(
                    categories[index],
                    style: GoogleFonts.inter(
                      fontSize: 12.sp,
                      color: index == 0 ? Colors.white : Colors.grey[600],
                    ),
                  ),
                  selected: index == 0,
                  onSelected: (selected) {
                    HapticFeedback.lightImpact();
                  },
                  backgroundColor: AppTheme.surfaceColor,
                  selectedColor: AppTheme.primaryColor,
                  checkmarkColor: Colors.white,
                  side: BorderSide(
                    color: index == 0 ? AppTheme.primaryColor : Colors.grey[300]!,
                    width: 1,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAllPodcasts(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tüm Podcastler',
          style: GoogleFonts.inter(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: AppTheme.textPrimaryColor,
          ),
        ),
        SizedBox(height: 16.h),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: 16.w,
            mainAxisSpacing: 16.h,
          ),
          itemCount: samplePodcasts.length,
          itemBuilder: (context, index) {
            final podcast = samplePodcasts[index];
            return GestureDetector(
              onTap: () {
                HapticFeedback.lightImpact();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlayerScreen(podcast: podcast),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.surfaceColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(12),
                        ),
                        child: Container(
                          width: double.infinity,
                          color: AppTheme.surfaceColor,
                          child: podcast.imageUrl.isNotEmpty
                              ? Image.asset(
                                  podcast.imageUrl,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(
                                      Icons.music_note,
                                      size: 40.sp,
                                      color: AppTheme.textSecondaryColor,
                                    );
                                  },
                                )
                              : Icon(
                                  Icons.music_note,
                                  size: 40.sp,
                                  color: AppTheme.textSecondaryColor,
                                ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            podcast.title,
                            style: GoogleFonts.inter(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.textPrimaryColor,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            podcast.publisher,
                            style: GoogleFonts.inter(
                              fontSize: 11.sp,
                              color: AppTheme.textSecondaryColor,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
} 