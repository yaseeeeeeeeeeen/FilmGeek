import 'package:filmgeek/utils/colors.dart';
import 'package:filmgeek/utils/image_urls.dart';
import 'package:filmgeek/utils/validation.dart';
import 'package:filmgeek/view/login_page.dart';
import 'package:filmgeek/widgets/drop_down.dart';
import 'package:filmgeek/widgets/snack_bar.dart';
import 'package:filmgeek/widgets/textfield_custom.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController proffiessionController = TextEditingController();
  final GlobalKey<FormState> signupKey = GlobalKey<FormState>();
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
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Form(
                key: signupKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: media.height / 12),
                    SizedBox(
                      height: media.height / 13,
                      width: media.width,
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Welcome to ',
                                  style: GoogleFonts.outfit(
                                      color: black.withOpacity(0.9),
                                      fontSize: 20)),
                              TextSpan(
                                  text: 'FilmGeek',
                                  style: GoogleFonts.outfit(
                                      color: mainTheme,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600))
                            ],
                          ),
                        ),
                      ),
                    ),
                    CustomTextfiled(
                        validator: (p0) => Validations().nameValidation(p0),
                        controller: usernameController,
                        text: "Username"),
                    const SizedBox(height: 10),
                    CustomTextfiled(
                      controller: emailController,
                      text: "Email",
                      validator: (p0) => Validations().emailValidation(p0),
                    ),
                    DropdownDemo(professionController: proffiessionController),
                    CustomTextfiled(
                        controller: phoneController,
                        text: "Phone",
                        validator: (p0) =>
                            Validations().phoneNumberValidate(p0)),
                    const SizedBox(height: 10),
                    CustomTextfiled(
                        controller: passwordController,
                        text: "Password",
                        validator: (p0) =>
                            Validations().passwordValidations(p0)),
                    const SizedBox(height: 10),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: mainTheme,
                            fixedSize: Size(media.width, 50)),
                        onPressed: () {
                          signupClicked(context);
                        },
                        child: Text("SIGN-UP",
                            style: GoogleFonts.outfit(color: white))),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => LoginPage())),
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Have an account? ',
                                style: GoogleFonts.outfit(
                                    color: black.withOpacity(0.5),
                                    fontSize: 15)),
                            TextSpan(
                                text: 'Login',
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
      ),
    );
  }

  signupClicked(context) async {
    if (signupKey.currentState!.validate()) {
      
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(customSnackbar(context, false, "Fill all Datas"));
    }
  }
}
