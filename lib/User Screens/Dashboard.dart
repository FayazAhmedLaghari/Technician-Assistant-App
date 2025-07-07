import 'dart:async';

import 'package:flutter/material.dart';
import 'package:technician_assistant_app/User%20Screens/autosearch_screen.dart';
import 'package:technician_assistant_app/User%20Screens/service_list.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> categories = const [
    {"icon": Icons.plumbing, "title": "Plumber", "color": Colors.blue},
    {"icon": Icons.electrical_services, "title": "Electrician", "color": Colors.orange},
    {"icon": Icons.cleaning_services, "title": "Cleaner", "color": Colors.green},
    {"icon": Icons.ac_unit, "title": "AC Repair", "color": Colors.teal},
    {"icon": Icons.car_repair, "title": "Carpenter", "color": Colors.pink},
    {"icon": Icons.home_repair_service, "title": "Mechanic", "color": Colors.red},
    {"icon": Icons.phone_android, "title": "Mobile Repair", "color": Colors.purple},
    {"icon": Icons.tv, "title": "TV Repair", "color": Colors.indigo},
    {"icon": Icons.computer, "title": "Computer Repair", "color": Colors.cyan},
    {"icon": Icons.format_paint, "title": "Painter", "color": Colors.brown},
    {"icon": Icons.lightbulb, "title": "Lighting", "color": Colors.amber},
    {"icon": Icons.shower, "title": "Bathroom Fit", "color": Colors.deepOrange},
  ];

  final List<String> imagePaths = [
    "assets/image5.jpeg",
    "assets/image.jpeg",
    "assets/ac repair.jpg",
    "assets/Plumbing.jpg",
    "assets/image6.jpeg",
  ];

  bool isAutoSearchOn = false;
  bool isManualSearchOn = false;
  bool isAuto = true;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_pageController.hasClients) {
        _currentPage = (_currentPage + 1) % imagePaths.length;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: const [
              Icon(Icons.search, color: Colors.grey),
              SizedBox(width: 8),
              Expanded(
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: 'Search Services...',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('User'),
              accountEmail: Text('user456@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: Colors.black),
              ),
              decoration: BoxDecoration(color: Colors.deepPurple),
            ),
            ListTile(
              leading: const Icon(Icons.manage_search),
              title: const Text('Auto Search'),
              trailing: Switch(
                value: isAutoSearchOn,
                onChanged: (bool value) {
                  setState(() {
                    isAutoSearchOn = value;
                    if (value) {
                      isManualSearchOn = false;
                    }
                  });
                  if (value) {
                    Navigator.pop(context);
                    Future.delayed(const Duration(milliseconds: 300), () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const AutoSearch()),
                      );
                    });
                  }
                },
              ),
            ),
            ListTile(
              leading: const Icon(Icons.search),
              title: const Text('Manual Search'),
              trailing: Switch(
                value: isManualSearchOn,
                onChanged: (bool value) {
                  setState(() {
                    isManualSearchOn = value;
                    if (value) {
                      isAutoSearchOn = false;
                    }
                  });
                  if (value) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Manual Search selected'),
                    ));
                  }
                },
              ),
            ),
            const Divider(),
            ListTile(leading: Icon(Icons.home), title: Text('Home'), onTap: () {}),
            ListTile(leading: Icon(Icons.room_service), title: Text('Services'), onTap: () {}),
            ListTile(leading: Icon(Icons.location_city), title: Text('Location'), onTap: () {}),
            ListTile(leading: Icon(Icons.logout), title: Text('Log Out'), onTap: () {}),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 180,
              child: PageView.builder(
                controller: _pageController,
                itemCount: imagePaths.length,
                itemBuilder: (context, index) {
                  return buildImage(imagePaths[index]);
                },
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.location_on, color: Colors.blue, size: 20),
                      SizedBox(width: 5),
                      Text("Pakistan", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                      SizedBox(width: 5),
                      Icon(Icons.keyboard_arrow_down_outlined)
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            if (!isAuto) {
                              final result = await Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => const AutoSearch()),
                              );
                              if (result == 'back_to_manual') {
                                setState(() {
                                  isAuto = false;
                                });
                              }
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                              color: isAuto ? Colors.deepPurple : Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Auto',
                              style: TextStyle(
                                color: isAuto ? Colors.white : Colors.deepPurple,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        GestureDetector(
                          onTap: () {
                            if (isAuto) {
                              setState(() {
                                isAuto = false;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Manual Search selected")),
                              );
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                              color: !isAuto ? Colors.deepPurple : Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Manual',
                              style: TextStyle(
                                color: !isAuto ? Colors.white : Colors.deepPurple,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                "Services Categories",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return buildCategory(
                    category['icon'],
                    category['title'],
                    category['color'],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ServiceListScreen(
                            category: category['title'],
                            color: category['color'],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImage(String path) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(path), fit: BoxFit.cover),
      ),
    );
  }

  Widget buildCategory(IconData icon, String title, Color iconColor, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.2),
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(color: iconColor.withOpacity(0.4), blurRadius: 6, offset: const Offset(0, 3))],
            ),
            child: Icon(icon, size: 30, color: iconColor),
          ),
          const SizedBox(height: 6),
          Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
