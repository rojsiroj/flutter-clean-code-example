import 'package:flix_id/domain/entities/movie.dart';
import 'package:flix_id/presentation/widgets/network_image_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

List<Widget> movieList({
  required String title,
  void Function(Movie movie)? onTap,
  required AsyncValue<List<Movie>> movies,
}) =>
    [
      Padding(
        padding: const EdgeInsets.only(left: 24, bottom: 15),
        child: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      SizedBox(
        height: 228,
        child: movies.when(
            data: (data) => SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: data
                        .map(
                          (movie) => Padding(
                            padding: EdgeInsets.only(
                              left: movie == data.first ? 24 : 10,
                              right: movie == data.last ? 24 : 0,
                            ),
                            child: NetworkImageCard(
                              imageUrl:
                                  'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                              fit: BoxFit.contain,
                              onTap: () => onTap?.call(movie),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
            error: (error, stackTrace) => SizedBox(),
            loading: () => Center(
                  child: CircularProgressIndicator(),
                )),
      )
    ];
