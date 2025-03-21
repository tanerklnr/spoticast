import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_theme.dart';
import 'player_screen.dart';
import '../models/podcast.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> categories = [
    'Teknoloji',
    'Bilim',
    'Spor',
    'Müzik',
    'Eğitim',
    'Komedi',
    'Haber',
    'Kültür',
    'İş Dünyası',
    'Sağlık',
    'Yaşam Tarzı',
    'Sanat',
  ];

  final List<Color> categoryColors = [
    const Color(0xFF1DB954), // Spotify Green
    const Color(0xFF1ED760),
    const Color(0xFF509BF5),
    const Color(0xFFAF2896),
    const Color(0xFFE8115B),
    const Color(0xFFE91429),
    const Color(0xFFFF6437),
    const Color(0xFFFFCDD2),
    const Color(0xFF148A08),
    const Color(0xFF8C1932),
    const Color(0xFF477D95),
    const Color(0xFF509BF5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            backgroundColor: AppTheme.backgroundColor,
            toolbarHeight: 50.h,
            title: Text(
              'Ara',
              style: GoogleFonts.inter(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: AppTheme.textPrimaryColor,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(48.h),
              child: Container(
                height: 40.h,
                margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 8.h),
                decoration: BoxDecoration(
                  color: AppTheme.surfaceColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: _searchController,
                  style: GoogleFonts.inter(
                    color: AppTheme.textPrimaryColor,
                    fontSize: 14.sp,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Podcast veya bölüm ara',
                    hintStyle: GoogleFonts.inter(
                      color: AppTheme.textSecondaryColor,
                      fontSize: 14.sp,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppTheme.textSecondaryColor,
                      size: 20.sp,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Tüm Kategoriler',
                style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textPrimaryColor,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2.0,
                crossAxisSpacing: 12.w,
                mainAxisSpacing: 12.h,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return GestureDetector(
                    onTap: () {
                      HapticFeedback.lightImpact();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: categoryColors[index],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            right: -20,
                            bottom: -20,
                            child: Transform.rotate(
                              angle: 0.3,
                              child: Container(
                                width: 60.w,
                                height: 60.w,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(12.w),
                            child: Text(
                              categories[index],
                              style: GoogleFonts.inter(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                childCount: categories.length,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 0),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Popüler Podcastler',
                style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textPrimaryColor,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
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
                      margin: EdgeInsets.only(bottom: 16.h),
                      child: Row(
                        children: [
                          Container(
                            width: 56.w,
                            height: 56.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppTheme.surfaceColor,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: podcast.imageUrl.isNotEmpty
                                  ? Image.asset(
                                      podcast.imageUrl,
                                      fit: BoxFit.cover,
                                    )
                                  : Icon(
                                      Icons.music_note,
                                      color: AppTheme.textSecondaryColor,
                                      size: 20.sp,
                                    ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  podcast.title,
                                  style: GoogleFonts.inter(
                                    fontSize: 14.sp,
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
                                    fontSize: 12.sp,
                                    color: AppTheme.textSecondaryColor,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.more_vert,
                            color: AppTheme.textSecondaryColor,
                            size: 20.sp,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                childCount: samplePodcasts.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
} 