import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 12),
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      color: const Color.fromARGB(0, 250, 186, 108),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ROBIN',
                style: TextStyle(
                  fontSize: 40,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w500,
                  color: AppColors.darkBrown,
                  height: 0.9,
                ),
              ),
              Text(
                '>>> -----',
                style: TextStyle(
                  letterSpacing: 1.5,
                  wordSpacing: -10,
                  fontSize: 15,
                  color: Color.fromARGB(179, 49, 12, 1),
                ),
              ),
            ],
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        color: AppColors.darkBrown,
                        height: 1,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 24,
                      color: AppColors.darkBrown,
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Text(
                  'Address 23, Cairo, Egypt',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 14, color: AppColors.mutedBrown),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
