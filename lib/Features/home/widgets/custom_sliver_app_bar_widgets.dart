
import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key, required this.child});

  // العنوان في الحالة المطوية (العلوي)
  final Widget child; // المحتوى الأساسي

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text("Food Delvry"),
      centerTitle: true, // يظهر عند التمرير لأعلى
      expandedHeight: 300,
      floating: false,
      pinned: true,
      foregroundColor: Colors.white,
      backgroundColor: Theme.of(context).colorScheme.primary,
      flexibleSpace: FlexibleSpaceBar(
        expandedTitleScale: 1,
        // يظهر عند التمرير لأسفل
        background: child,
        centerTitle: true,
      ),
    );
  }
}
