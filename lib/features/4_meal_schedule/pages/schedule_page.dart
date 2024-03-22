import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vita_app/common/repository/data/local_database.dart';


class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    final foodsDatabase = context.watch<LocalDatabase>();

    final currentMeals = foodsDatabase.currentMeals;



    return Scaffold(
      appBar: AppBar(
        
        title: const Text(
          'Schedule',
        ),
      ),
      body: Column()
    );
  }
}