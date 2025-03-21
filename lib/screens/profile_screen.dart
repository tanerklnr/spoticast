import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme/app_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              expandedHeight: 100.h,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                title: Text(
                  'Profil',
                  style: GoogleFonts.inter(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textPrimaryColor,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildProfileHeader(),
                    SizedBox(height: 24.h),
                    _buildProfileMenu(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Row(
      children: [
        Container(
          width: 80.w,
          height: 80.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppTheme.surfaceColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Icon(
            Icons.person,
            size: 40.sp,
            color: AppTheme.textSecondaryColor,
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Taner Kalaner',
                style: GoogleFonts.inter(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textPrimaryColor,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                'tanerkalaner@hotmail.com',
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  color: AppTheme.textSecondaryColor,
                ),
              ),
            ],
          ),
        ),
      ],
    ).animate().fadeIn().slideX(begin: -0.2);
  }

  Widget _buildProfileMenu() {
    final menuItems = [
      _MenuItem(
        icon: Icons.settings_outlined,
        title: 'Ayarlar',
        onTap: () {},
      ),
      _MenuItem(
        icon: Icons.notifications_outlined,
        title: 'Bildirimler',
        onTap: () {},
      ),
      _MenuItem(
        icon: Icons.download_outlined,
        title: 'İndirilenler',
        onTap: () {},
      ),
      _MenuItem(
        icon: Icons.favorite_outline,
        title: 'Favoriler',
        onTap: () {},
      ),
      _MenuItem(
        icon: Icons.history,
        title: 'Dinleme Geçmişi',
        onTap: () {},
      ),
      _MenuItem(
        icon: Icons.logout,
        title: 'Çıkış Yap',
        onTap: () {},
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hesap',
          style: GoogleFonts.inter(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppTheme.textSecondaryColor,
          ),
        ),
        SizedBox(height: 16.h),
        ...menuItems.map((item) => _buildMenuItem(item)).toList(),
      ],
    ).animate().fadeIn().slideY(begin: 0.2);
  }

  Widget _buildMenuItem(_MenuItem item) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      decoration: BoxDecoration(
        color: AppTheme.surfaceColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        onTap: item.onTap,
        leading: Icon(
          item.icon,
          size: 24.sp,
          color: AppTheme.textSecondaryColor,
        ),
        title: Text(
          item.title,
          style: GoogleFonts.inter(
            fontSize: 16.sp,
            color: AppTheme.textPrimaryColor,
          ),
        ),
        trailing: Icon(
          Icons.chevron_right,
          size: 24.sp,
          color: AppTheme.textSecondaryColor,
        ),
      ),
    );
  }
}

class _MenuItem {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  _MenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });
} 