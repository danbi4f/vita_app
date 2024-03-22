import 'package:flutter/material.dart';
import 'package:vita_app/features/3_meals/models/recipe_model.dart';

class DetailsRecipe extends StatelessWidget {
  final Recipe recipe;

  const DetailsRecipe({required this.recipe, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Extracting unique nutrient names
    Set<String> uniqueNutrientNames = {};
    for (var ingredient in recipe.ingredientsRecipe!) {
      for (var nutrient in ingredient.foodNutrients!) {
        uniqueNutrientNames.add(nutrient.nutrientName!);
      }
    }

    // Creating a map to store and sum values for each nutrientName
    Map<String, double> nutrientSumMap = {};
    for (var ingredient in recipe.ingredientsRecipe!) {
      for (var nutrient in ingredient.foodNutrients!) {
        final value = double.parse(nutrient.value!);
        nutrientSumMap.update(
          nutrient.nutrientName!,
          (existingValue) => existingValue + value,
          ifAbsent: () => value,
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          recipe.description!,
          style: const TextStyle(fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Ingredients:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (var ingredient in recipe.ingredientsRecipe!)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          ingredient.description!,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Nutrient:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var nutrientName in uniqueNutrientNames)
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30,
                      right: 30,
                      top: 10,
                    ),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(nutrientName),
                            const Spacer(),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      nutrientSumMap[nutrientName]!
                                          .toStringAsFixed(2),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(width: 20),
                                    Text(_getUnitNameForNutrient(
                                        uniqueNutrientNames, nutrientName)),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _getUnitNameForNutrient(
      Set<String> uniqueNutrientNames, String nutrientName) {
    for (var ingredient in recipe.ingredientsRecipe!) {
      for (var nutrient in ingredient.foodNutrients!) {
        if (nutrient.nutrientName == nutrientName) {
          return nutrient.unitName ?? '';
        }
      }
    }
    return ''; // Return empty string if unit name not found
  }
}
