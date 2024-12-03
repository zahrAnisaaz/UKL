import 'package:flutter/material.dart';

void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Homescreen(),
    );
  }
}

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _currentIndex = 0; // Tracks the active tab

  final List<Widget> _pages = [
    HomePage(),      // Home
    MoviesPage(),    // Movies
    TicketScreen(),   // Tickets
    TicketsListPage() // My Tickets
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TIX ID', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications, color: Colors.black),
          ),
        ],
      ),
      body: _pages[_currentIndex], // Display the active page based on the index
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_movies),
            label: "Movies",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_number),
            label: 'Tickets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'My Tickets',
          ),
        ],
        selectedItemColor: const Color(0xFF09303F), // Dark Blue color
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the active tab index
          });
        },
      ),
    );
  }
}

// Home Page
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Jakarta",
                prefixIcon: const Icon(Icons.location_on, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Banner Slider (Example)
          SizedBox(
            height: 150,
            child: PageView(
              children: [
                _buildBanner('assets/slider1.jpg'),
                _buildBanner('assets/slider2.webp'),
                _buildBanner('assets/slider3.jpg'),
                _buildBanner('assets/slider5.jpg'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Now Playing Movies Section
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Now Playing",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildMovieCard('assets/film1.jpg', 'Kuasa Gelap'),
                _buildMovieCard('assets/film 4.jpg', 'Joker'),
                _buildMovieCard('assets/film2.jpg', 'Harry Potter'),
                _buildMovieCard('assets/film 9.jpg', 'Sekawan Limo'),
                _buildMovieCard('assets/film3.jpg', 'Spiderman'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Spotlight Section
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Spotlight",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildSpotlightItem(
                  'assets/gambar1.jpg',
                  "TIX ID Box Office (11-17 November)",
                  "Film terlaris di bioskop Indonesia",
                  57,
                  0,
                ),
                _buildSpotlightItem(
                  'assets/gambar2.jpg',
                  "Film Marvel Terbaru",
                  "Tayang di bioskop minggu ini",
                  120,
                  5,
                ),
                _buildSpotlightItem(
                  'assets/gambar 3.jpg',
                  "Marvel's Latest Hits",
                  "Hot releases this week",
                  150,
                  10,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // TIX Now Section
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "TIX Now",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildTixNowCard("assets/tix5.jpg", "Spider-Man: No Way Home", "Action, Adventure"),
                _buildTixNowCard("assets/tix12.jpg", "Encanto", "Animation, Comedy"),
                _buildTixNowCard("assets/tixnow3.jpg", "Dune", "Sci-Fi, Adventure"),
                _buildTixNowCard("assets/tixnow4.jpg", "No Time To Die", "Action, Thriller"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Banner Widget
  Widget _buildBanner(String imagePath) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // Movie Card Widget
  Widget _buildMovieCard(String imagePath, String title) {
    return Container(
      width: 150,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              height: 200,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // Spotlight Item Widget
  Widget _buildSpotlightItem(
    String imagePath,
    String title,
    String subtitle,
    int views,
    int likes,
  ) {
    return Container(
      width: 250,
      margin: const EdgeInsets.only(right: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.remove_red_eye, size: 16, color: Colors.grey),
                    const SizedBox(width: 5),
                    Text("$views"),
                    const SizedBox(width: 10),
                    Icon(Icons.thumb_up, size: 16, color: Colors.grey),
                    const SizedBox(width: 5),
                    Text("$likes"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // TIX Now Card Widget
  Widget _buildTixNowCard(String imagePath, String title, String subtitle) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 14, color: Colors.white),
            ),
            const SizedBox(height: 5),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 12, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
//Halaman Film
  class MoviesPage extends StatelessWidget {
  final List<String> cinemas = [
    "AEON MALL JGC CGV",
    "AEON MALL TANJUNG BARAT XXI",
    "AGORA MALL IMAX",
    "AGORA MALL PREMIERE",
    "AGORA MALL XXI",
    "ARION XXI",
    "ARTHA GADING XXI",
    "BASSURA XXI",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pilih Bioskop"),
        backgroundColor: Color.fromARGB(255, 20, 12, 74),
      ),
      body: ListView.builder(
        itemCount: cinemas.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.movie),
            title: Text(cinemas[index]),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Tambahkan navigasi atau aksi di sini
              print('Anda memilih ${cinemas[index]}');
            },
          );
        },
      ),
    );
  }
}
// Halaman Tiket
class TicketScreen extends StatefulWidget {
  @override
  _TicketScreenState createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  final List<Map<String, dynamic>> films = [
    {
      "title": "BILA ESOK IBU TIADA",
      "genre": "Drama, Keluarga",
      "rating": 9.2,
      "image": "assets/movie1.jpg", // Ganti dengan path gambar Anda
    },
    {
      "title": "SANTET SEGORO PITU",
      "genre": "Horror",
      "rating": 9.0,
      "image": "assets/movie2.jpg", // Ganti dengan path gambar Anda
    },
    {
      "title": "GLADIATOR II",
      "genre": "Action, Adventure",
      "rating": 9.5,
      "image": "assets/movie3.jpeg", // Ganti dengan path gambar Anda
    },
    {
      "title": "RED ONE",
      "genre": "Action, Adventure",
      "rating": 9.3,
      "image": "assets/movie 4.png", // Ganti dengan path gambar Anda
    },
  ];

  List<String> favoriteFilms = [];

  void toggleFavorite(String title) {
    setState(() {
      if (favoriteFilms.contains(title)) {
        favoriteFilms.remove(title);
      } else {
        favoriteFilms.add(title);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Film Bioskop"),
          bottom: TabBar(
            tabs: [
              Tab(text: "SEDANG TAYANG"),
              Tab(text: "AKAN DATANG"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildFilmGrid(),
            Center(child: Text("Halaman Akan Datang (Coming Soon)")),
          ],
        ),
      ),
    );
  }

  Widget buildFilmGrid() {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 kolom
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemCount: films.length,
      itemBuilder: (context, index) {
        final film = films[index];
        final isFavorite = favoriteFilms.contains(film['title']);

        return Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                    child: Image.asset(
                      film['image'],
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.white,
                      ),
                      onPressed: () => toggleFavorite(film['title']),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  film['title'],
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  film['genre'],
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 18),
                    SizedBox(width: 4),
                    Text(
                      film['rating'].toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
class TicketsListPage extends StatelessWidget {
  const TicketsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Menghapus ikon default back
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Film Card 1
            MovieCard(
              movieTitle: "GLADIATOR 2",
              genre: "Action, Adventure",
              ageRating: "D 18+",
              rating: "9.5",
              imageUrl: "assets/movie3.jpeg", // Ganti dengan gambar yang valid
            ),
            const SizedBox(height: 16),
            // Film Card 2
            MovieCard(
              movieTitle: "RED ONE",
              genre: "Action, Adventure",
              ageRating: "R 13+",
              rating: "9.3",
              imageUrl: "assets/movie4.png", // Ganti dengan gambar yang valid
            ),
          ],
        ),
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  final String movieTitle;
  final String genre;
  final String ageRating;
  final String rating;
  final String imageUrl;

  const MovieCard({
    required this.movieTitle,
    required this.genre,
    required this.ageRating,
    required this.rating,
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            // Movie Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imageUrl,
                height: 100,
                width: 75,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            // Movie Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movieTitle,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    genre,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Age Rating: $ageRating',
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 16, color: Colors.yellow),
                      const SizedBox(width: 5),
                      Text(
                        rating,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const HomeScreen());
// }

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: const Homescreen(),
//     );
//   }
// }

// class Homescreen extends StatefulWidget {
//   const Homescreen({super.key});

//   @override
//   State<Homescreen> createState() => _HomescreenState();
// }

// class _HomescreenState extends State<Homescreen> {
//   int _currentIndex = 0; // Tracks the active tab

//   final List<Widget> _pages = [
//           HomePage(),      // Home
//           MoviesPage(),    // Movies
//           TicketScreen(),   // Tickets
//           TicketsListPage()// My Tickets
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('TIX ID', style: TextStyle(color: Colors.black)),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         centerTitle: true,
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(Icons.notifications, color: Colors.black),
//           ),
//         ],
//       ),
//       body: _pages[_currentIndex], // Display the active page based on the index
//       bottomNavigationBar: BottomNavigationBar(
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: "Home",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.local_movies),
//             label: "Movies",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.confirmation_number),
//             label: 'Tickets',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.receipt_long),
//             label: 'My Tickets',
//           ),
//         ],
//         selectedItemColor: const Color(0xFF09303F), // Dark Blue color
//         unselectedItemColor: Colors.grey,
//         currentIndex: _currentIndex,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index; // Update the active tab index
//           });
//         },
//       ),
//     );
//   }
// }

// // Home Page
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: "Jakarta",
//                 prefixIcon: const Icon(Icons.location_on, color: Colors.grey),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 10),
//           // Banner Slider (Example)
//           SizedBox(
//             height: 150,
//             child: PageView(
//               children: [
//                 _buildBanner('assets/slider1.jpg'),
//                 _buildBanner('assets/slider2.webp'),
//                 _buildBanner('assets/slider3.jpg'),
//                 _buildBanner('assets/slider5.jpg'),
//               ],
//             ),
//           ),
//           const SizedBox(height: 20),
//           // Now Playing Movies Section
//           const Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Text(
//               "Now Playing",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//           ),
//           SizedBox(
//             height: 250,
//             child: ListView(
//               scrollDirection: Axis.horizontal,
//               children: [
//                 _buildMovieCard('assets/film1.jpg', 'Kuasa Gelap'),
//                 _buildMovieCard('assets/film 4.jpg', 'Joker'),
//                 _buildMovieCard('assets/film2.jpg', 'Harry Potter'),
//                 _buildMovieCard('assets/film 9.jpg', 'Spiderman'),
//                 _buildMovieCard('assets/film3.jpg', 'Spiderman'),
//               ],
//             ),
//           ),
//           const SizedBox(height: 20),
//           // Spotlight Section
//           const Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Text(
//               "Spotlight",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//           ),
//           SizedBox(
//             height: 120,
//             child: ListView(
//               scrollDirection: Axis.horizontal,
//               children: [
//                 _buildSpotlightItem(
//                   'assets/gambar1.jpg',
//                   "TIX ID Box Office (11-17 November)",
//                   "Film terlaris di bioskop Indonesia",
//                   57,
//                   0,
//                 ),
//                 _buildSpotlightItem(
//                   'assets/gambar2.jpg',
//                   "Film Marvel Terbaru",
//                   "Tayang di bioskop minggu ini",
//                   120,
//                   5,
//                 ),
//                 _buildSpotlightItem(
//                   'assets/gambar 3.jpg',
//                   "Marvel's Latest Hits",
//                   "Hot releases this week",
//                   150,
//                   10,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
  

//   // Banner Widget
//   Widget _buildBanner(String imagePath) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 8),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         image: DecorationImage(
//           image: AssetImage(imagePath),
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   }

//   // Movie Card Widget
//   Widget _buildMovieCard(String imagePath, String title) {
//     return Container(
//       width: 150,
//       margin: const EdgeInsets.symmetric(horizontal: 8),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(10),
//             child: Image.asset(
//               imagePath,
//               height: 200,
//               width: 150,
//               fit: BoxFit.cover,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             title,
//             style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }

//   // Spotlight Item Widget
//   Widget _buildSpotlightItem(
//     String imagePath,
//     String title,
//     String subtitle,
//     int views,
//     int likes,
//   ) {
//     return Container(
//       width: 250,
//       margin: const EdgeInsets.only(right: 16.0),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: Colors.grey[200],
//       ),
//       child: Row(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(10),
//             child: Image.asset(
//               imagePath,
//               height: 100,
//               width: 100,
//               fit: BoxFit.cover,
//             ),
//           ),
//           const SizedBox(width: 10),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   title,
//                   style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 const SizedBox(height: 5),
//                 Text(
//                   subtitle,
//                   style: const TextStyle(fontSize: 12, color: Colors.grey),
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 const SizedBox(height: 5),
//                 Row(
//                   children: [
//                     Icon(Icons.remove_red_eye, size: 16, color: Colors.grey),
//                     const SizedBox(width: 5),
//                     Text("$views"),
//                     const SizedBox(width: 15),
//                     Icon(Icons.favorite, size: 16, color: Colors.grey),
//                     const SizedBox(width: 5),
//                     Text("$likes"),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ]
//       ),
//     );
//   }
// }

// // Halaman Film
//   class MoviesPage extends StatelessWidget {
//   final List<String> cinemas = [
//     "AEON MALL JGC CGV",
//     "AEON MALL TANJUNG BARAT XXI",
//     "AGORA MALL IMAX",
//     "AGORA MALL PREMIERE",
//     "AGORA MALL XXI",
//     "ARION XXI",
//     "ARTHA GADING XXI",
//     "BASSURA XXI",
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Pilih Bioskop"),
//         backgroundColor: Color.fromARGB(255, 20, 12, 74),
//       ),
//       body: ListView.builder(
//         itemCount: cinemas.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             leading: Icon(Icons.movie),
//             title: Text(cinemas[index]),
//             trailing: Icon(Icons.arrow_forward_ios),
//             onTap: () {
//               // Tambahkan navigasi atau aksi di sini
//               print('Anda memilih ${cinemas[index]}');
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// // Halaman Tiket
// class TicketScreen extends StatefulWidget {
//   @override
//   _TicketScreenState createState() => _TicketScreenState();
// }

// class _TicketScreenState extends State<TicketScreen> {
//   final List<Map<String, dynamic>> films = [
//     {
//       "title": "BILA ESOK IBU TIADA",
//       "genre": "Drama, Keluarga",
//       "rating": 9.2,
//       "image": "assets/movie1.jpg", // Ganti dengan path gambar Anda
//     },
//     {
//       "title": "SANTET SEGORO PITU",
//       "genre": "Horror",
//       "rating": 9.0,
//       "image": "assets/movie2.jpg", // Ganti dengan path gambar Anda
//     },
//     {
//       "title": "GLADIATOR II",
//       "genre": "Action, Adventure",
//       "rating": 9.5,
//       "image": "assets/movie3.jpeg", // Ganti dengan path gambar Anda
//     },
//     {
//       "title": "RED ONE",
//       "genre": "Action, Adventure",
//       "rating": 9.3,
//       "image": "assets/movie 4.png", // Ganti dengan path gambar Anda
//     },
//   ];

//   List<String> favoriteFilms = [];

//   void toggleFavorite(String title) {
//     setState(() {
//       if (favoriteFilms.contains(title)) {
//         favoriteFilms.remove(title);
//       } else {
//         favoriteFilms.add(title);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Film Bioskop"),
//           bottom: TabBar(
//             tabs: [
//               Tab(text: "SEDANG TAYANG"),
//               Tab(text: "AKAN DATANG"),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             buildFilmGrid(),
//             Center(child: Text("Halaman Akan Datang (Coming Soon)")),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildFilmGrid() {
//     return GridView.builder(
//       padding: EdgeInsets.all(10),
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2, // 2 kolom
//         crossAxisSpacing: 10,
//         mainAxisSpacing: 10,
//         childAspectRatio: 0.7,
//       ),
//       itemCount: films.length,
//       itemBuilder: (context, index) {
//         final film = films[index];
//         final isFavorite = favoriteFilms.contains(film['title']);

//         return Card(
//           elevation: 5,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Stack(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
//                     child: Image.asset(
//                       film['image'],
//                       height: 150,
//                       width: double.infinity,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   Positioned(
//                     top: 10,
//                     right: 10,
//                     child: IconButton(
//                       icon: Icon(
//                         isFavorite ? Icons.favorite : Icons.favorite_border,
//                         color: isFavorite ? Colors.red : Colors.white,
//                       ),
//                       onPressed: () => toggleFavorite(film['title']),
//                     ),
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   film['title'],
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                 child: Text(
//                   film['genre'],
//                   style: TextStyle(color: Colors.grey),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   children: [
//                     Icon(Icons.star, color: Colors.orange, size: 18),
//                     SizedBox(width: 4),
//                     Text(
//                       film['rating'].toString(),
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
// class TicketsListPage extends StatelessWidget {
//   const TicketsListPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false, // Menghapus ikon default back
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Film Card 1
//             MovieCard(
//               movieTitle: "GLADIATOR 2",
//               genre: "Action, Adventure",
//               ageRating: "D 18+",
//               rating: "9.5",
//               imageUrl: "assets/movie3.jpeg",
//             ),
//             const SizedBox(height: 1),
//             // Film Card 2
//             MovieCard(
//               movieTitle: "RED ONE",
//               genre: "Action, Adventure",
//               ageRating: "R 13+",
//               rating: "9.3",
//               imageUrl: "assets/movie 4.png",
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MovieCard extends StatelessWidget {
//   final String movieTitle;
//   final String genre;
//   final String ageRating;
//   final String rating;
//   final String imageUrl;

//   const MovieCard({
//     Key? key,
//     required this.movieTitle,
//     required this.genre,
//     required this.ageRating,
//     required this.rating,
//     required this.imageUrl,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       elevation: 4,
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Image Section
//           ClipRRect(
//             borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(12),
//               bottomLeft: Radius.circular(12),
//             ),
//             child: Image.asset(
//               imageUrl,
//               height: 100,
//               width: 100,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Movie Title
//                   Text(
//                     movieTitle,
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   // Genre
//                   Text(
//                     genre,
//                     style: const TextStyle(
//                       fontSize: 14,
//                       color: Colors.grey,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   // Age Rating and Rating
//                   Row(
//                     children: [
//                       // Age Rating
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 6,
//                           vertical: 2,
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.orange.withOpacity(0.2),
//                           borderRadius: BorderRadius.circular(4),
//                         ),
//                         child: Text(
//                           ageRating,
//                           style: const TextStyle(
//                             fontSize: 12,
//                             color: Colors.orange,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 8),
//                       // Rating
//                       Row(
//                         children: [
//                           const Icon(
//                             Icons.star,
//                             color: Colors.yellow,
//                             size: 16,
//                           ),
//                           const SizedBox(width: 4),
//                           Text(
//                             rating,
//                             style: const TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


