import 'package:flutter/material.dart';
import 'package:flutter_intern_1/Register.dart';
import 'package:flutter_intern_1/forgot_pass.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  final _formKeys = GlobalKey<FormState>();
  String _email = '', _password = '';
  var loading = false;
  bool obsecure = true;
  var _value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
                key: _formKeys,
                child: Column(
                  children: [
                    Image.asset("assets/images/Tablet login-bro.png",width: 300,),
                    Padding(
                      padding:
                      const EdgeInsets.only(right: 200, top: 10, bottom: 0),
                      child: Text(
                        "Login",
                        style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 60, left: 10, top: 10, bottom: 15),
                      child: Text(
                        "login in to Hospital Managment System",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        onChanged: (value) => _email = value,
                        validator: (value) =>
                            value!.isEmpty ? 'Enter valid email' : null,
                        decoration: InputDecoration(
                           enabledBorder: OutlineInputBorder(
                             borderSide: BorderSide(color: Colors.greenAccent),
                             borderRadius: BorderRadius.circular(25)
                           ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.greenAccent),
                                borderRadius: BorderRadius.circular(25)
                            ),
                            labelText: "Enter your email",
                            labelStyle:TextStyle(color: Colors.black45),
                            hintText: "ex.example@gmail.com",
                            prefixIcon: Icon(Icons.email,color: Colors.black,)),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        onChanged: (value) => _password = value,
                        validator: (value) => value != _password
                            ? 'your pass error try again'
                            : null,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.greenAccent),
                              borderRadius: BorderRadius.circular(25)
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.greenAccent),
                              borderRadius: BorderRadius.circular(25)
                            ),
                            labelText: "Enter your password",
                            labelStyle: TextStyle(color: Colors.black54),
                            prefixIcon: Icon(Icons.vpn_key,color: Colors.black,),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  obsecure = !obsecure;
                                });
                              },
                              child: Icon(obsecure
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            )),
                        obscureText: obsecure,
                      ),
                    ),
                  ],
                )),
            Container(
                alignment: Alignment.centerRight,
                child: FlatButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Forgotpass()));
                    },
                    child: Text(
                      "Forgot Password ?",
                      style: TextStyle(color: Colors.black54),
                    ))),
            Padding(
              padding: const EdgeInsets.only(left: 90),
              child: Row(
                children: [
                  Radio(
                      activeColor: Colors.greenAccent,
                      value: 1,
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = 1;
                        });
                      }),
                  Text("Patient"),
                  Radio(
                      activeColor: Colors.greenAccent,
                      value: 2,
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = 2;
                        });
                      }),
                  Text("Doctor")
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                    height: 60,
                    width: 300,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                        child: loading
                            ? CircularProgressIndicator(
                        )
                            : Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        onPressed: () async {
                      setState(() {
                        loading = true;
                      });
                      Future.delayed(Duration(seconds: 3), () {
                        setState(() {
                          loading = false;
                        });
                      });
                      if (_formKeys.currentState!.validate()) {
                        print(_email);
                      }
                    },
                      color: Colors.greenAccent,
                    )
                )
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Don't have account ?"),
                  FlatButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => register()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 60),
                        child: Text(
                          "SignUp",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
