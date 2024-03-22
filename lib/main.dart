import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vita_app/common/repository/data/local_database.dart';
import 'package:vita_app/features/1_search/provider/survey_foods_search_provider.dart';
import 'package:vita_app/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final localDatabase = LocalDatabase();
  await localDatabase.initialize();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SurveyFoodsSearchProvider(),
        ),
        ChangeNotifierProvider.value(
          value: localDatabase,
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: Provider.of<LocalDatabase>(context, listen: false).initialize(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return const HomePage();
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
