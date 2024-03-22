

import 'package:vita_app/common/repository/data/survey_foods_local_source.dart';
import 'package:vita_app/common/repository/models/survey_foods_model.dart';

class SurveyFoodsRepo {
  SurveyFoodsRepo({required this.source});

  final SurveyFoodsLocalSource source;

  Future<SurveyFoodsModel> getSurveyFoods() async => source.getSurveyFoods();
}