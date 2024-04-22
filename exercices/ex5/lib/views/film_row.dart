import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/film.dart';
class FilmRow extends StatelessWidget {
  final Film film;
  const FilmRow({super.key, required this.film});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 200.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              film.image,
              width: 240.0,
              height: 320.0,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      film.release_date,
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Divider(),
                    Text(
                      film.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Divider(),
                    Text(
                      '${film.rt_score} %',
                      style: TextStyle(
                        color: film.rt_score >= 50 ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    Divider(),
                    Text(
                      '${film.running_time} minutes',
                    ),
                    Divider(),
                    Text(
                      'Directed by ${film.director}',
                    ),
                    Divider(),
                    SizedBox(height: 8.0),
                    Text(
                      film.description,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    SizedBox(height: 8.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}