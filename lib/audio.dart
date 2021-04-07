import 'package:flutter/material.dart';

class Audio extends StatefulWidget {
  @override
  _AudioState createState() => _AudioState();
}

class Place {
  String imageUrl;
  String name;
  String subname;

  Place({this.imageUrl, this.name, this.subname});
}

List wonders = [
  Place(
      imageUrl:
      "https://images.unsplash.com/photo-1597466765990-64ad1c35dafc",
      name: "Lorem Ipsum is simply dummy text of the printing",
      subname: "Lorem Ipsum . 04:33"),
  Place(
      imageUrl:
      "https://images.unsplash.com/photo-1597466765990-64ad1c35dafc",
      name: "Lorem Ipsum is simply dummy text of the printing",
      subname: "Lorem Ipsum . 04:33"),
  Place(
      imageUrl:
      "https://images.unsplash.com/photo-1597466765990-64ad1c35dafc",
      name: "Lorem Ipsum is simply dummy text of the printing",
      subname: "Lorem Ipsum . 04:33"),
  Place(
      imageUrl:
      "https://images.unsplash.com/photo-1597466765990-64ad1c35dafc",
      name: "Lorem Ipsum is simply dummy text of the printing",
      subname: "Lorem Ipsum . 04:33"),
  Place(
      imageUrl:
      "https://images.unsplash.com/photo-1597466765990-64ad1c35dafc",
      name: "Lorem Ipsum is simply dummy text of the printing",
      subname: "Lorem Ipsum . 04:33"),
  Place(
      imageUrl:
      "https://images.unsplash.com/photo-1597466765990-64ad1c35dafc",
      name: "Lorem Ipsum is simply dummy text of the printing",
      subname: "Lorem Ipsum . 04:33"),
  Place(
      imageUrl:
      "https://images.unsplash.com/photo-1597466765990-64ad1c35dafc",
      name: "Lorem Ipsum is simply dummy text of the printing",
      subname: "Lorem Ipsum . 04:33"),
  Place(
      imageUrl:
      "https://images.unsplash.com/photo-1597466765990-64ad1c35dafc",
      name: "Lorem Ipsum is simply dummy text of the printing",
      subname: "Lorem Ipsum . 04:33"),
  Place(
      imageUrl:
      "https://images.unsplash.com/photo-1597466765990-64ad1c35dafc",
      name: "Lorem Ipsum is simply dummy text of the printing",
      subname: "Lorem Ipsum . 04:33"),
  Place(
      imageUrl:
      "https://images.unsplash.com/photo-1597466765990-64ad1c35dafc",
      name: "Lorem Ipsum is simply dummy text of the printing",
      subname: "Lorem Ipsum . 04:33"),
  Place(
      imageUrl:
      "https://images.unsplash.com/photo-1597466765990-64ad1c35dafc",
      name: "Lorem Ipsum is simply dummy text of the printing",
      subname: "Lorem Ipsum . 04:33"),
  Place(
      imageUrl:
      "https://images.unsplash.com/photo-1597466765990-64ad1c35dafc",
      name: "Lorem Ipsum is simply dummy text of the printing",
      subname: "Lorem Ipsum . 04:33"),
  Place(
      imageUrl:
      "https://images.unsplash.com/photo-1597466765990-64ad1c35dafc",
      name: "Lorem Ipsum is simply dummy text of the printing",
      subname: "Lorem Ipsum . 04:33"),
];


class _AudioState extends State<Audio> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Container(
        height: 900.0,
        child: Stack(
          children:<Widget>[
            ListView.builder(
              itemCount: wonders.length,
              itemBuilder: (context, index) {
                return ListTile(leading: SizedBox(width: 65,
                    height: 35,child: Image.network(wonders[index].imageUrl,fit: BoxFit.cover)), title: Text(wonders[index].name), subtitle: Text(wonders[index].subname),trailing: Icon(
                  Icons.more_vert,
                ),);
              },
            ),
          ],
        ),
      ),
    );
  }

}

