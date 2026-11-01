import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

// class sederhana buat data film
class Movie {
  String title;
  String year;
  String genre;
  String description;
  String imageUrl;

  Movie(this.title, this.year, this.genre, this.description, this.imageUrl);
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // data now playing (hardcode dulu)
  List<Movie> nowPlaying = [
    Movie(
      'Deadpool & Wolverine',
      '2024',
      'Action',
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      'https://image.tmdb.org/t/p/w500/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg',
    ),
    Movie(
      'Despicable Me 4',
      '2024',
      'Animation',
      'Gru and the minions face a new villain in this funny adventure.',
      'https://image.tmdb.org/t/p/w500/wWba3TaojhK7NdycRhoQpsG0BHL.jpg',
    ),
    Movie(
      'A Quiet Place: Day One',
      '2024',
      'Horror',
      'Survive the first day when alien creatures invade New York City.',
      'https://image.tmdb.org/t/p/w500/yrZYu2U0tYc5UxRU5gcW5MPmX0U.jpg',
    ),
  ];

  // list horizontal seperti RecyclerView di Android
  List<Movie> trending = [
    Movie(
      'Bad Boys: Ride or Die',
      '2024',
      'Action',
      '',
      'https://image.tmdb.org/t/p/w500/oGythE98MDcDOzU2gMzQaxxCqdx.jpg',
    ),
    Movie(
      'Despicable Me 4',
      '2024',
      'Animation',
      '',
      'https://image.tmdb.org/t/p/w500/wWba3TaojhK7NdycRhoQpsG0BHL.jpg',
    ),
    Movie(
      'A Quiet Place: Day One',
      '2024',
      'Horror',
      '',
      'https://image.tmdb.org/t/p/w500/yrZYu2U0tYc5UxRU5gcW5MPmX0U.jpg',
    ),
    Movie(
      'Deadpool & Wolverine',
      '2024',
      'Action',
      '',
      'https://image.tmdb.org/t/p/w500/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg',
    ),
  ];

  List<Movie> popular = [
    Movie(
      'The Brothers Sun',
      '2024',
      'Action',
      '',
      'https://image.tmdb.org/t/p/w500/eXJD46Ozt3J0Lx7m6vQ0qGqBqYd.jpg',
    ),
    Movie(
      'Fallout',
      '2024',
      'Sci-Fi',
      '',
      'https://image.tmdb.org/t/p/w500/Ad9Z3AgX14uyvkRnu98BnbJLb9C.jpg',
    ),
    Movie(
      'True Detective: Night Country',
      '2024',
      'Crime',
      '',
      'https://image.tmdb.org/t/p/w500/9xNOucjK9R5PIlxqmh7TFO9OXJ.jpg',
    ),
    Movie(
      'Despicable Me 4',
      '2024',
      'Animation',
      '',
      'https://image.tmdb.org/t/p/w500/wWba3TaojhK7NdycRhoQpsG0BHL.jpg',
    ),
  ];

  List<Movie> topRated = [
    Movie(
      'Society of the Snow',
      '2023',
      'Drama',
      '',
      'https://image.tmdb.org/t/p/w500/2e853FDVSIso600RqGMelDaYkfD.jpg',
    ),
    Movie(
      'Anatomy of a Fall',
      '2023',
      'Thriller',
      '',
      'https://image.tmdb.org/t/p/w500/kQkjrGRdUjzPsjKm4Lq9Y5pS1y.jpg',
    ),
    Movie(
      'Perfect Days',
      '2023',
      'Drama',
      '',
      'https://image.tmdb.org/t/p/w500/rBaFsiqG9lQeK0mJ6q9Y5pS1y.jpg',
    ),
    Movie(
      'Deadpool & Wolverine',
      '2024',
      'Action',
      '',
      'https://image.tmdb.org/t/p/w500/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // konten home saja — bottom nav ada di MainPage
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // bagian now playing
            const SizedBox(height: 16),
            const Center(
              child: Text(
                'Now Playing',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // carousel slider
            CarouselSlider(
              options: CarouselOptions(
                height: 420,
                enlargeCenterPage: true,
                autoPlay: false,
                viewportFraction: 0.75,
              ),
              items: nowPlaying.map((movie) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.network(
                              movie.imageUrl,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey[800],
                                  child: const Icon(
                                    Icons.movie,
                                    size: 80,
                                    color: Colors.white54,
                                  ),
                                );
                              },
                            ),
                            // gradient biar teks kebaca
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withOpacity(0.85),
                                  ],
                                ),
                              ),
                            ),
                            // info film di bawah poster
                            Positioned(
                              left: 16,
                              right: 16,
                              bottom: 20,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    movie.title,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '${movie.year} · ${movie.genre}',
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    movie.description,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors.white60,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // tombol next di kanan
                            Positioned(
                              right: 12,
                              bottom: 80,
                              child: Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.25),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.chevron_right,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),

            const SizedBox(height: 24),

            // section Trending
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Trending',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'More',
                    style: TextStyle(color: Colors.white54, fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 160,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: trending.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 110,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        trending[index].imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[800],
                            child: const Icon(
                              Icons.broken_image,
                              color: Colors.white54,
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // section Popular
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Popular',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'More',
                    style: TextStyle(color: Colors.white54, fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 160,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: popular.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 110,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        popular[index].imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[800],
                            child: const Icon(
                              Icons.broken_image,
                              color: Colors.white54,
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // section Top Rated
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Top Rated',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'More',
                    style: TextStyle(color: Colors.white54, fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 160,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: topRated.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 110,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        topRated[index].imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[800],
                            child: const Icon(
                              Icons.broken_image,
                              color: Colors.white54,
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
