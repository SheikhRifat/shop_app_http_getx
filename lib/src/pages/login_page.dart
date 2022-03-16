import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/src/controller/base_controller.dart';
import 'package:shop_app/src/function/decoration.dart';
import 'package:shop_app/src/pages/home_page.dart';
import 'package:shop_app/src/pages/signup_page.dart';
import 'package:shop_app/src/pakages/ktext.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with BaseController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final Size size = Get.size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.25,
              ),
              _top(),
              Form(
                key: _fromKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextFormField(
                          controller: username,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your email';
                            }
                            return null;
                          },
                          decoration: userDecoration(
                            hintText: 'username',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextFormField(
                          controller: password,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your password';
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration: userDecoration(
                            hintText: 'password',
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: KText(
                                text: 'Forget password?',
                                color: Colors.greenAccent,
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  primary: Colors.greenAccent,
                                ),
                                onPressed: () {
                                  if (_fromKey.currentState!.validate()) {
                                    authC.login(username.text, password.text);
                                    Get.offAll(HomePage());

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          backgroundColor: Colors.white,
                                          content: KText(
                                            text: 'Successfully logged in',
                                            color: Colors.black,
                                          )),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.white,
                                        content: KText(
                                          text: 'Invalid email or password',
                                          color: Colors.black,
                                        ),
                                      ),
                                    );
                                  }
                                },
                                child: KText(
                                  text: 'Log In',
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          KText(text: "Don't have an account?"),
                          TextButton(
                              onPressed: () {
                                Get.to(SignupPage());
                              },
                              child: KText(
                                text: 'create a account',
                                color: Colors.greenAccent,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column _top() {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[200],
          child: Icon(
            Icons.person_outline,
            size: 40,
            color: Colors.grey[400],
          ),
          maxRadius: 40,
        ),
        SizedBox(height: 16),
        Text(
          "Welcome",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        SizedBox(height: 4),
        Text(
          "Sign to continue",
          style: TextStyle(
            color: Colors.grey[400],
          ),
        ),
      ],
    );
  }
}
