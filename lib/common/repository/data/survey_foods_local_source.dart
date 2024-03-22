import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'package:vita_app/common/repository/models/survey_foods_model.dart';

class SurveyFoodsLocalSource {
  Future<SurveyFoodsModel> getSurveyFoods() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/FoodData_Central_survey_food_json_2022-10-28.json');
      final data = json.decode(jsonString);
      final surveyFoodsModel = SurveyFoodsModel.fromMap(data);
      return surveyFoodsModel;
    } catch (e) {
      // print('Error loading survey foods data: $e');
      rethrow; // Re-throwing the exception for further handling
    }
  }
}
