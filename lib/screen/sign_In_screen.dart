import 'package:flutter/material.dart';
import 'package:posbank_flutter/widget/widgets.dart';
class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

@override
void initState() {
  initState();
  imageCache.clear();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://images.pexels.com/photos/784633/pexels-photo-784633.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: ListOfItems(),
          ),
        ),
      ),
    );
  }
}