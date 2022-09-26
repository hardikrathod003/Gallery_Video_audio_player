import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'global.dart';

class Sign_up_page extends StatefulWidget {
  const Sign_up_page({Key? key}) : super(key: key);

  @override
  State<Sign_up_page> createState() => _Sign_up_pageState();
}

class _Sign_up_pageState extends State<Sign_up_page> {
  TextEditingController signemailController = TextEditingController();
  TextEditingController signpasswordController = TextEditingController();
  GlobalKey<FormState> sign_upkey = GlobalKey<FormState>();

  checkprefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isloggedIn = prefs.getBool('isloggedIn') ?? false;
  }

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
    signemailController.dispose();
    signpasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up Page"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: sign_upkey,
              child: Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: signemailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    label: Text("Email"),
                    hintText: "Enter Your Email Adress",
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: signpasswordController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  label: Text("Password"),
                  hintText: "Enter Your Password",
                ),
              ),
            ),
            Container(
              child: ElevatedButton(
                child: Text("Save"),
                onPressed: () {
                  Global.SignupEmail = signemailController.text;
                  Global.Signuppassword = signpasswordController.text;

                  setState(() {
                    if (Global.RegisterEmail == Global.SignupEmail &&
                        Global.Registerpassword == Global.Signuppassword) {
                      Navigator.of(context).pushNamed('option_page');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Please enter currect credential"),
                        ),
                      );
                    }
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
                    sign_upkey.currentState?.reset();
                    signemailController.clear();
                    signpasswordController.clear();

                    setState(() {
                      Global.SignupEmail = '';
                      Global.Signuppassword = '';
                    });
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
