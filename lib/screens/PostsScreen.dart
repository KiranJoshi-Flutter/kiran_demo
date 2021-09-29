import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Album {
  final int page;
  final int perPage;
  final List<dynamic> datas;
  // final Map<String, dynamic> support;

  Album({
    @required this.page,
    @required this.perPage,
    @required this.datas,
    // @required this.support,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      page: json['page'],
      perPage: json['per_page'],
      datas: json['data'],
      // support: json['support'],
    );
  }
}

Future<Album> fetchAlbum() async {
  final response = await http.get(Uri.parse('https://reqres.in/api/users'));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key key}) : super(key: key);

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  Future<Album> futureAlbum;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FutureBuilder<Album>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.datas.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Image.network(
                        '${snapshot.data.datas[index]['avatar']}',
                        height: 100.0,
                        width: 100.0,
                        alignment: Alignment.topLeft,
                      ),
                      Text('${snapshot.data.datas[index]['first_name']}'),
                      Text('${snapshot.data.datas[index]['email']}'),
                      // Text('${snapshot.data.datas.length}'),
                    ],
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
