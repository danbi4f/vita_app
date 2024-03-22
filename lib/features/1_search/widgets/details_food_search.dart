import 'package:flutter/material.dart';
import 'package:vita_app/common/repository/models/survey_foods_model.dart';

class DetailsFoodSearch extends StatelessWidget {
  final FoodModel food;

  const DetailsFoodSearch({required this.food, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(food.description ?? ''), centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildNutrientGroup('Macronutrients', food.foodNutrients
                  ?.where((nutrient) => _isMacronutrient(nutrient.nutrient?.number))
                  .toList() ??
              []),
          const SizedBox(height: 20),
          _buildNutrientGroup('Vitamins', food.foodNutrients
                  ?.where((nutrient) => _isVitamin(nutrient.nutrient?.number))
                  .toList() ??
              []),
          const SizedBox(height: 20),
          _buildNutrientGroup('Minerals', food.foodNutrients
                  ?.where((nutrient) => _isMineral(nutrient.nutrient?.number))
                  .toList() ??
              []),
          const SizedBox(height: 20),
          _buildNutrientGroup('Other', food.foodNutrients
                  ?.where((nutrient) =>
                      !_isMacronutrient(nutrient.nutrient?.number) &&
                      !_isVitamin(nutrient.nutrient?.number) &&
                      !_isMineral(nutrient.nutrient?.number))
                  .toList() ??
              []),
        ],
      ),
    );
  }

  Widget _buildNutrientGroup(String groupName, List<FoodNutrientsModel>? nutrients) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              groupName,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: nutrients?.length ?? 0,
              itemBuilder: (context, index) {
                final nutrient = nutrients![index];
                return ListTile(
                  title: Row(
                    children: [
                      Text(
                      nutrient.nutrient?.name ?? '',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Text(
                        '${nutrient.amount ?? ''} ${nutrient.nutrient?.unitName ?? ''}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  bool _isMacronutrient(String? nutrientNumber) {
    final macronutrientNumbers = ['203', '204', '205', '291', '208'];
    return macronutrientNumbers.contains(nutrientNumber);
  }

  bool _isVitamin(String? nutrientNumber) {
    final vitaminNumbers = [
      '320',
      '321',
      '322',
      '323',
      '328',
      '401',
      '404',
      '405',
      '406',
      '415',
      '417',
      '418',
      '421',
      '430'
    ];
    return vitaminNumbers.contains(nutrientNumber);
  }

  bool _isMineral(String? nutrientNumber) {
    final mineralNumbers = [
      '301',
      '303',
      '304',
      '305',
      '306',
      '307',
      '309',
      '312',
      '317'
    ];
    return mineralNumbers.contains(nutrientNumber);
  }
}