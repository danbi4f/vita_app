import 'package:isar/isar.dart';
part 'survey_foods_model.g.dart';

@Collection()
class SurveyFoodsModel {
  SurveyFoodsModel({this.surveyFoods});

  Id id = Isar.autoIncrement;
  List<FoodModel>? surveyFoods;

  factory SurveyFoodsModel.fromMap(Map<String, dynamic> json) =>
      SurveyFoodsModel(
        surveyFoods: List<FoodModel>.from(
            json['SurveyFoods'].map((x) => FoodModel.fromMap(x))),
      );
}

@embedded
class FoodModel {
  FoodModel({
    this.description,
    this.foodNutrients,
    this.fdcId,
  });

  String? description;
  List<FoodNutrientsModel>? foodNutrients;
  int? fdcId;

  factory FoodModel.fromMap(Map<String, dynamic> json) => FoodModel(
        fdcId: json['fdcId'],
        description: json['description'],
        foodNutrients: List<FoodNutrientsModel>.from(
            json['foodNutrients'].map((x) => FoodNutrientsModel.fromMap(x))),
      );
}

@embedded
class FoodNutrientsModel {
  FoodNutrientsModel({
    this.nutrient,
    this.amount,
  });

  NutrientModel? nutrient;
  String? amount;

  factory FoodNutrientsModel.fromMap(Map<String, dynamic> json) =>
      FoodNutrientsModel(
        nutrient: NutrientModel.fromMap(json['nutrient']),
        amount: json['amount'].toString(),
      );
}

@embedded
class NutrientModel {
  NutrientModel({
    this.number,
    this.name,
    this.unitName,
  });

  String? number;
  String? name;
  String? unitName;

  factory NutrientModel.fromMap(Map<String, dynamic> json) => NutrientModel(
        number: json['number'],
        unitName: json['unitName'],
        name: json['name'],
      );
}
