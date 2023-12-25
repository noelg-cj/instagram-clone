import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 32.0,
          ),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/ic_instagram.svg",
                colorFilter: const ColorFilter.mode(
                  primaryColor,
                  BlendMode.srcATop,
                ),
                height: 64,
              ),

              const SizedBox(height: 64,),
              TextFieldInput(
                textEditingController: _emailController,
                hintText: "Email",
                textInputType: TextInputType.emailAddress
              ),
              const SizedBox(height: 24,),
              TextFieldInput(
                textEditingController: _passwordController,
                hintText: "Password",
                textInputType: TextInputType.text,
                isPass: true,
              ),
              const SizedBox(height: 24,),
              Container(
                child: const Text("Log In"),
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                ),
                decoration: const ShapeDecoration(shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4))
                  ), 
                  color: blueColor
                ),
              )
            ],
          )
        )
      ),
    );
  }
}