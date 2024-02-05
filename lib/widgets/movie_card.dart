import 'package:filmgeek/model/movie_model.dart';
import 'package:filmgeek/utils/colors.dart';
import 'package:filmgeek/utils/font_styles.dart';
import 'package:filmgeek/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieCard extends StatelessWidget {
  MovieCard({super.key, required this.movie});
  Movie movie;
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context);
    return Container(
      padding: const EdgeInsets.all(5),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), color: white),
      height: media.height / 4.7,
      child: ListView(
        shrinkWrap: true,
        children: [
          Row(children: [
            SizedBox(
              width: media.width / 8,
              height: media.height / 7,
              child: Column(
                children: [
                  const Icon(Icons.arrow_drop_up_sharp, size: 35),
                  Text(movie.totalVoted.toString()),
                  const Icon(Icons.arrow_drop_down, size: 35),
                  const Text(
                    "Votes",
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 10, left: 5),
              width: media.width / 5,
              height: media.height / 7,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(movie.poster), fit: BoxFit.cover)),
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  movie.title,
                  style: FontStyles.movieName,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "Gener : ${movie.genre.toUpperCase()}",
                  overflow: TextOverflow.ellipsis,
                  style: FontStyles.subTitles,
                ),
                Text(
                    overflow: TextOverflow.ellipsis,
                    style: FontStyles.subTitles,
                    "Direction : ${movie.director.join()}"),
                Text(
                    overflow: TextOverflow.ellipsis,
                    style: FontStyles.subTitles,
                    "Starring : ${movie.stars.join()}"),
                Text(
                    overflow: TextOverflow.ellipsis,
                    style: FontStyles.subTitles,
                    "${movie.runTime ?? 129} Mins | ${movie.language} | 1 APR"),
                Text(
                    overflow: TextOverflow.ellipsis,
                    style: FontStyles.subTitlesblue,
                    "${movie.pageViews} views | Voted by ${movie.voting} People")
              ],
            ))
          ]),
          ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(customSnackbar(
                    context, true, "This Feature Avalible Soon...!"));
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  backgroundColor: blue,
                  fixedSize: Size(media.width, 40)),
              child: Text(
                "Watch Trailer",
                style: GoogleFonts.lato(color: white),
              ))
        ],
      ),
    );
  }
}
