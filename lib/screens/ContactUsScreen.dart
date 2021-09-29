import 'package:flutter/material.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key key}) : super(key: key);

  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact us'),
      ),
      body: Column(
        children: [
          ListTile(
            title: Row(
              children: [
                Text('Name : Kiran Joshi'),
              ],
            ),
          ),
          ListTile(
            title: Row(
              children: [
                Text('Address : Budhanilkantha'),
              ],
            ),
          ),
          ListTile(
            title: Row(
              children: [
                Text('Email : keronz.joshi@gmail.com'),
              ],
            ),
          ),
          ListTile(
            title: Row(
              children: [
                Text('Contact Number : 9841662206'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
