import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_mobx/repositories/cep_repository.dart';
import 'package:xlo_mobx/repositories/ibge_repository.dart';
import 'package:xlo_mobx/screens/base/base_screen.dart';
import 'package:xlo_mobx/screens/category/category_screen.dart';
import 'package:xlo_mobx/stores/category_store.dart';
import 'package:xlo_mobx/stores/connectivity_store.dart';
import 'package:xlo_mobx/stores/favorite_store.dart';
import 'package:xlo_mobx/stores/home_store.dart';
import 'package:xlo_mobx/stores/page_store.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_mobx/stores/user_manager_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  setupLocators();
  runApp(MyApp());



}

void setupLocators() {
  GetIt.I.registerSingleton(ConnectivityStore());
  GetIt.I.registerSingleton(PageStore());
  GetIt.I.registerSingleton(HomeStore());
  GetIt.I.registerSingleton(UserManagerStore());
  GetIt.I.registerSingleton(CategoryStore());
  GetIt.I.registerSingleton(FavoriteStore());
}

Future<void> initializeParse() async {
    await Parse().initialize(
    'eLJkQq6nOyeFaWj3OMTqlVfYseAUfsKVPzXwKBl7',
    'https://parseapi.back4app.com/',
    clientKey: '5SF0qVLAcfz05SlAth5w52LolyUH31Cy29tolBuZ',
    autoSendSessionId: true,
    debug: true,
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XLO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.purple,
        appBarTheme: AppBarTheme(
          elevation: 0,
        ),
        cursorColor: Colors.orange,
      ),
      supportedLocales: const  [ 
        Locale('pt', 'BR'),
      ],
      localizationsDelegates: [ 
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: BaseScreen(),
    );
  }
}