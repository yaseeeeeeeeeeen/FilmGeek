import 'package:filmgeek/sevices/services.dart';
import 'package:filmgeek/utils/colors.dart';
import 'package:filmgeek/utils/image_urls.dart';
import 'package:filmgeek/utils/validation.dart';
import 'package:filmgeek/view/home_screen.dart';
import 'package:filmgeek/view/signup_screen.dart';
import 'package:filmgeek/widgets/app_title.dart';
import 'package:filmgeek/widgets/button_and_textfield/custom_button.dart';
import 'package:filmgeek/widgets/button_and_textfield/textfield_custom.dart';
import 'package:filmgeek/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context);
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: media.height,
        width: media.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImagePaths.loginBackground),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Form(
              key: loginKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: media.height / 4),
                  const AppNameCard(),
                  CustomTextfiled(
                      validator: (p0) => Validations().emailValidation(p0),
                      controller: emailController,
                      text: "Email"),
                  const SizedBox(height: 10),
                  CustomTextfiled(
                      validator: (p0) => Validations().passwordValidations(p0),
                      controller: passwordController,
                      text: "Password"),
                  const SizedBox(height: 10),
                  CustomButton(onPressed: () {}, title: "LOGIN"),
                  SizedBox(height: media.height / 3.8),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SignupScreen())),
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Not a member? ',
                              style: GoogleFonts.outfit(
                                  color: black.withOpacity(0.5), fontSize: 15)),
                          TextSpan(
                              text: 'Sign-Up',
                              style: GoogleFonts.outfit(
                                  color: mainTheme,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }

  loginClicked(context) async {
    if (loginKey.currentState!.validate()) {
      bool isVerified = await DatabaseHelper.instance
          .login(emailController.text, passwordController.text);
      if (isVerified) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
            (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            customSnackbar(context, false, "Email or Password is Incorrect"));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          customSnackbar(context, false, "Email or Password is Incorrect"));
    }
  }
}
