import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'data/constant/global.dart';


class Tweet extends StatelessWidget {
  final String avatar;
  final String username;
  final String name;
  final String timeAgo;
  final String text;
  final String comments;
  final String retweets;
  final String favorites;

  Tweet({
        required this.avatar,
        required this.username,
        required this.name,
        required this.timeAgo,
        required this.text,
        required this.comments,
        required this.retweets,
        required this.favorites
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          tweetAvatar(),
          tweetBody(),
        ],
      ),
    );
  }

  Widget tweetAvatar() {
    return Container(
      margin: const EdgeInsets.all(10.0),
      /*child: CircleAvatar(
        backgroundImage: NetworkImage(this.avatar),
      ),*/
      child:CachedNetworkImage(
        imageUrl: this.avatar,
        imageBuilder: (context, imageProvider) => Container(
          // width: 80.0,
          // height: 80.0,
          width: MediaQuery.of(context).size.width / 10,
          height: MediaQuery.of(context).size.width / 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: imageProvider, fit: BoxFit.cover),
          ),
        ),
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      )
    );
  }

  Widget tweetBody() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          tweetHeader(),
          tweetText(),
          tweetButtons(),
        ],
      ),
    );
  }

  Widget tweetHeader() {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 5.0),
          child: Text(
            this.username,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          '@$name · $timeAgo',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        Spacer(),
        IconButton(
          icon: Icon(
            FontAwesomeIcons.angleDown,
            size: 14.0,
            color: Colors.grey,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget tweetText() {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold),
      overflow: TextOverflow.clip,
    );
  }

  Widget tweetButtons() {
    return Container(
      margin: const EdgeInsets.only(top: 10.0, right: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          tweetIconButton(FontAwesomeIcons.comment, this.comments),
          tweetIconButton(FontAwesomeIcons.retweet, this.retweets),
          tweetIconButton(FontAwesomeIcons.heart, this.favorites),
          tweetIconButton(FontAwesomeIcons.share, ''),
        ],
      ),
    );
  }

  Widget tweetIconButton(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16.0,
          color: parseColor("#69001e"),
        ),
        Container(
          margin: const EdgeInsets.all(6.0),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.black45,
              fontSize: 14.0,
            ),
          ),
        ),
      ],
    );
  }
}
