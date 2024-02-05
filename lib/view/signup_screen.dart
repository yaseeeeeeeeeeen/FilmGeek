import 'package:filmgeek/utils/image_urls.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Container(
        height: media.height,
        width: media.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImagePaths.loginBackground),
                fit: BoxFit.cover)),
      ),
    );
  }
}
