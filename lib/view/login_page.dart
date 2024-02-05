import 'package:filmgeek/utils/colors.dart';
import 'package:filmgeek/utils/image_urls.dart';
import 'package:filmgeek/utils/validation.dart';
import 'package:filmgeek/view/signup_screen.dart';
import 'package:filmgeek/widgets/textfield_custom.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: media.height / 3),
                CustomTextfiled(
                  validator: (p0) => Validations().emailValidation(p0),
                    controller: emailController, text: "Email"),
                const SizedBox(height: 10),
                CustomTextfiled(
                  validator: (p0) => Validations().passwordValidations(p0),
                    controller: passwordController, text: "Password"),
                const SizedBox(height: 10),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: mainTheme,
                        fixedSize: Size(media.width, 50)),
                    onPressed: () {},
                    child:
                        Text("LOGIN", style: GoogleFonts.outfit(color: white))),
                SizedBox(height: media.height / 3.8),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>  SignupScreen())),
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
    ));
  }
}
