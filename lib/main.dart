
//* packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
//* screens
import 'package:posbank_flutter/screen/screens.dart';
//* providers
import 'package:posbank_flutter/provider/provider.dart';
void main() {
  runApp(const AppState());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
}
class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //* by default the item is only rendered when called, but the lazzy option can change that behavior
        ChangeNotifierProvider(create: ( _ ) => ProductsProvider()),
        ChangeNotifierProvider(create: ( _ ) => CartProvider()),
        ChangeNotifierProvider(create: ( _ ) => CanalProvider()),
        ChangeNotifierProvider(create: ( _ ) => CategoryProvider())
        
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Lato'), 
        initialRoute: 'home',
        routes: {
          'home': (context) => SignInScreen(),
          'products': (context) => ProductListScreen(),
          'pay': (context) => CreditCardsPage(),
        },
      );
    });
  }
}
