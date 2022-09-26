import 'package:flutter/material.dart';
import 'package:intro_screen_app/sign_up.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'global.dart';

class Register_page extends StatefulWidget {
  const Register_page({Key? key}) : super(key: key);

  @override
  State<Register_page> createState() => _Register_pageState();
}

class _Register_pageState extends State<Register_page> {
  checkprefs() async {
    final pref = await SharedPreferences.getInstance();
    final sign_up = pref.getBool('sign_up') ?? false;
  }

  TextEditingController regemailController = TextEditingController();
  TextEditingController regpasswordController = TextEditingController();
  GlobalKey<FormState> Registerkey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkprefs();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    checkprefs();
    regemailController.dispose();
    regpasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Page"),
        centerTitle: true,
      ),
      body: Container(
        child: Form(
          key: Registerkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: regemailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    label: Text("Email"),
                    hintText: "Enter Your Email Adress",
                  ),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please Enter your Email";
                    }
                    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(val)) {
                      return "Please enter a valid email address";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      Global.RegisterEmail = value;
                    });
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: regpasswordController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    label: Text("Password"),
                    hintText: "Enter Your Password",
                  ),
                  validator: (val) {
                    if (val!.length < 6) {
                      return "Password is too short";
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      Global.Registerpassword = value;
                    });
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                  child: Text("Save"),
                  onPressed: () {
                    setState(() async {
                      Registerkey.currentState?.validate();

                      Global.RegisterEmail = regemailController.text;
                      Global.Registerpassword = regpasswordController.text;

                      final pref = await SharedPreferences.getInstance();
                      pref.setBool('sign_up', true);

                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Sign_up_page()),
                      );
                    });
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                  child: Text("Clear"),
                  onPressed: () {
                    setState(() {
                      Registerkey.currentState?.reset();
                      regemailController.clear();
                      regpasswordController.clear();

                      setState(() {
                        Global.RegisterEmail = '';
                        Global.Registerpassword = '';
                      });
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
