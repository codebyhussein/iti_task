import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.labelText,
      required this.validateText,
      required this.nameofController,
      required this.keyBoredType,
      required this.prefixIcon,
      @required this.suffixIcon,
      required this.isvisble});
  String hintText;
  String labelText;
  String validateText;
  TextEditingController nameofController;
  TextInputType keyBoredType;
  Widget prefixIcon;
  Widget? suffixIcon;
  bool isvisble = false;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  // Widget suffixIcon() => IconButton(
  //       icon: isvesible
  //           ? const Icon(
  //               Icons.remove_red_eye,
  //               color: Colors.blueGrey,
  //             )
  //           : const Icon(
  //               Icons.remove_red_eye_outlined,
  //               color: Colors.blueGrey,
  //             ),
  //       onPressed: () {
  //         setState(() {
  //           isvesible = !isvesible;
  //         });
  //       },
  //     );
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.nameofController,
      keyboardType: widget.keyBoredType,
      obscureText: widget.isvisble,
      decoration: InputDecoration(
        prefixIconColor: Colors.blueGrey,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        hintText: widget.hintText,
        labelText: widget.labelText,
        hintStyle: const TextStyle(color: Colors.blueGrey),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return widget.validateText;
        } else {
          return null;
        }
      },
    );
  }
}
