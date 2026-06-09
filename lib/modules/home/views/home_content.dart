import 'package:flutter/material.dart';

import '../widgets/categories_section.dart';
import '../widgets/offer_section.dart';
import '../widgets/restaurants_section.dart';
import '../widgets/top_home.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          TopHome(),
          CategoriesSection(),
          OfferSection(),
          RestaurantsSection(),
        ],
      ),
    );
  }
}
