import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vita_app/common/repository/data/local_database.dart';
import 'package:vita_app/common/repository/models/survey_foods_model.dart';
import 'package:vita_app/features/1_search/provider/survey_foods_search_provider.dart';
import 'package:vita_app/features/1_search/widgets/details_food_search.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late List<FoodModel> filteredSurveyFoods;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredSurveyFoods = [];
  }

  void searchByKeywords(String keyword) {
    final surveyFoodsSearchProvider =
        Provider.of<SurveyFoodsSearchProvider>(context, listen: false);
    final surveyFoods = surveyFoodsSearchProvider.surveyFoods?.surveyFoods;

    setState(() {
      filteredSurveyFoods = surveyFoods
              ?.where((food) =>
                  food.description
                      ?.toLowerCase()
                      .contains(keyword.toLowerCase()) ==
                  true)
              .toList() ??
          [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('search ingredient'),
        centerTitle: true,
      ),
      body: Consumer<SurveyFoodsSearchProvider>(
        builder: (context, surveyFoodsSearchProvider, _) {
          if (surveyFoodsSearchProvider.surveyFoods == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Column(
              children: [
                Text('Number of foods: ${filteredSurveyFoods.length}'),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredSurveyFoods.length,
                    itemBuilder: (context, index) {
                      final database = context.watch<LocalDatabase>();
                      bool isAdded = database.currentFoods.any(
                        (food) => food.surveyFoods!.any(
                          (f) => f.fdcId == filteredSurveyFoods[index].fdcId,
                        ),
                      );
                      return Card(
                        margin: const EdgeInsets.all(8.0),
                        elevation: 5,
                        child: ListTile(
                          trailing: IconButton(
                            onPressed: () {
                              final database = context.read<LocalDatabase>();
                              final currentFoods = database.currentFoods;
                              final isAdded = currentFoods.any(
                                (food) => food.surveyFoods!.any(
                                  (f) =>
                                      f.fdcId ==
                                      filteredSurveyFoods[index].fdcId,
                                ),
                              );
                              if (isAdded && currentFoods.isNotEmpty) {
                                // Jeśli składnik jest już dodany, usuwamy go
                                final matchingFood = currentFoods.firstWhere(
                                  (food) => food.surveyFoods!.any(
                                    (f) =>
                                        f.fdcId ==
                                        filteredSurveyFoods[index].fdcId,
                                  ),
                                );
                                context
                                    .read<LocalDatabase>()
                                    .deleteFood(matchingFood.id);
                              } else {
                                // Jeśli składnik nie jest jeszcze dodany, dodajemy go
                                context.read<LocalDatabase>().addFood(
                                  [filteredSurveyFoods[index]],
                                );
                              }
                            },
                            icon: isAdded
                                ? const Icon(Icons.favorite, color: Colors.red)
                                : const Icon(Icons.favorite_border),
                          ),
                          title: Text(
                            filteredSurveyFoods[index].description ?? '',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsFoodSearch(
                                  food: filteredSurveyFoods[index],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 30,
                    right: 30,
                    bottom: 20,
                  ),
                  child: TextField(
                    controller: searchController,
                    decoration: const InputDecoration(
                      labelText: 'Enter food name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    onChanged: (value) {
                      searchByKeywords(value);
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
