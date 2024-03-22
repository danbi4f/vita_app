import 'package:flutter/material.dart';
import 'package:vita_app/common/repository/data/survey_foods_local_source.dart';
import 'package:vita_app/common/repository/models/survey_foods_model.dart';
import 'package:vita_app/common/repository/survey_foods_repository.dart';

class SurveyFoodsSearchProvider extends ChangeNotifier {
  SurveyFoodsSearchProvider({this.surveyFoods});

  SurveyFoodsModel? surveyFoods;

  Future<void> getSurveyFoodsProvider() async {
    //
    SurveyFoodsRepo repository = SurveyFoodsRepo(
      source: SurveyFoodsLocalSource(),
    );

    final surveyFoodsModel = await repository.source.getSurveyFoods();

    surveyFoods = surveyFoodsModel;
    notifyListeners();
    
  }
}
