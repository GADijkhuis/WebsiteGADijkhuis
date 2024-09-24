import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:website_gadijkhuis/launcher.dart';
import 'package:website_gadijkhuis/web_text.dart';
import 'package:website_gadijkhuis/widget_creator.dart';


void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  static Color primaryIconColor = Colors.white;
  static Color cardBGColor = Colors.black;

  static double baseContainerPadding = 40;
  static double baseWidgetSpacing = 60;
  static double baseContainerGap = 20;
  static double baseWidgetGap = 10;
  static double containerWidth = 0;
  static double cardAspectRatio = 0;
  static double imageSize = 200;
  static double imageSizeSmall = 75;
  static double titleFontSize = 24;
  static double headerFontSize = 48;
  static double cardBorderRadius = 20;

  static List<Widget> projectWidgets = [
    WidgetCreator.createCard("Klokking.png", "Klokking", "Klokking is a racesoftware for canoesprint, including online registrations and online result", url: "https://klokking.nl/")
  ];

  @override
  Widget build(BuildContext context) {
    containerWidth = ((MediaQuery.of(context).size.width > 800)
        ? 700
        : (MediaQuery.of(context).size.width - 100));

    cardAspectRatio = (MediaQuery.of(context).size.width > 800) ? 16 / 9 : (MediaQuery.of(context).size.aspectRatio);


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
  bool floatingActionButtonExpanded = false;

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
                Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.spaceEvenly,
                  spacing: App.baseWidgetSpacing,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Image.asset(
                      "LogoGADijkhuisWhite.png",
                      height: App.imageSize,
                      width: App.imageSize,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "GADijkhuis",
                          style: TextStyle(
                              fontSize: App.headerFontSize,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                    
                  ],
                ),
                SizedBox(height: App.baseContainerGap),

                //About me
                Column(
                  children: [
                    Text(
                      'About Me:',
                      style: TextStyle(
                          fontSize: App.titleFontSize, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      WebText.aboutMe(),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(height: App.baseContainerGap),

                //Projects
                Column(
                  children: [
                    Text(
                      "Projects:",
                      style: TextStyle(
                          fontSize: App.titleFontSize, fontWeight: FontWeight.bold)),
                    SizedBox(height: App.baseWidgetGap),
                    CarouselSlider(
                        items: App.projectWidgets,
                        options: CarouselOptions(
                          autoPlay: true,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          aspectRatio: App.cardAspectRatio,
                          autoPlayInterval: const Duration(seconds: 8),
                          autoPlayAnimationDuration: const Duration(milliseconds: 2000)
                        )
                    ),
                  ],
                ),
                SizedBox(height: App.baseContainerGap),

                //Tech Stack
                Column(
                  children: [
                    Text(
                      'Tech Stack:',
                      style: TextStyle(
                          fontSize: App.titleFontSize, fontWeight: FontWeight.bold),
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
                          Chip(label: Text('.NET MAUI')),
                          Chip(label: Text('UWP')),
                          Chip(label: Text('WinForms')),
                          Chip(label: Text('MySQL')),
                          Chip(label: Text('Firebase')),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: App.baseContainerGap),

                //Socials
                Column(
                  children: [
                    Text(
                      'Socials:',
                      style: TextStyle(
                          fontSize: App.titleFontSize, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: App.baseWidgetGap),
                    Wrap(
                      alignment: WrapAlignment.center,
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
                  ],
                ),
                SizedBox(height: App.baseContainerGap * 2),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: floatingActionButtonExpanded ? 290.0 : 56.0, // Width changes
        height: 56.0, // Keep the height consistent with the FloatingActionButton size
        child: floatingActionButtonExpanded
            ? FloatingActionButton.extended(
          onPressed: () {
            setState(() {
              floatingActionButtonExpanded = false;
            });
          },
          heroTag: "sendMessageButton",
          label: Row(
            children: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      floatingActionButtonExpanded = false;
                    });
                  },
                  child: const Icon(Icons.close)
              ),
              TextButton(
                onPressed: () {
                  Launcher.launchURL("mailto:dijkhuis.g.a@outlook.com");
                },
                child: Row(
                  children: [
                    const Icon(Icons.mail),
                    SizedBox(width: App.baseWidgetGap),
                    const Text("dijkhuis.g.a@outlook.com"),
                  ],
                ),
              ),
            ],
          ),
        ) :
        FloatingActionButton(
          onPressed: () {
            setState(() {
              floatingActionButtonExpanded = true;
            });
          },
          heroTag: "sendMessageButton",
          tooltip: 'Contact me!',
          child: const Icon(Icons.message),
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
