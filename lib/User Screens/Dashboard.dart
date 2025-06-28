import 'dart:async';
import 'package:flutter/material.dart';
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
    "assets/images/image5.jpeg",
    "assets/images/image.jpeg",
    "assets/images/image6.jpeg",
    "assets/images/image4.jpeg",
    "assets/images/image3.jpeg",
  ];
  bool isAutoSearchEnabled = false;
bool isManualSearchEnabled = false;


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
      const ListTile(
        leading: Icon(Icons.home),
        title: Text('Home'),
      ),
      const ListTile(
        leading: Icon(Icons.room_service),
        title: Text('Services'),
      ),
      const ListTile(
        leading: Icon(Icons.location_city),
        title: Text('Location'),
      ),
      SwitchListTile(
        title: const Text('Auto Search'),
        secondary: const Icon(Icons.autorenew),
        value: isAutoSearchEnabled,
        onChanged: (value) {
          setState(() {
            isAutoSearchEnabled = value;
          });
        },
      ),
      SwitchListTile(
        title: const Text('Manual Search'),
        secondary: const Icon(Icons.search),
        value: isManualSearchEnabled,
        onChanged: (value) {
          setState(() {
            isManualSearchEnabled = value;
          });
        },
      ),
      const ListTile(
        leading: Icon(Icons.logout),
        title: Text('LogOut'),
      ),
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Icon(Icons.location_on, color: Colors.blue, size: 20),
                  SizedBox(width: 5),
                  Text("Pakistan", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  SizedBox(width: 5),
                  Icon(Icons.keyboard_arrow_down_outlined)
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
            const SizedBox(height: 16),
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
        image: DecorationImage(
          image: AssetImage(path),
          fit: BoxFit.cover,
        ),
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
              boxShadow: [
                BoxShadow(
                  color: iconColor.withOpacity(0.4),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
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