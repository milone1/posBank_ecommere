// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:posbank_flutter/provider/cart_provider.dart';
import 'package:posbank_flutter/screen/credit_cards.dart';
import 'package:posbank_flutter/screen/sign_In_screen.dart';
import 'package:posbank_flutter/screen/product_list.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: Builder(builder: (BuildContext context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'Lato'),
          initialRoute: '/',
          routes: {
            '/': (context) => const SignInScreen(),
            '/products': (context) => const ProductListScreen(),
            '/credit': (context) => const CreditCardsPage(),
          },
        );
      }),
    );
  }
}
