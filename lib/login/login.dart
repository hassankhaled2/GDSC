// import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/components.dart';
import '../register_screen/register_screen.dart';



class LoginScreen extends StatefulWidget
{
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
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
                    'Welcome back',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
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
                    height: 15.0,
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
                    text: "Login",

                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                      ),
                      TextButton(
                        onPressed: ()
                        {
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context)=>RegisterScreen()
                              ));
                        },
                        child: Text(
                          'Register Now',
                          style: TextStyle(color: Colors.green),

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
