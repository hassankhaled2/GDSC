// import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/components.dart';
import '../login/login.dart';



class RegisterScreen extends StatefulWidget
{
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var NameController = TextEditingController();
  var SecondController = TextEditingController();
  var ConfirmPasswordController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  bool isPassword=false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    child: Image(image: AssetImage('images/image.png',
                    ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Sign UP',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defaultFormField(
                      label: "First Name",
                      prefix: Icons.person,
                      controller:NameController,
                      type:TextInputType.text,
                      validate:(value)
                      {
                        if(value!.isEmpty)
                        {
                          return ' First Name must no be empty';
                        }
                        return null;
                      }
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  defaultFormField(
                      label: "Second Name",
                      prefix: Icons.person,
                      controller:NameController,
                      type:TextInputType.text,
                      validate:(value)
                      {
                        if(value!.isEmpty)
                        {
                          return ' First Name must no be empty';
                        }
                        return null;
                      }
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  defaultFormField(

                      label: "Email",
                      controller:emailController,
                      prefix: Icons.email,
                      type:TextInputType.emailAddress,
                      validate:(value)
                      {
                        if(value!.isEmpty)
                        {
                          return 'email must not be empty';
                        }
                        return null;
                      }
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  defaultFormField(
                      label: "Password",
                      controller:passwordController,
                      prefix: Icons.lock,
                      obscureText: !isPassword,
                      suffix: isPassword?Icons.visibility:Icons.visibility_off,
                      isPassword: isPassword,
                      suffixPressed: ()
                      {
                        setState(() {
                          isPassword=!isPassword;
                        });
                      },
                      type:TextInputType.visiblePassword,
                      validate:(value)
                      {
                        if(value!.isEmpty)
                        {
                          return 'password is too short';
                        }
                        return null;
                      }
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultButton(
                    function: () {
                      if (formkey.currentState?.validate() != null) {
                        print(emailController.text);
                        print(passwordController.text);
                      }
                    },
                    text: "Create Account",

                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'have an account?',
                      ),
                      TextButton(
                        onPressed: ()
                        {
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context)=>LoginScreen(),
                              ));
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.green
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
