import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:website_gadijkhuis/launcher.dart';
import 'package:website_gadijkhuis/web_text.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});

  static double baseContainerPadding = 40;
  static Color primaryIconColor = Colors.white;
  static double baseContainerGap = 20;
  static double baseWidgetGap = 10;
  static double containerWidth = 0;
  static double imageSize = 200;
  static double titleFontSize = 24;
  static double headerFontSize = 48;

  @override
  Widget build(BuildContext context) {
    containerWidth = ((MediaQuery.of(context).size.width > 800)
        ? 700
        : (MediaQuery.of(context).size.width - 100));

    return MaterialApp(
      title: 'GADijkhuis',
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
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(App.baseContainerPadding),
          child: SizedBox(
            width: App.containerWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset("profilePhoto.png", height: App.imageSize, width: App.imageSize,),
                    // SizedBox(width: App.baseWidgetGap,),
                    Text("GADijkhuis", style: TextStyle(fontSize: App.headerFontSize, fontWeight: FontWeight.bold),),
                  ],
                ),

                SizedBox(height: App.baseContainerGap,),
                Text(
                  'About Me:',
                  style: TextStyle(fontSize: App.titleFontSize, fontWeight: FontWeight.bold),
                ),
                Text(
                  WebText.aboutMe(),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: App.baseContainerGap),
                Text(
                  'Tech Stack:',
                  style: TextStyle(fontSize: App.titleFontSize, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: App.baseWidgetGap),
                Center(
                  child: Wrap(
                    spacing: App.baseWidgetGap,
                    runSpacing: App.baseWidgetGap,
                    alignment: WrapAlignment.center,
                    children: const [
                      Chip(label: Text('C#')),
                      Chip(label: Text('Dart')),
                      Chip(label: Text('Java')),
                      Chip(label: Text('JavaScript')),
                      Chip(label: Text('HTML5')),
                      Chip(label: Text('CSS')),
                      Chip(label: Text('PHP')),
                      Chip(label: Text('YAML')),
                      Chip(label: Text('Xamarin')),
                      Chip(label: Text('.NET')),
                      Chip(label: Text('.NET MAUI'),),
                      Chip(label: Text('UWP')),
                      Chip(label: Text('WinForms')),
                      Chip(label: Text('MySQL')),
                      Chip(label: Text('Firebase')),
                    ],
                  ),
                ),
                SizedBox(
                  height: App.baseContainerGap,
                ),
                Text(
                  'Socials:',
                  style: TextStyle(fontSize: App.titleFontSize, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: App.baseWidgetGap),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        icon: SvgPicture.network(
                          'https://simpleicons.org/icons/facebook.svg',
                          color: App.primaryIconColor,
                        ),
                        onPressed: () async {
                          Launcher.launchURL(
                              'https://facebook.com/gideon.dijkhuis');
                        }),
                    IconButton(
                        icon: SvgPicture.network(
                          'https://simpleicons.org/icons/instagram.svg',
                          color: App.primaryIconColor,
                        ),
                        onPressed: () async {
                          await Launcher.launchURL(
                              'https://instagram.com/g_dijkhuis');
                        }),
                    IconButton(
                        icon: SvgPicture.network(
                          'https://simpleicons.org/icons/linkedin.svg',
                          color: App.primaryIconColor,
                        ),
                        onPressed: () async {
                          Launcher.launchURL(
                              'https://www.linkedin.com/in/gideon-dijkhuis-69a18628a/');
                        }),
                    IconButton(
                        icon: SvgPicture.network(
                          'https://simpleicons.org/icons/github.svg',
                          color: App.primaryIconColor,
                        ),
                        onPressed: () async {
                          Launcher.launchURL('https://github.com/GADijkhuis');
                        }),
                    IconButton(
                        icon: SvgPicture.network(
                          'https://simpleicons.org/icons/gmail.svg',
                          color: App.primaryIconColor,
                        ),
                        onPressed: () async {
                          Launcher.launchURL('mailto:dijkhuis.g.a@outlook.com');
                        }),
                  ],
                ),
                SizedBox(height: App.baseContainerGap),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Send me a message!',
        child: const Icon(Icons.message),
      ),
    );
  }
}
