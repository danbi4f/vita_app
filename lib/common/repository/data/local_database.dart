import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vita_app/common/repository/models/survey_foods_model.dart';

import 'package:vita_app/features/3_meals/models/recipe_model.dart';

class LocalDatabase extends ChangeNotifier {
  static late Isar isar;

  // I N I T I A L I Z E - D A T A B A S E
   Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([SurveyFoodsModelSchema, RecipeSchema],
        directory: dir.path);
        await readFoods();
        await readMeals();
  }

  //--------------------- F O O D S ---------------------------------------------------------------------

// C R U D O P E R A T I O N S
  final List<SurveyFoodsModel> currentFoods = [];

  // CREATE - add a new recipe
  Future<void> addFood(List<FoodModel>? surveyFoods) async {
    // create a new recipe
    final newFood = SurveyFoodsModel()..surveyFoods = surveyFoods;

    // save to db
    await isar.writeTxn(() => isar.surveyFoodsModels.put(newFood));

    // re-read from db
    readFoods();
  }

  // READ - read saved recipes from db
  Future<void> readFoods() async {
    // fetch all recipes from db
    List<SurveyFoodsModel> fetchedFoods =
        await isar.surveyFoodsModels.where().findAll();

    // assign to current recipes
    currentFoods.clear();
    currentFoods.addAll(fetchedFoods);

    // update UI
    notifyListeners();
  }

  // UPDATE - edit recipe properties
  Future<void> updateFood(int id, 
      List<FoodModel> newFoodNutrients) async {
    // find the specific recipe
    final food = await isar.surveyFoodsModels.get(id);

    // update recipe properties
    if (food != null) {
      // update properties
      await isar.writeTxn(
        () async {
          food.surveyFoods = newFoodNutrients;

          // save updated recipe back to the db
          await isar.surveyFoodsModels.put(food);
        },
      );
    }

    // re-read from db
    readFoods();
  }

  // DELETE - delete recipe
  Future<void> deleteFood(int id) async {
    // perform the delete
    await isar.writeTxn(
      () async {
        await isar.surveyFoodsModels.delete(id);
      },
    );

    // re-read from db
    readFoods();
  }

  //--------------------- R E C I P E S ---------------------------------------------------------------------

  // C R U D O P E R A T I O N S
  final List<Recipe> currentMeals = [];

  // CREATE - add a new recipe
  Future<void> addMeals(
      List<FoodsModelIsarRecipe> ingredientsRecipe, String description) async {
    // create a new recipe
    final newRecipe = Recipe()
      ..ingredientsRecipe = ingredientsRecipe
      ..description = description;

    // save to db
    await isar.writeTxn(() => isar.recipes.put(newRecipe));

    // re-read from db
    readMeals();
  }

  // READ - read saved recipes from db
  Future<void> readMeals() async {
    // fetch all recipes from db
    List<Recipe> fetchedFoods = await isar.recipes.where().findAll();

    // assign to current recipes
    currentMeals.clear();
    currentMeals.addAll(fetchedFoods);

    // update UI
    notifyListeners();
  }

  // UPDATE - edit recipe properties
  Future<void> updateMeals(int id, List<FoodsModelIsarRecipe> ingredientsRecipe,
      String description) async {
    // find the specific recipe
    final meal = await isar.recipes.get(id);

    // update recipe properties
    if (meal != null) {
      // update properties
      await isar.writeTxn(
        () async {
          meal
            ..ingredientsRecipe = ingredientsRecipe
            ..description = description;

          // save updated recipe back to the db
          await isar.recipes.put(meal);
        },
      );
    }

    // re-read from db
    readMeals();
  }

  // DELETE - delete recipe
  Future<void> deleteMeals(int id) async {
    // perform the delete
    await isar.writeTxn(
      () async {
        await isar.recipes.delete(id);
      },
    );

    // re-read from db
    readMeals();
  }
}
