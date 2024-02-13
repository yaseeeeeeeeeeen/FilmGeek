// import 'package:filmgeek/model/user_model.dart';
// import 'package:filmgeek/repository/movie_repository.dart';
// import 'package:filmgeek/sevices/services.dart';
// import 'package:filmgeek/utils/colors.dart';
// import 'package:filmgeek/utils/image_urls.dart';
// import 'package:filmgeek/utils/validation.dart';
// import 'package:filmgeek/view/home_screen.dart';
// import 'package:filmgeek/view/login_page.dart';
// import 'package:filmgeek/widgets/app_title.dart';
// import 'package:filmgeek/widgets/button_and_textfield/custom_button.dart';
// import 'package:filmgeek/widgets/drop_down.dart';
// import 'package:filmgeek/widgets/snack_bar.dart';
// import 'package:filmgeek/widgets/button_and_textfield/textfield_custom.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// // ignore: must_be_immutable
// class SignupScreen extends StatelessWidget {
//   SignupScreen({super.key});
//   TextEditingController usernameController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();
//   TextEditingController proffiessionController = TextEditingController();
//   final GlobalKey<FormState> signupKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     final media = MediaQuery.sizeOf(context);
//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           height: media.height,
//           width: media.width,
//           decoration: const BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage(ImagePaths.loginBackground),
//                   fit: BoxFit.cover)),
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(15),
//               child: Form(
//                 key: signupKey,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     SizedBox(height: media.height / 12),
//                     const AppNameCard(),
//                     CustomTextfiled(
//                         validator: (p0) => Validations().nameValidation(p0),
//                         controller: usernameController,
//                         text: "Username"),
//                     const SizedBox(height: 10),
//                     CustomTextfiled(
//                       controller: emailController,
//                       text: "Email",
//                       validator: (p0) => Validations().emailValidation(p0),
//                     ),
//                     DropdownDemo(professionController: proffiessionController),
//                     CustomTextfiled(
//                         keyboardType: TextInputType.number,
//                         controller: phoneController,
//                         text: "Phone",
//                         validator: (p0) =>
//                             Validations().phoneNumberValidate(p0)),
//                     const SizedBox(height: 10),
//                     CustomTextfiled(
//                         controller: passwordController,
//                         text: "Password",
//                         obsecure: true,
//                         validator: (p0) =>
//                             Validations().passwordValidations(p0)),
//                     const SizedBox(height: 10),
//                     CustomButton(
//                         onPressed: () => signupClicked(context),
//                         title: "SIGN-UP"),
//                     SizedBox(height: media.height / 7),
//                     GestureDetector(
//                       onTap: () => Navigator.of(context).push(
//                           MaterialPageRoute(builder: (context) => LoginPage())),
//                       child: RichText(
//                         text: TextSpan(
//                           children: <TextSpan>[
//                             TextSpan(
//                                 text: 'Have an account? ',
//                                 style: GoogleFonts.outfit(
//                                     color: black.withOpacity(0.5),
//                                     fontSize: 15)),
//                             TextSpan(
//                                 text: 'Login',
//                                 style: GoogleFonts.outfit(
//                                     color: mainTheme,
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w600))
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   signupClicked(context) async {
//     if (signupKey.currentState!.validate()) {
//       bool isAvailable = await DatabaseHelper.instance
//           .checkEmailAvailability(emailController.text);
//       if (isAvailable) {
//         User user = User(
//             userName: usernameController.text,
//             email: emailController.text,
//             password: passwordController.text,
//             phoneNumber: phoneController.text,
//             profession: proffiessionController.text,
//             isLoggedIn: 1);
//         bool isAdded = await DatabaseHelper.instance.addUserDetails(user);
//         if (isAdded) {
//           final eitherResponse = await MovieRepository().getMovies();
//           eitherResponse.fold((left) {
//             ScaffoldMessenger.of(context)
//                 .showSnackBar(customSnackbar(context, false, left.message));
//           }, (right) {
//             Navigator.of(context).pushAndRemoveUntil(
//                 MaterialPageRoute(
//                   builder: (context) => HomeScreen(movieList: right),
//                 ),
//                 (route) => false);
//           });
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(customSnackbar(
//               context, false, "Something Went Wrong, Try Again"));
//         }
//       }
//     } else {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(customSnackbar(context, false, "Fill all Datas"));
//     }
//   }
// }
