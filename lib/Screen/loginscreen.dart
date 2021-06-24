import 'package:contact/Api/apiservice.dart';
import 'package:contact/Screen/home.dart';
import 'package:contact/model/loginmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool hidePassword = true;

  @override
  void initState() {
    super.initState();
  }

  TextEditingController _emailcontrol = TextEditingController();
  TextEditingController _passwordcontrol = TextEditingController();
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 25),
                      Text(
                        "Login",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      SizedBox(height: 20),
                      new TextFormField(
                        controller: _emailcontrol,
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (input) {
                          input = email;
                        },
                        validator: (input) => !input!.contains('@')
                            ? "Email Id should be valid"
                            : null,
                        decoration: new InputDecoration(
                          hintText: "Email Address",
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .accentColor
                                      .withOpacity(0.2))),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).accentColor)),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      new TextFormField(
                        controller: _passwordcontrol,
                        style: TextStyle(color: Theme.of(context).accentColor),
                        keyboardType: TextInputType.text,
                        onSaved: (input) {
                          input = password;
                        },
                        validator: (input) => input!.length < 3
                            ? "Password should be more than 3 characters"
                            : null,
                        obscureText: hidePassword,
                        decoration: new InputDecoration(
                          hintText: "Password",
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .accentColor
                                      .withOpacity(0.2))),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).accentColor)),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Theme.of(context).accentColor,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                            color:
                                Theme.of(context).accentColor.withOpacity(0.4),
                            icon: Icon(hidePassword
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                          onPressed: () {
                            print(email);
                            print(password);
                            final isValid = formKey.currentState!.validate();
                            print(isValid);
                            if (isValid) {
                              formKey.currentState!.save();
                              email = _emailcontrol.text.toString();
                              password = _passwordcontrol.text.toString();
                              ApiServicesss()
                                  .login(LoginReguest(
                                      email: email, password: password))
                                  .then((value) {
                                if (value.token.isNotEmpty) {
                                  print(value.token);
                                  Get.showSnackbar(
                                    GetBar(
                                      duration: Duration(seconds: 2),
                                      message: "Login Sucess",
                                    ),
                                  );
                                  Get.offAll(Home(), curve: Curves.easeIn);
                                } else {
                                  Get.showSnackbar(
                                    GetBar(
                                      duration: Duration(seconds: 2),
                                      message: value.error,
                                    ),
                                  );
                                }
                              });
                            } else {
                              Get.showSnackbar(
                                GetBar(
                                  duration: Duration(seconds: 1),
                                  message: "Login Failed",
                                ),
                              );
                            }
                          },
                          child: Text('Login')),
                    ],
                  )),
            ])));
  }
}
