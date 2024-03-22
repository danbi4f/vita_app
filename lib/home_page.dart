import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vita_app/features/1_search/pages/search_page.dart';
import 'package:vita_app/features/1_search/provider/survey_foods_search_provider.dart';
import 'package:vita_app/features/2_food_favorite/pages/favorite_page.dart';

import 'package:vita_app/features/3_meals/pages/melas_page.dart';
import 'package:vita_app/features/4_meal_schedule/pages/schedule_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final screens = <Widget>[
    const SearchPage(),
    const FavoritePage(),
    const MealsPage(),
    const SchedulePage(),
  ];

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // Pobierz dane tylko raz przy uruchomieniu aplikacji
    Provider.of<SurveyFoodsSearchProvider>(context, listen: false)
        .getSurveyFoodsProvider();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: navigationBar(context),
      body: IndexedStack(
        children: [
          screens[currentIndex],
        ],
      ),
    );
  }

  BottomNavigationBar navigationBar(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.transparent,
      selectedItemColor: Colors.grey.shade900,
      unselectedItemColor: Colors.grey.shade600,
      selectedFontSize: 18,
      currentIndex: currentIndex,
      onTap: (index) => setState(() {
        currentIndex = index;
      }),
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/search.png',
            width: 40,
            height: 40,
          ),
          label: 'szukaj',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/favorite.png',
            width: 40,
            height: 40,
          ),
          label: 'ulubione',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/food.png',
            width: 40,
            height: 40,
          ),
          label: 'posiłki',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/schedule.png',
            width: 40,
            height: 40,
          ),
          label: 'harmonogram',
        ),
      ],
    );
  }
}
