import 'package:filmgeek/model/movie_model.dart';
import 'package:filmgeek/utils/colors.dart';
import 'package:filmgeek/widgets/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, required this.movieList});
  List<Movie> movieList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                          height: MediaQuery.sizeOf(context).height / 2.5,
                          color: Colors.amberAccent));
                },
                icon: const Icon(
                  Icons.info_outline_rounded,
                  size: 25,
                ),
                color: blue)
          ],
          backgroundColor: white,
          title: Text('FilmGeek',
              style: GoogleFonts.outfit(
                  color: blue, fontSize: 23, fontWeight: FontWeight.w600))),
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
