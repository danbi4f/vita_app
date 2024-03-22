import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vita_app/common/repository/data/local_database.dart';
import 'package:vita_app/features/3_meals/widgets/details_recipe.dart';
import 'package:vita_app/features/3_meals/widgets/new_recipe.dart';

class MealsPage extends StatefulWidget {
  const MealsPage({Key? key}) : super(key: key);

  @override
  State<MealsPage> createState() => _MealsPageState();
}

class _MealsPageState extends State<MealsPage> {
  @override
  Widget build(BuildContext context) {
    final foodsDatabase = context.watch<LocalDatabase>();

    final currentMeals = foodsDatabase.currentMeals;

    void openAddNewRecipe() {
      showModalBottomSheet(
        context: context,
        builder: (context) => const NewRecipe(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: ElevatedButton(
              onPressed: openAddNewRecipe,
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey,
              ),
              child: const Text(
                'New recipe',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
        title: const Text(
          'Meals',
        ),
      ),
      body: ListView.builder(
        itemCount: currentMeals.length,
        itemBuilder: (context, index) {
          final meal = currentMeals[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            elevation: 5,
            child: ListTile(
              title: Text(
                meal.description ?? '',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              trailing: IconButton(
                onPressed: () {
                  setState(() {
                    foodsDatabase.deleteMeals(currentMeals[index].id);
                  });
                },
                icon: const Icon(Icons.delete),
              ),
              onTap: () {
                // Przekazanie wybranego przepisu do ekranu szczegółów
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsRecipe(recipe: meal), // Przekazujemy wybrany przepis
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
