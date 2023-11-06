import 'package:flutter/material.dart';
import 'package:movie_app/config/colors/app_colors.dart';
import 'package:movie_app/ui/features/browse/components/browse_screen_body.dart';

class BrowseScreen extends StatelessWidget {
  const BrowseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(AppColors.appBarColor),
        title: const Text(
          'Category',
        ),
      ),
      body: const BrowseScreenBody(),
    );
  }
}
