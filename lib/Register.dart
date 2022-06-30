import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intern_1/Login.dart';
class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  bool _obscureText = true;
  final _formKeys = GlobalKey<FormState>();
  String _email = '', _password = '',_name='',_phonenumber='',uId='';
  var loading =false;
  var _image;
  String? _url;
  int _value=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(100.0),
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  backgroundImage: _image==null?null:FileImage(_image),
                  radius: 40,
                  child: IconButton(icon: Icon(Icons.add_a_photo,color: Colors.white,),onPressed: (){},),
                ),
              ),
            ),
            Form(
              key: _formKeys,
              child: Padding(
                padding: const EdgeInsets.only(top: 220, right: 10, left: 10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        onChanged: (value) => _name = value,
                        validator: (value) =>
                        value!.isEmpty ? 'Please Enter your Name' : null,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.greenAccent),
                                borderRadius: BorderRadius.circular(25)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.greenAccent),
                                borderRadius: BorderRadius.circular(25)
                            ),
                            labelText: "Name",
                            labelStyle: TextStyle(color: Colors.black45),
                            prefixIcon: Icon(Icons.account_circle,color: Colors.black,)),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        onChanged: (value) => _phonenumber = value,
                        validator: (value) =>
                        value!.isEmpty ? 'Please Enter your Phone ' : null,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.greenAccent),
                            borderRadius: BorderRadius.circular(25)
                          ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.greenAccent),
                                borderRadius: BorderRadius.circular(25)
                            ),
                            labelText: "Phone number",
                            labelStyle: TextStyle(color: Colors.black45),
                            prefixIcon: Icon(Icons.add_ic_call_rounded,color: Colors.black,),
                          suffixIcon: CountryCodePicker(
                            onChanged: print,
                            // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                            initialSelection: 'IT',
                            favorite: ['+39','FR'],
                            // optional. Shows only country name and flag
                            showCountryOnly: false,
                            // optional. Shows only country name and flag when popup is closed.
                            showOnlyCountryWhenClosed: false,
                            // optional. aligns the flag and the Text left
                            alignLeft: false,
                          )
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        onChanged: (value) => _email = value,
                        validator: (value) =>
                        value!.isEmpty ? 'Enter your Email' : null,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.greenAccent),
                                borderRadius: BorderRadius.circular(25)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.greenAccent),
                                borderRadius: BorderRadius.circular(25)
                            ),
                            labelText: "Email",
                            labelStyle: TextStyle(color: Colors.black45),
                            prefixIcon: Icon(Icons.email,color: Colors.black,)),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        onChanged: (value) => _password = value,
                        validator: (value) =>
                        value!.length < 6 ? 'Enter more than 6 character' : null,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.greenAccent),
                                borderRadius: BorderRadius.circular(25)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.greenAccent),
                                borderRadius: BorderRadius.circular(25)
                            ),
                            labelText: "New password",
                            labelStyle: TextStyle(color: Colors.black45),
                            prefixIcon: Icon(Icons.vpn_key,color: Colors.black,),
                            suffixIcon: GestureDetector(onTap: (){
                              setState(() {
                                _obscureText=!_obscureText;
                              });
                            },child: Icon(_obscureText?Icons.visibility:Icons.visibility_off,color: Colors.black,),)
                        ),
                        obscureText: _obscureText,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: RaisedButton(
                          onPressed: ()async {
                            setState(() {
                              loading=true;
                            });
                            Future.delayed(Duration(seconds: 4),(){
                              setState(() {
                                loading=false;
                              });
                            });
                            if(_formKeys.currentState!.validate()){
                              print("Registeration Sucessfully");

                                  }
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          child:loading?CircularProgressIndicator(): Text(
                            "Register",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          color: Colors.greenAccent,
                        ),

                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have account ?",style: TextStyle(color: Colors.black54),),
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: FlatButton(onPressed: (){
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) => login()));
                          }, child:Text("Login")),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),

          ],

        ),
      ),
    );
  }
}
