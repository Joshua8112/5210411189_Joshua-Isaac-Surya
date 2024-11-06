import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  final List<Map<String, String>> songItems = [
    {
      'imageUrl': 'lib/assets/contoh/fis.jpeg',
      'artist': 'Feast',
      'trackName': 'Berita Kehilangan',
    },
    {
      'imageUrl': 'lib/assets/contoh/hindia.jpeg',
      'artist': 'Hindia',
      'trackName': 'Evaluasi',
    },
    {
      'imageUrl': 'lib/assets/contoh/jeblox.jpeg',
      'artist': 'The Jeblogs',
      'trackName': 'Lagu Cinta untuk Puisi',
    },
  ];

  final List<Map<String, String>> albumList = [
    {
      'imageUrl': 'lib/assets/contoh/fis.jpeg',
      'albumTitle': 'Feast Collection',
      'albumDescription': 'Kumpulan lagu-lagu terbaik dari Feast',
      'playtime': '45 min',
    },
    {
      'imageUrl': 'lib/assets/contoh/hindia.jpeg',
      'albumTitle': 'Hindia Favorites',
      'albumDescription': 'Lagu-lagu Hindia yang paling dikenal dan disukai',
      'playtime': '55 min',
    },
    {
      'imageUrl': 'lib/assets/contoh/jeblox.jpeg',
      'albumTitle': 'The Jeblogs Hits',
      'albumDescription': 'Lagu-lagu pilihan dari The Jeblogs',
      'playtime': '40 min',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            UserProfile(
              name: 'Joshua',
              avatarPath: 'lib/assets/contoh/jeblox.jpeg',
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
                onTap: () {
                  // Action for button tap
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Grid View",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    const Icon(Icons.arrow_forward, size: 24),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 210,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                physics: const AlwaysScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 1.25,
                ),
                itemCount: songItems.length,
                itemBuilder: (context, index) {
                  final item = songItems[index];
                  return SongGrid(
                    imageUrl: item['imageUrl']!,
                    artist: item['artist']!,
                    trackName: item['trackName']!,
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
                onTap: () {
                  // Action for button tap
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "List View",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    const Icon(Icons.arrow_forward, size: 24),
                  ],
                ),
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: albumList.length,
              itemBuilder: (context, index) {
                final item = albumList[index];
                return AlbumListItem(
                  imageUrl: item['imageUrl']!,
                  albumTitle: item['albumTitle']!,
                  albumDescription: item['albumDescription']!,
                  playtime: item['playtime']!,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class UserProfile extends StatelessWidget {
  final String name;
  final String avatarPath;

  const UserProfile({
    Key? key,
    required this.name,
    required this.avatarPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                child: ClipOval(
                  child: Image.asset(
                    avatarPath,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.account_circle, size: 60);
                    },
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Text(
                name,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SongGrid extends StatelessWidget {
  final String imageUrl;
  final String artist;
  final String trackName;

  const SongGrid({
    Key? key,
    required this.imageUrl,
    required this.artist,
    required this.trackName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                height: 120,
                width: double.infinity,
                errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                  return Container(
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Icon(Icons.broken_image, size: 50, color: Colors.grey),
                    alignment: Alignment.center,
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  artist,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  trackName,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AlbumListItem extends StatelessWidget {
  final String imageUrl;
  final String albumTitle;
  final String albumDescription;
  final String playtime;

  const AlbumListItem({
    Key? key,
    required this.imageUrl,
    required this.albumTitle,
    required this.albumDescription,
    required this.playtime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              imageUrl,
              height: 120,
              width: 120,
              errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                return Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Icon(Icons.broken_image, size: 50, color: Colors.grey),
                  alignment: Alignment.center,
                );
              },
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  albumTitle,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(albumDescription),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text('+'),
                        ),
                        const Text('Today • 23 min'),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.play_arrow),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
