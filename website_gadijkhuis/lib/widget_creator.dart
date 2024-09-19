import 'package:flutter/material.dart';
import 'package:website_gadijkhuis/launcher.dart';

import 'main.dart';

class WidgetCreator {

  static Widget createCard(String image, String title, String description, {String url = ""})
  {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(App.cardBorderRadius)
      ),
      color: App.cardBGColor,
      semanticContainer: false,
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(App.cardBorderRadius),
                topRight: Radius.circular(App.cardBorderRadius),
              ),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),

          ListTile(
            title: Text(title),
            subtitle: Text(description),
          ),
          if (url != "") ElevatedButton(
              onPressed: (){
                Launcher.launchURL(url);
              },
              child: const Text("Go to project")
          )
        ],
      ),

    );
  }

}