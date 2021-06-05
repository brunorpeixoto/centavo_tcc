import 'package:centavo_tcc/repositories/category_repository.dart';
import 'package:centavo_tcc/repositories/cep_repository.dart';
import 'package:centavo_tcc/repositories/ibge_repository.dart';
import 'package:centavo_tcc/screens/base/base_screen.dart';
import 'package:centavo_tcc/screens/category/category_screen.dart';
import 'package:centavo_tcc/stores/category_store.dart';
import 'package:centavo_tcc/stores/page_store.dart';
import 'package:centavo_tcc/stores/user_manager_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk_flutter/generated/i18n.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'stores/home_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  setupLocators();
  runApp(MyApp());

  //CepRepository().getAddressFromApi('18074-510').then((value) => print(value));
}

void setupLocators() {
  GetIt.I.registerSingleton(PageStore());
  GetIt.I.registerSingleton(HomeStore());
  GetIt.I.registerSingleton(UserManagerStore());
  GetIt.I.registerSingleton(CategoryStore());
}

Future<void> initializeParse() async {
  await Parse().initialize(
    '3gTOlad8wk7KJaQMoONf7hOe5lthD9Gq3hium5Jw',
    'https://parseapi.back4app.com/',
    clientKey: 'vINWxcJqeFYIBjecsAZJX6lxzKVGvvOXcZ2xUpmv',
    autoSendSessionId: true,
    debug: true,
  );

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Centavo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.amberAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.amber,
        appBarTheme: AppBarTheme(
            elevation: 50),

        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.purple,
        ),

      ),
      home: BaseScreen(),
    );
  }
}