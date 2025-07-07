import 'package:flutter/material.dart';

void main() => runApp(FatanFlixApp());

class FatanFlixApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FatanFlix',
      theme: ThemeData.dark(),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  final movies = [
    {'title': 'The Silent Night', 'image': 'assets/images/movie1.jpg'},
    {'title': 'Dark Horizon', 'image': 'assets/images/movie2.jpg'},
    {'title': 'Lunar Escape', 'image': 'assets/images/movie3.jpg'},
  ];

  @override
  Widget build(BuildContext c) => Scaffold(
      appBar: AppBar(title: Text('FatanFlix'), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Trending Now', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                itemCount: movies.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 2/3),
                itemBuilder: (ct, i) => GestureDetector(
                  onTap: () => Navigator.push(ct, MaterialPageRoute(builder: (_) => Detail(movie: movies[i]))),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(movies[i]['image']!, fit: BoxFit.cover),
                  ),
                ),
              ),
            )
          ],
        ),
      ));
}

class Detail extends StatelessWidget {
  final Map<String,String> movie;
  Detail({required this.movie});
  @override
  Widget build(BuildContext c) => Scaffold(
        appBar: AppBar(title: Text(movie['title']!)),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              ClipRRect(borderRadius: BorderRadius.circular(12),
                child: Image.asset(movie['image']!, height:300, width:double.infinity, fit:BoxFit.cover)),
              SizedBox(height:20),
              Text(movie['title']!, style:TextStyle(fontSize:24, fontWeight: FontWeight.bold)),
              SizedBox(height:10),
              Text('Fake movie description for demo. Enjoy FatanFlix!'),
              Spacer(),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.play_arrow),
                label: Text('Play'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent, minimumSize: Size(double.infinity,50)),
              )
            ],
          ),
        ),
      );
}
