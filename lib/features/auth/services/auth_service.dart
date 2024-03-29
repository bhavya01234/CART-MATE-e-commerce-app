import 'package:amazon_two/common/widgets/bottom_bar.dart';
import 'package:amazon_two/constants/error_handling.dart';
import 'package:amazon_two/constants/global_variables.dart';
import 'package:amazon_two/constants/utils.dart';
import 'package:amazon_two/home/screens/home_screen.dart';
import 'package:amazon_two/models/user.dart';
import 'package:amazon_two/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AuthService{
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,

  })async {
    try{
      User user = User(
          id: '',
          name: name,
          email: email,
          password: password,
          address: '',
          type: '',
          token: '',
          cart: []
      );

      http.Response res= await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        // Since we used -> app.use(express.json());
        headers: <String, String>{
          //means english -> utf8
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );

      httpErrorHandle(response: res, context: context, onSuccess: (){
        showSnackBar(context, 'Account created! Login with the same credentials!');
      },
      );

      //print(res.body);
    }
    catch(e){
      //print('okay okay okayyyyy');
      showSnackBar(context, e.toString(), );
    }
  }




  //signin
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
    //required String name,

  })async {
    try{
      //User user = User(id: '', name: name, email: email, password: password, address: '', type: '', token: '');

      http.Response res= await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        // Since we used -> app.use(express.json());
        headers: <String, String>{
          //means english -> utf8
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );

      print(res.body);
      httpErrorHandle(response: res,
        context: context,
        onSuccess: () async {

        SharedPreferences prefs = await SharedPreferences.getInstance();
        Provider.of<UserProvider>(context, listen: false).setUser(res.body);

        await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
        Navigator.pushNamedAndRemoveUntil(context,
          BottomBar.routeName,
              (route) => false,
        );
      },
      );

      //print(res.body);
    }
    catch(e){
      //print('okay okay okayyyyy');
      showSnackBar(context, e.toString(), );
    }
  }

// get user data
  void getUserData(
      BuildContext context,
      ) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(
        Uri.parse('$uri/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!
        },
      );

      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        http.Response userRes = await http.get(
          Uri.parse('$uri/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
          },
        );

        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}