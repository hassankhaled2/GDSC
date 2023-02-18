import 'package:flutter/material.dart';

Widget defaultButton(
    {double width = double.infinity,
      bool isUpperCase = true,
      double radius = 25,
      Color background = Colors.green,
      required Function function,
      required String text}) =>
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: width,
        height: 40.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            radius,
          ),
          color: background,
        ),
        child: MaterialButton(
          onPressed: () {
            function();
          },
          child: Text(
            isUpperCase ? text.toUpperCase() : text,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
Widget defaultFormField(
    {TextEditingController? controller,
      required TextInputType type,
      Function(String)? onSubmit,
      Function(String)? onChanged,
      GestureTapCallback? onTap,
      bool isPassword = false,
      required String? Function(String?)? validate,
      String? label,
      IconData? prefix,
      IconData? suffix,
      final VoidCallback? suffixPressed,
      bool? obscureText}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: onSubmit,
      onChanged: onChanged,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(
            prefix,
          ),
          suffixIcon: suffix != null
              ? IconButton(
            onPressed: suffixPressed,
            icon: Icon(suffix),
          )
              : null,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Colors.black

            ),
            borderRadius: BorderRadius.circular(25),
          ),
          enabledBorder:OutlineInputBorder(
            borderSide: const BorderSide(
                color: Colors.green

            ),
            borderRadius: BorderRadius.circular(25),
          )
      ),
    );