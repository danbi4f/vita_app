import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vita_app/common/repository/data/local_database.dart';
import 'package:vita_app/features/2_food_favorite/widgets/details_food_favorite.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    final foodsDatabase = context.watch<LocalDatabase>();
    final currentFoods = foodsDatabase.currentFoods;
    print(currentFoods);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Foods'),
      ),
      body: ListView.builder(
        itemCount: currentFoods.length,
        itemBuilder: (context, index) {
          final surveyFoods = currentFoods[index].surveyFoods;
          // Sprawdź, czy surveyFoods nie jest puste i czy opis nie jest null
          final description = surveyFoods != null && surveyFoods.isNotEmpty
              ? surveyFoods[0].description ?? 'No description available'
              : 'No description available';

          return Card(
            elevation: 5,
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              
              trailing: IconButton(
                onPressed: () {
                  setState(() {
                    foodsDatabase.deleteFood(currentFoods[index].id);
                  });
                },
                icon: const Icon(Icons.delete),
              ),
              title: Text(
                description,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsFoodFavorite(food: surveyFoods![0]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
