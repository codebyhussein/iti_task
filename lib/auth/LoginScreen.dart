import 'package:courses/widgets/CustomAppBar.dart';
import 'package:courses/widgets/CustomTextFormField.dart';
import 'package:flutter/material.dart';

import '../API/dio/dio_provider.dart';

//  import 'buttons/lib/src/custom_button.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isvesible = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          CustomAppBar(
            height: 90,
            title: 'Login Page',
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  const Text(
                    'Login',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.blueGrey),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomTextFormField(
                    isvisble: false,
                    nameofController: emailController,
                    hintText: 'email',
                    labelText: 'email',
                    validateText: 'email is required',
                    keyBoredType: TextInputType.emailAddress,
                    prefixIcon: const Icon(Icons.alternate_email_outlined),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    isvisble: isvesible,
                    nameofController: passwordController,
                    hintText: 'password',
                    labelText: 'password',
                    validateText: 'password is required',
                    keyBoredType: TextInputType.visiblePassword,
                    prefixIcon: const Icon(
                      Icons.lock_open_outlined,
                      color: Colors.blueGrey,
                    ),
                    suffixIcon: IconButton(
                      icon: isvesible
                          ? const Icon(
                              Icons.remove_red_eye,
                              color: Colors.blueGrey,
                            )
                          : const Icon(
                              Icons.remove_red_eye_outlined,
                              color: Colors.blueGrey,
                            ),
                      onPressed: () {
                        setState(() {
                          isvesible = !isvesible;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Center(
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.blueGrey,
                        ),
                        child: MaterialButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                await ApiServies().loginUser(
                                    email: emailController.text,
                                    password: passwordController.text);
                              }
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: Row(
                      children: [
                        const Text("Don't have an account ?"),
                        const SizedBox(
                          width: 10,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Register Now",
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
