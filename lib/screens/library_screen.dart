import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_theme.dart';
import 'player_screen.dart';
import '../models/podcast.dart';
import 'package:google_fonts/google_fonts.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  final List<String> filters = ['Podcastler', 'İndirilenler', 'Takip Edilenler'];
  int _selectedFilterIndex = 0;

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
            toolbarHeight: 60.h,
            title: Row(
              children: [
                Container(
                  width: 28.w,
                  height: 28.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppTheme.primaryColor,
                  ),
                  child: Center(
                    child: Text(
                      'A',
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  'Kütüphanen',
                  style: GoogleFonts.inter(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textPrimaryColor,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: AppTheme.textPrimaryColor,
                    size: 20.sp,
                  ),
                  onPressed: () {
                    HapticFeedback.lightImpact();
                  },
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                SizedBox(width: 16.w),
                IconButton(
                  icon: Icon(
                    Icons.add,
                    color: AppTheme.textPrimaryColor,
                    size: 20.sp,
                  ),
                  onPressed: () {
                    HapticFeedback.lightImpact();
                  },
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(40.h),
              child: Container(
                height: 40.h,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filters.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedFilterIndex = index;
                        });
                        HapticFeedback.lightImpact();
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 8.w),
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        decoration: BoxDecoration(
                          color: _selectedFilterIndex == index
                              ? AppTheme.primaryColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: _selectedFilterIndex == index
                                ? AppTheme.primaryColor
                                : AppTheme.textSecondaryColor,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            filters[index],
                            style: GoogleFonts.inter(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              color: _selectedFilterIndex == index
                                  ? Colors.white
                                  : AppTheme.textSecondaryColor,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.sort,
                        color: AppTheme.textSecondaryColor,
                        size: 24.sp,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'En Son',
                        style: GoogleFonts.inter(
                          fontSize: 16.sp,
                          color: AppTheme.textSecondaryColor,
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.grid_view,
                        color: AppTheme.textSecondaryColor,
                        size: 24.sp,
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
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
                          margin: EdgeInsets.only(bottom: 16.h),
                          child: Row(
                            children: [
                              Container(
                                width: 64.w,
                                height: 64.w,
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
                                          size: 24.sp,
                                        ),
                                ),
                              ),
                              SizedBox(width: 16.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      podcast.title,
                                      style: GoogleFonts.inter(
                                        fontSize: 16.sp,
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
                                        fontSize: 14.sp,
                                        color: AppTheme.textSecondaryColor,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 4.h),
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 8.w,
                                            vertical: 4.h,
                                          ),
                                          decoration: BoxDecoration(
                                            color: AppTheme.surfaceColor,
                                            borderRadius: BorderRadius.circular(6),
                                          ),
                                          child: Text(
                                            '${podcast.episodeCount} Bölüm',
                                            style: GoogleFonts.inter(
                                              fontSize: 12.sp,
                                              color: AppTheme.textSecondaryColor,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 8.w),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 8.w,
                                            vertical: 4.h,
                                          ),
                                          decoration: BoxDecoration(
                                            color: AppTheme.surfaceColor,
                                            borderRadius: BorderRadius.circular(6),
                                          ),
                                          child: Text(
                                            podcast.category,
                                            style: GoogleFonts.inter(
                                              fontSize: 12.sp,
                                              color: AppTheme.textSecondaryColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.more_vert,
                                color: AppTheme.textSecondaryColor,
                                size: 24.sp,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
} 