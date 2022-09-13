// ignore_for_file: depend_on_referenced_packages
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
        ChangeNotifierProvider(create: (_) => CartProvider()),
        // lazy function charge,
        //* by default the item is only rendered when called, but the lazzy option can change that behavior
        ChangeNotifierProvider(create: (_) => ProductsProvider(), lazy: false,),
        ChangeNotifierProvider(create: (_) => CategoryProvider(), lazy: false,),
        ChangeNotifierProvider(create: (_) => CanalProvider(), lazy: false,),
      ],
      child: const MyApp(),
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
        //* routes of app
        initialRoute: '/credit',
        routes: {
          '/': (context) => const SignInScreen(),
          '/products': (context) => const ProductListScreen(),
          '/credit': (context) => const CreditCardsPage(),
        },
      );
    });
  }
}
