import 'package:flutter/material.dart';

import 'skelton_box.dart';

class CamReportSkeleton extends StatelessWidget {
  final bool isTablet;

  const CamReportSkeleton({super.key, required this.isTablet});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(isTablet ? 24 : 16),
      child: Column(
        children: [
          _card(),
          const SizedBox(height: 16),
          _card(height: 160),
          const SizedBox(height: 16),
          _card(height: 220),
          const SizedBox(height: 16),
          _card(height: 260),
        ],
      ),
    );
  }

  Widget _card({double height = 120}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.transparent,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SkeletonBox(height: 18, width: 160),
          const SizedBox(height: 12),
          SkeletonBox(height: 14),
          const SizedBox(height: 8),
          SkeletonBox(height: 14, width: 220),
          const SizedBox(height: 16),
          SkeletonBox(height: height),
        ],
      ),
    );
  }
}
