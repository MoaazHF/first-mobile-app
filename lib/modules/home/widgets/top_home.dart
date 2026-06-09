import 'package:flutter/material.dart';

import 'home_header.dart';
import 'promo_banner.dart';
import 'search_section.dart';

class TopHome extends StatelessWidget {
  const TopHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 247, 202, 151),
            Color.fromARGB(255, 236, 141, 25),
          ],
        ),
      ),
      child: const Column(
        children: [HomeHeader(), SearchSection(), PromoBanner()],
      ),
    );
  }
}
