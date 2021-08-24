import 'package:flutter/material.dart';

/// A filler card to show the video in a list of scrolling contents.
class VideoListCard extends StatelessWidget {
  const VideoListCard({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.airline_seat_flat_angled),
            title: Text(title),
          ),
          ButtonBar(
            children: <Widget>[
              TextButton(
                child: const Text('BUY TICKETS'),
                onPressed: () {


                },
              ),
              TextButton(
                child: const Text('SELL TICKETS'),
                onPressed: () {


                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}