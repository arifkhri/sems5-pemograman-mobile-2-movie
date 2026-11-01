import 'package:flutter/material.dart';
import 'package:movie_app/pages/favorite_page.dart';
import 'package:movie_app/pages/genre_page.dart';
import 'package:movie_app/pages/home_page.dart';

// halaman utama + bottom nav
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  // list page sesuai urutan bottom nav
  final List<Widget> pages = const [HomePage(), GenrePage(), FavoritePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: pages[selectedIndex],
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Colors.grey[900],
      //   currentIndex: selectedIndex,
      //   selectedItemColor: Colors.white,
      //   unselectedItemColor: Colors.white54,
      //   onTap: (index) {
      //     setState(() {
      //       selectedIndex = index;
      //     });
      //   },
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     BottomNavigationBarItem(icon: Icon(Icons.album), label: 'Genre'),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.favorite_border),
      //       label: 'Favorite',
      //     ),
      //   ],
      // ),
    );
  }
}
