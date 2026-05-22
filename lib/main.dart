import 'package:flutter/material.dart';
import 'dart:ui';
void main(){
  runApp(const RobinFoodApp());
}

class RobinFoodApp extends StatelessWidget{
const RobinFoodApp({super.key});


@override
Widget build(BuildContext context){
return MaterialApp(
  title: 'Robin Food',
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    fontFamily: 'Arial',
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFFF9800)
    ),
  ),
  home: const HomeScreen(),
);
}

}




class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.ltr,
     child: Scaffold(
      body:SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const[
             TopHome(),
              CategoriesSection(),
              OfferSection(),
              ResturantsSection(),
            ],
          ),
        ),
        ),
bottomNavigationBar: const HomeBottomNavBar(),
     ),
     );
  }
}

class TopHome extends StatelessWidget{
const TopHome({super.key});
@override
  Widget build(BuildContext context) {
return Container(
  
decoration: BoxDecoration(
  
borderRadius: BorderRadius.only(
  bottomLeft: Radius.circular(28),
  bottomRight: Radius.circular(28),
),    gradient: const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromARGB(255, 247, 202, 151),
        Color.fromARGB(255, 236, 141, 25),
      ],
    ),
  ),
  child: Column(
    children: [
              HomeHeader(),
              SearchSection(),
              PromoBanner(),
    ],
  ),
);
  }


}


class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(//why we started with PAdding not row Directly or Container?
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 12),
      margin:const EdgeInsets.fromLTRB(10, 10, 10, 10),
      
      color:Color.fromARGB(0, 250, 186, 108),    
      child: Row(
        
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          // Logo section
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ROBIN',
                style: TextStyle(
                  fontSize: 40,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF2B2112),
                  height: 0.9,
                ),
              ),
              Text(
                '>>> -----',
                style:TextStyle(
                  letterSpacing: 1.5,
                  wordSpacing:-10,
                  fontSize: 15,
                  color:Color.fromARGB(179, 49, 12, 1),
                )
              ),
             
            ],
          ),

          const SizedBox(width: 24),

          // Location section
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
                        color: Color(0xFF2B2112),
                        height: 1,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 24,
                      color: Color(0xFF2B2112),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Text(
                  'Address 23, Cairo, Egypt',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF6E6256),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                hintText: 'إيش ومن فين حاب تاكل اليوم؟',
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color(0xFFFF9800),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
const SizedBox(width: 5,),

          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.shopping_basket_outlined,
                  color: Color(0xFF2B2112),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PromoBanner extends StatelessWidget{
  const PromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 0),
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(24),
    ),
    child:  Center(
      widthFactor: 200,
      child: Image.asset(
  'assets/images/Banner.png',
  // width:400,
  // height: auto,
    fit: BoxFit.contain,

),
    ),
    );
  }
}


class CategoriesSection extends StatelessWidget{
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context){
    return SizedBox(
      height: 110,
      child: Center(
        child:  ListView(
          scrollDirection: Axis.horizontal,
  padding: const EdgeInsets.fromLTRB(8,0,8,0),
  children: <Widget>[
    Container(
      // ignore: equal_elements_in_set
      margin: EdgeInsets.all(10),
      height: 50,
      color: Colors.amber[600],
      child: const Center(child: Text('Entry A')),
    ),
    Container(
            margin: EdgeInsets.all(10),

      height: 50,
      color: Colors.amber[500],
      child: const Center(child: Text('Entry B')),
    ),
    Container(
            margin: EdgeInsets.all(10),

      height: 50,
      color: Colors.amber[100],
      child: const Center(child: Text('Entry C')),
    ),
        Container(
            margin: EdgeInsets.all(10),

      height: 50,
      color: Colors.amber[100],
      child: const Center(child: Text('Entry C')),
    ),
        Container(
            margin: EdgeInsets.all(10),

      height: 50,
      color: Colors.amber[100],
      child: const Center(child: Text('Entry C')),
    ),    Container(
            margin: EdgeInsets.all(10),

      height: 50,
      color: Colors.amber[100],
      child: const Center(child: Text('Entry C')),
    ),    Container(
            margin: EdgeInsets.all(10),

      height: 50,
      color: Colors.amber[100],
      child: const Center(child: Text('Entry C')),
    ),    Container(
            margin: EdgeInsets.all(10),

      height: 50,
      color: Colors.amber[100],
      child: const Center(child: Text('Entry C')),
    ),    Container(
            margin: EdgeInsets.all(10),

      height: 50,
      color: Colors.amber[100],
      child: const Center(child: Text('Entry C')),
    ),    Container(
            margin: EdgeInsets.all(10),

      height: 50,
      color: Colors.amber[100],
      child: const Center(child: Text('Entry C')),
    ),
        Container(
            margin: EdgeInsets.all(10),

      height: 50,
      color: Colors.amber[100],
      child: const Center(child: Text('Entry C')),
    ),    Container(
            margin: EdgeInsets.all(10),

      height: 50,
      color: Colors.amber[100],
      child: const Center(child: Text('Entry C')),
    ),    Container(
            margin: EdgeInsets.all(10),

      height: 50,
      color: Colors.amber[100],
      child: const Center(child: Text('Entry C')),
    ),    Container(
            margin: EdgeInsets.all(10),

      height: 50,
      color: Colors.amber[100],
      child: const Center(child: Text('Entry C')),
    ),    Container(
            margin: EdgeInsets.all(10),

      height: 50,
      color: Colors.amber[100],
      child: const Center(child: Text('Entry C')),
    ),
  ],
)
      ),
    );
  }
}

class OfferSection extends StatelessWidget{
  const OfferSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      padding: const EdgeInsets.all(20),
      child: const Center(
        child: Text('Special Offers'),
      ),
    );
  }
}

class ResturantsSection extends StatelessWidget{
  const ResturantsSection({super.key});
@override
Widget build(BuildContext context){
  return Column(
    children: const [
      Text("Resturants"),
      SizedBox(height: 12),
      RestaurantCard(),

    ],
  
  
  
  );

}

}

class RestaurantCard extends StatelessWidget{
  const RestaurantCard({super.key});
@override

Widget build(BuildContext context){
  return Container(
    height: 150,
    margin: const EdgeInsets.symmetric(horizontal: 16 ,vertical: 8),
    decoration: BoxDecoration(
      color: const Color.fromARGB(95, 224, 150, 40),
      borderRadius: BorderRadius.circular(24),
      boxShadow: [
        BoxShadow(
          color:Color.fromARGB(32, 217, 7, 7),
          blurRadius: 100,
          offset: Offset(0,4),
        ),
      ],
    ),
    child: const Center(
      child: Text('Resturant Card'),
    ),
  );
}

}


class HomeBottomNavBar extends StatelessWidget{
  const HomeBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex:  0,
      items:const [
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings'),
                  BottomNavigationBarItem(
          icon: Icon(Icons.receipt_rounded),
          label: 'Orders'),
                  BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home'),
      ],
    );
  }
}