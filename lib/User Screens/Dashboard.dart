// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(5, 235, 128, 1),
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text('Fayaz'),
              accountEmail: Text('fayaz786@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: Colors.black),
              ),
              decoration: const BoxDecoration(
                color: Colors.deepPurple,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.room_service),
              title: const Text('Services'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.location_city),
              title: const Text('Location'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              color: Colors.deepPurple[100],
              child: Marquee(
                text:
                    'Welcome to User find  Technician Services – your digital platform for fast, reliable, and skilled technical support..',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple),
                scrollAxis: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                blankSpace: 200, // How much space before the text repeats
                velocity: 50, // Speed of scrolling
                pauseAfterRound:
                    Duration(seconds: 1), // Pause after completing one round
              ),
            ),
          ),
        ],
      )),
    );
  }
}
