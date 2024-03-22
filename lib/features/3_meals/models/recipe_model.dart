import 'package:isar/isar.dart';
part 'recipe_model.g.dart';

@Collection()
class Recipe {
  Recipe({
     this.ingredientsRecipe,
     this.description,

  });
  Id id = Isar.autoIncrement;
  String? description;
  List<FoodsModelIsarRecipe>? ingredientsRecipe;
}

@embedded
class FoodsModelIsarRecipe {
  FoodsModelIsarRecipe({
    this.description,
    this.foodNutrients,
    this.fdcId,
  });
  String? description;
  List<FoodNutrientsModelIsarRecipe>? foodNutrients;
  int? fdcId;
}

@embedded
class FoodNutrientsModelIsarRecipe {
  FoodNutrientsModelIsarRecipe({
    this.nutrientNumber,
    this.unitName,
    this.nutrientName,
    this.value,
  });
  String? nutrientNumber;
  String? unitName;
  String? nutrientName;
  String? value;
}