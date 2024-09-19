import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:website_gadijkhuis/launcher.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});

  static double baseContainerPadding = 40;

  @override
  Widget build(BuildContext context) {
    double containerWidth = ((MediaQuery.of(context).size.width > 800)
        ? 700
        : (MediaQuery.of(context).size.width - 100));

    return MaterialApp(
      title: 'Website GADijkhuis',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const HomePage(title: 'GADijkhuis'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(App.baseContainerPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'About Me:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'I\'m Gideon, a student of Information Technology at NHL Stenden in Emmen. I\'m working on projects using Flutter, UWP, .NET MAUI, and HTML/PHP. In the future, I want to explore other .NET frameworks like ASP.NET and .NET MAUI Blazor.',
            ),
            const Text(
              'Socials:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    icon: SvgPicture.network(
                        'https://simpleicons.org/icons/facebook.svg', color: Colors.white,),
                    onPressed: () async {
                      Launcher.launchURL(
                          'https://facebook.com/gideon.dijkhuis');
                    }),
                IconButton(
                    icon: SvgPicture.network(
                        'https://simpleicons.org/icons/instagram.svg', color: Colors.white,),
                    onPressed: () async {
                      await Launcher.launchURL(
                          'https://instagram.com/g_dijkhuis');
                    }),
                IconButton(
                    icon: SvgPicture.network(
                        'https://simpleicons.org/icons/linkedin.svg', color: Colors.white,),
                    onPressed: () async {
                      Launcher.launchURL(
                          'https://www.linkedin.com/in/gideon-dijkhuis-69a18628a/');
                    }),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Tech Stack:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                Chip(label: Text('C#')),
                Chip(label: Text('Dart')),
                Chip(label: Text('Java')),
                Chip(label: Text('JavaScript')),
                Chip(label: Text('HTML5')),
                Chip(label: Text('CSS3')),
                Chip(label: Text('YAML')),
                Chip(label: Text('PHP')),
                Chip(label: Text('Xamarin')),
                Chip(label: Text('.NET')),
                Chip(label: Text('MySQL')),
                Chip(label: Text('Firebase')),
                Chip(label: Text('Figma')),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Stuur een bericht!',
        child: const Icon(Icons.message),
      ),
    );
  }
}
