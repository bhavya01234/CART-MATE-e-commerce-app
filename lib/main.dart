import 'package:amazon_two/common/widgets/bottom_bar.dart';
import 'package:amazon_two/constants/global_variables.dart';
import 'package:amazon_two/features/admin/screens/admin_screen.dart';
import 'package:amazon_two/features/auth/screens/auth_screen.dart';
import 'package:amazon_two/features/auth/services/auth_service.dart';
import 'package:amazon_two/home/screens/home_screen.dart';
import 'package:amazon_two/providers/user_provider.dart';
import 'package:amazon_two/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => UserProvider(),),
    ],
  child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override

  void initState(){
    final AuthService authService = AuthService();
    super.initState();
    authService.getUserData(context);
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Amazon Clone',
      theme: ThemeData(

        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),

        appBarTheme: const AppBarTheme(
          //color: Colors.blue,

          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),

      onGenerateRoute: (settings) => generateRoute(settings),
      //1 ->checking if token there or not,
      // if not -> authscreen
      // if there -> if user -> bottom -> if not  -> admin
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Provider.of<UserProvider>(context).user.type == 'user'
          ? const BottomBar()
          : const AdminScreen()
          : const AuthScreen(),

      // home: Provider.of<UserProvider>(context).user.type == 'user'? const BottomBar()
      // :const AuthScreen(),

    );
  }
}

// earlier : even when token was not there -> admin screen
// correction made.