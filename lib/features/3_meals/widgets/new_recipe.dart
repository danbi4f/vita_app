import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vita_app/common/repository/data/local_database.dart';
import 'package:vita_app/common/repository/models/survey_foods_model.dart';
import 'package:vita_app/features/3_meals/models/recipe_model.dart';

class NewRecipe extends StatefulWidget {
  const NewRecipe({Key? key}) : super(key: key);

  @override
  State<NewRecipe> createState() => _NewRecipeState();
}

class _NewRecipeState extends State<NewRecipe> {
  final List<SurveyFoodsModel> _selectedFoods = [];
  final TextEditingController _nameRecipeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final foodsDatabase = context.watch<LocalDatabase>();
    final List<SurveyFoodsModel> currentFoods = foodsDatabase.currentFoods;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextField(
            controller: _nameRecipeController,
            decoration: const InputDecoration(
              labelText: 'Enter recipe name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: currentFoods.length,
            itemBuilder: (context, index) {
              final SurveyFoodsModel food = currentFoods[index];
              return CheckboxListTile(
                title: Text(food.surveyFoods!.first.description ?? ''),
                value: _selectedFoods.contains(food),
                onChanged: (bool? value) {
                  setState(() {
                    if (value != null && value) {
                      _selectedFoods.add(food);
                    } else {
                      _selectedFoods.remove(food);
                    }
                  });
                },
              );
            }, 
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: ElevatedButton(
            onPressed: () {
              // Zapisz wybrane elementy do LocalDatabase
              List<FoodsModelIsarRecipe> ingredientsRecipe = _selectedFoods
                  .map((selectedFood) =>
                      FoodsModelIsarRecipe(
                        description: selectedFood.surveyFoods!.first.description,
                        foodNutrients: selectedFood.surveyFoods!.first.foodNutrients?.map((foodNutrient) => 
                          FoodNutrientsModelIsarRecipe(
                            nutrientNumber: foodNutrient.nutrient?.number,
                            unitName: foodNutrient.nutrient?.unitName,
                            nutrientName: foodNutrient.nutrient?.name,
                            value: foodNutrient.amount
                          )
                        ).toList(),
                        fdcId: selectedFood.surveyFoods!.first.fdcId
                      ))
                  .toList();
              print('Ingredients Recipe:');
              ingredientsRecipe.forEach((ingredient) {
                print('Description: ${ingredient.description}');
                print('Food Nutrients:');
                ingredient.foodNutrients?.forEach((foodNutrient) {
                  print('  Nutrient Name: ${foodNutrient.nutrientName}');
                  print('  Nutrient Value: ${foodNutrient.value}');
                });
                print('FDC ID: ${ingredient.fdcId}');
              });
              print('Recipe Name: ${_nameRecipeController.text.trim()}');
              foodsDatabase.addMeals(
                  ingredientsRecipe, _nameRecipeController.text.trim());

              // Zamknij showModalBottomSheet po naciśnięciu przycisku "Save"
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 80,
              ),
            ),
            child: const Text('Save'),
          ),
        ),
      ],
    );
  }
}
