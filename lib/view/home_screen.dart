import 'package:filmgeek/model/movie_model.dart';
import 'package:filmgeek/utils/colors.dart';
import 'package:filmgeek/utils/font_styles.dart';
import 'package:filmgeek/widgets/movie_card.dart';
import 'package:filmgeek/widgets/rich_text.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, required this.movieList});
  List<Movie> movieList;
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                            height: media.height / 4,
                            width: media.width,
                            padding: const EdgeInsets.all(15),
                            color: white,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Company Info",
                                    style: FontStyles.appbarTitle,
                                  ),
                                  AboutRichText(
                                      textOne: "Company",
                                      textTwo:
                                          "Geeksynergy Technologies Pvt Ltd"),
                                  AboutRichText(
                                      textOne: "Address",
                                      textTwo: "Sanjayanagar, Bengaluru-56"),
                                  AboutRichText(
                                      textOne: "Phone", textTwo: "8848917803"),
                                  AboutRichText(
                                      textOne: "Email",
                                      textTwo:
                                          "geeksynergytechnolagies@gmail.com")
                                ]),
                          ));
                },
                icon: const Icon(
                  Icons.info_outline_rounded,
                  size: 25,
                ),
                color: blue)
          ],
          backgroundColor: white,
          title: Text('FilmGeek', style: FontStyles.appbarTitle)),
      backgroundColor: scaffold,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return MovieCard(movie: movieList[index]);
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: movieList.length),
        ),
      ),
    );
  }
}
