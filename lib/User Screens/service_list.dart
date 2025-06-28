
import 'package:flutter/material.dart';
import 'package:technician_assistant_app/Model/service_provider_screen.dart';
import 'package:technician_assistant_app/User%20Screens/chat_screen.dart';

class ServiceListScreen extends StatelessWidget {
  final String category;
  final Color color;

  const ServiceListScreen({
    super.key,
    required this.category,
    required this.color,
  });

  List<ServiceProvider> getDummyProviders() {
    switch (category) {
    case 'Plumber':
  return [
    ServiceProvider(
      name: "Ali Plumbing Services",
      status: "Online",
      location: "Karachi",
      rating: 4.6,
      reviews: ["Leak fixed quickly", "Very professional"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Quick Pipe Fix",
      status: "Online",
      location: "Lahore",
      rating: 4.1,
      reviews: ["Clean work", "Affordable"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "WaterLine Experts",
      status: "Online",
      location: "Islamabad",
      rating: 4.7,
      reviews: ["Replaced my geyser", "Very neat work"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "PlumbPro Solutions",
      status: "Offline",
      location: "Faisalabad",
      rating: 4.2,
      reviews: ["Fixed pipe burst", "Decent pricing"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "AquaFix Services",
      status: "Online",
      location: "Rawalpindi",
      rating: 4.4,
      reviews: ["Great attitude", "Quick work"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Pipe Doctors",
      status: "Online",
      location: "Multan",
      rating: 4.3,
      reviews: ["Solved bathroom issues", "Professional team"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Elite Plumbers",
      status: "Offline",
      location: "Hyderabad",
      rating: 4.0,
      reviews: ["Satisfied with quality", "Bit slow"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Leak Hunters",
      status: "Online",
      location: "Peshawar",
      rating: 4.5,
      reviews: ["Perfect sealing", "Highly recommended"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "City Plumb Crew",
      status: "Offline",
      location: "Sialkot",
      rating: 4.1,
      reviews: ["Fixed leakage", "Nice communication"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Flow Fix Experts",
      status: "Online",
      location: "Bahawalpur",
      rating: 4.3,
      reviews: ["Great value", "Reliable crew"],
      imagePath: "assets/images/profile image icon.png",
    ),
  ];


      case 'Electrician':
  return [
    ServiceProvider(
      name: "Zain Electric Works",
      status: "Online",
      location: "Islamabad",
      rating: 4.4,
      reviews: ["Expert service", "Safe installation"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Volt Masters",
      status: "Online",
      location: "Hyderabad",
      rating: 4.0,
      reviews: ["Reliable work", "Polite staff"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Bright Volt Experts",
      status: "Online",
      location: "Karachi",
      rating: 4.5,
      reviews: ["Solved wiring issue", "Quick and safe"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Safe Spark Electricians",
      status: "Offline",
      location: "Lahore",
      rating: 4.1,
      reviews: ["Neat installation", "Helpful guy"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "ElectroFix Solutions",
      status: "Online",
      location: "Multan",
      rating: 4.3,
      reviews: ["Solved voltage issue", "Affordable"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Power Surge Services",
      status: "Online",
      location: "Peshawar",
      rating: 4.2,
      reviews: ["Fixed breaker", "Friendly service"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Watt House Experts",
      status: "Offline",
      location: "Quetta",
      rating: 4.0,
      reviews: ["Great service", "Timely repair"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "FuseFix Electricians",
      status: "Online",
      location: "Faisalabad",
      rating: 4.6,
      reviews: ["Quick fix", "Very professional"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Shock Safe Co.",
      status: "Online",
      location: "Sialkot",
      rating: 4.2,
      reviews: ["Geyser fitting done", "Helpful"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "WireTech Masters",
      status: "Online",
      location: "Bahawalpur",
      rating: 4.3,
      reviews: ["Fan installation", "Neat work"],
      imagePath: "assets/images/profile image icon.png",
    ),
  ];

    case 'Cleaner':
  return [
    ServiceProvider(
      name: "Sparkle Cleaning Co.",
      status: "Online",
      location: "Faisalabad",
      rating: 4.8,
      reviews: ["Deep clean", "Satisfied service"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Bright Wash Experts",
      status: "Online",
      location: "Rawalpindi",
      rating: 4.2,
      reviews: ["Fast and neat", "Great for homes"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Quick Shine Services",
      status: "Online",
      location: "Karachi",
      rating: 4.5,
      reviews: ["Windows look new", "Impressive staff"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Fresh Home Cleaners",
      status: "Offline",
      location: "Lahore",
      rating: 4.1,
      reviews: ["Detailed cleaning", "Reasonable rates"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Neat & Tidy Co.",
      status: "Online",
      location: "Islamabad",
      rating: 4.6,
      reviews: ["Kitchen cleaned perfectly", "Fast response"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Magic Mop Cleaners",
      status: "Offline",
      location: "Sialkot",
      rating: 4.0,
      reviews: ["Neat sofa cleaning", "Satisfied"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Gleam Cleaning Team",
      status: "Online",
      location: "Multan",
      rating: 4.3,
      reviews: ["Carpet cleaned well", "Punctual staff"],
      imagePath: "assets/images/profile image icon.png",
    ),
  ];

     case 'AC Repair':
  return [
    ServiceProvider(
      name: "Cool Tech Repair",
      status: "Online",
      location: "Multan",
      rating: 4.7,
      reviews: ["AC working perfectly", "Quick visit"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Fresh Air Experts",
      status: "Offline",
      location: "Sukkur",
      rating: 4.0,
      reviews: ["Affordable and fast"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "AirFix Solutions",
      status: "Online",
      location: "Lahore",
      rating: 4.3,
      reviews: ["Quick response", "Effective cooling"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Chill Point Services",
      status: "Offline",
      location: "Karachi",
      rating: 4.1,
      reviews: ["Good service", "Reasonable rates"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Glacier Cool Tech",
      status: "Online",
      location: "Faisalabad",
      rating: 4.6,
      reviews: ["Polite staff", "Fixed in one visit"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Polar Air Experts",
      status: "Offline",
      location: "Hyderabad",
      rating: 4.2,
      reviews: ["Very professional", "AC like new"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Perfect Temp Solutions",
      status: "Online",
      location: "Islamabad",
      rating: 4.4,
      reviews: ["Fast fix", "Affordable"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Freeze Flow Repair",
      status: "Offline",
      location: "Rawalpindi",
      rating: 3.9,
      reviews: ["Did a great job", "Good communication"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "AC King Services",
      status: "Online",
      location: "Quetta",
      rating: 4.5,
      reviews: ["Came on time", "Great service"],
      imagePath: "assets/images/profile image icon.png",
    ),
  ];

   case 'Car Painter':
  return [
    ServiceProvider(
      name: "Shine Auto Paints",
      status: "Online",
      location: "Karachi",
      rating: 4.3,
      reviews: ["Car looks new", "Smooth finish"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Color Magic",
      status: "Offline",
      location: "Lahore",
      rating: 3.9,
      reviews: ["Nice work", "Took 1 day"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Auto Glow Painters",
      status: "Online",
      location: "Islamabad",
      rating: 4.4,
      reviews: ["Excellent shine", "Quick turnaround"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Paint Perfection",
      status: "Offline",
      location: "Faisalabad",
      rating: 4.1,
      reviews: ["Decent work", "Fair price"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Car Shine Pros",
      status: "Online",
      location: "Multan",
      rating: 4.5,
      reviews: ["Paint looks great", "Friendly staff"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Glossy Finish Garage",
      status: "Offline",
      location: "Hyderabad",
      rating: 3.8,
      reviews: ["Okay service", "Little slow"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "AutoArt Paint Services",
      status: "Online",
      location: "Sialkot",
      rating: 4.6,
      reviews: ["Artistic finish", "Highly recommended"],
      imagePath: "assets/images/profile image icon.png",
    ),
  ];

      case 'Mechanic':
  return [
    ServiceProvider(
      name: "Auto Fix Pro",
      status: "Online",
      location: "Rawalpindi",
      rating: 4.5,
      reviews: ["Fast diagnostics", "Honest pricing"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Engine Masters",
      status: "Online",
      location: "Quetta",
      rating: 4.1,
      reviews: ["Resolved engine noise", "Good service"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Speedy Garage",
      status: "Online",
      location: "Karachi",
      rating: 4.6,
      reviews: ["Quick fix", "Excellent service"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Fix It Auto",
      status: "Offline",
      location: "Lahore",
      rating: 4.2,
      reviews: ["Battery issue fixed", "Reasonable price"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Moti Mechanic Works",
      status: "Online",
      location: "Islamabad",
      rating: 4.4,
      reviews: ["Friendly staff", "Great knowledge"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Tech Auto Fixers",
      status: "Offline",
      location: "Faisalabad",
      rating: 3.9,
      reviews: ["Basic service", "Fair"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Power Auto Garage",
      status: "Online",
      location: "Peshawar",
      rating: 4.3,
      reviews: ["Engine tuning", "Satisfied"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "MaxTorque Mechanics",
      status: "Offline",
      location: "Multan",
      rating: 4.0,
      reviews: ["Noise fixed", "Smooth drive now"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Rapid Auto Repair",
      status: "Online",
      location: "Sialkot",
      rating: 4.5,
      reviews: ["Fast and skilled", "Will visit again"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Classic Auto Experts",
      status: "Offline",
      location: "Hyderabad",
      rating: 4.1,
      reviews: ["Good for old cars", "Expert staff"],
      imagePath: "assets/images/profile image icon.png",
    ),
  ];

     case 'Mobile Repair':
  return [
    ServiceProvider(
      name: "Quick Phone Fix",
      status: "Online",
      location: "Karachi",
      rating: 4.7,
      reviews: ["Repaired screen fast", "Reasonable charges"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "FixMyMobile",
      status: "Offline",
      location: "Islamabad",
      rating: 4.3,
      reviews: ["Genuine parts used", "Recommended"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "PhoneCare Center",
      status: "Online",
      location: "Lahore",
      rating: 4.5,
      reviews: ["Fixed battery issue", "Clean setup"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Mobile Clinic",
      status: "Online",
      location: "Rawalpindi",
      rating: 4.0,
      reviews: ["Touch panel fixed", "Affordable price"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "SmartFix Hub",
      status: "Online",
      location: "Faisalabad",
      rating: 4.6,
      reviews: ["Water damage repair", "Excellent job"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Device Doctors",
      status: "Offline",
      location: "Peshawar",
      rating: 4.1,
      reviews: ["Replaced charging port", "Quick service"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Mobile Mechanics",
      status: "Online",
      location: "Sialkot",
      rating: 4.4,
      reviews: ["Fast repair", "Polite behavior"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Pro Mobile Fixers",
      status: "Online",
      location: "Multan",
      rating: 4.2,
      reviews: ["Good diagnostics", "Fixed on time"],
      imagePath: "assets/images/profile image icon.png",
    ),
  ];

      case 'TV Repair':
  return [
    ServiceProvider(
      name: "TV Doctor",
      status: "Online",
      location: "Hyderabad",
      rating: 4.4,
      reviews: ["Fixed LED panel", "Fast"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Smart Screen Repair",
      status: "Offline",
      location: "Lahore",
      rating: 4.1,
      reviews: ["Good support", "Original parts"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "LED Fix Center",
      status: "Online",
      location: "Karachi",
      rating: 4.3,
      reviews: ["Quick service", "Affordable pricing"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Vision TV Repairs",
      status: "Online",
      location: "Rawalpindi",
      rating: 4.0,
      reviews: ["Replaced board", "Clean work"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "HD TV Experts",
      status: "Online",
      location: "Islamabad",
      rating: 4.5,
      reviews: ["Screen repair was quick", "Friendly staff"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "ScreenTech Solutions",
      status: "Offline",
      location: "Faisalabad",
      rating: 4.2,
      reviews: ["Replaced LED strip", "Good response"],
      imagePath: "assets/images/profile image icon.png",
    ),
  ];

     case 'Computer Repair':
  return [
    ServiceProvider(
      name: "Tech Solutions",
      status: "Online",
      location: "Peshawar",
      rating: 4.6,
      reviews: ["Fast Windows install", "Helpful"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "PC Fix Lab",
      status: "Online",
      location: "Larkana",
      rating: 4.0,
      reviews: ["Fixed virus issue", "Cheap service"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Byte Doctors",
      status: "Online",
      location: "Karachi",
      rating: 4.3,
      reviews: ["Quick SSD upgrade", "Friendly staff"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "FixMyPC",
      status: "Offline",
      location: "Lahore",
      rating: 4.1,
      reviews: ["Fixed blue screen", "Affordable"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Digital Repair Hub",
      status: "Online",
      location: "Multan",
      rating: 4.4,
      reviews: ["Installed new OS", "Efficient team"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Computer ResQ",
      status: "Online",
      location: "Quetta",
      rating: 3.9,
      reviews: ["Cleaned dust inside", "Good behavior"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "System Restore",
      status: "Online",
      location: "Islamabad",
      rating: 4.7,
      reviews: ["Quick turnaround", "Great support"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Laptop Experts",
      status: "Offline",
      location: "Faisalabad",
      rating: 4.2,
      reviews: ["Fixed charging issue", "Very skilled"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Hard Drive Heroes",
      status: "Online",
      location: "Rawalpindi",
      rating: 4.5,
      reviews: ["Data recovered", "Excellent job"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "RAM Repair Center",
      status: "Offline",
      location: "Sialkot",
      rating: 3.8,
      reviews: ["Upgraded RAM", "Took some time"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Pro Computer Care",
      status: "Online",
      location: "Hyderabad",
      rating: 4.6,
      reviews: ["Replaced fan", "Cool & quiet now"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "CPU Masters",
      status: "Online",
      location: "Bahawalpur",
      rating: 4.3,
      reviews: ["Fixed overheating", "Good work"],
      imagePath: "assets/images/profile image icon.png",
    ),
  ];

    case 'Painter':
  return [
    ServiceProvider(
      name: "Perfect Painters",
      status: "Online",
      location: "Faisalabad",
      rating: 4.5,
      reviews: ["Neat & clean paint", "Quick work"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Color Decorators",
      status: "Online",
      location: "Multan",
      rating: 4.2,
      reviews: ["Good shades", "Smooth finish"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Royal Walls",
      status: "Online",
      location: "Karachi",
      rating: 4.6,
      reviews: ["Beautiful texture work", "Fast painters"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Dream Home Paints",
      status: "Offline",
      location: "Lahore",
      rating: 4.1,
      reviews: ["Bright colors", "Polite workers"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Modern Coats",
      status: "Online",
      location: "Islamabad",
      rating: 4.3,
      reviews: ["Smooth brush work", "Great service"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Premium Paint Pros",
      status: "Online",
      location: "Rawalpindi",
      rating: 4.0,
      reviews: ["Used top quality paint", "On-time"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Bright Brushers",
      status: "Online",
      location: "Peshawar",
      rating: 4.4,
      reviews: ["Nice detailing", "Creative team"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "City Color Masters",
      status: "Offline",
      location: "Quetta",
      rating: 4.2,
      reviews: ["Affordable", "Good coverage"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Happy Walls",
      status: "Online",
      location: "Sialkot",
      rating: 4.7,
      reviews: ["Excellent finish", "Very professional"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Elite Painters",
      status: "Offline",
      location: "Hyderabad",
      rating: 4.3,
      reviews: ["Reliable team", "No mess left behind"],
      imagePath: "assets/images/profile image icon.png",
    ),
  ];

    case 'Lighting':
  return [
    ServiceProvider(
      name: "Bright Light Services",
      status: "Online",
      location: "Karachi",
      rating: 4.4,
      reviews: ["Installed chandeliers", "Very bright setup"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "LightFix Pro",
      status: "Offline",
      location: "Lahore",
      rating: 4.1,
      reviews: ["Decorative lights", "Fast work"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "City Glow Electric",
      status: "Online",
      location: "Islamabad",
      rating: 4.5,
      reviews: ["Smart lighting setup", "Clean wiring"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Home Bright Solutions",
      status: "Online",
      location: "Rawalpindi",
      rating: 4.3,
      reviews: ["Energy-efficient lights", "Well done"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "EcoLight Installers",
      status: "Online",
      location: "Peshawar",
      rating: 4.2,
      reviews: ["Quick service", "Affordable pricing"],
      imagePath: "assets/images/profile image icon.png",
    ),
  ];

    case 'Bathroom Fit':
  return [
    ServiceProvider(
      name: "Bath Fit Experts",
      status: "Online",
      location: "Islamabad",
      rating: 4.5,
      reviews: ["Fitted new taps", "Stylish fitting"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Royal Bathroom",
      status: "Offline",
      location: "Sialkot",
      rating: 4.0,
      reviews: ["Good accessories", "Clean work"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Perfect Bath Interiors",
      status: "Online",
      location: "Karachi",
      rating: 4.3,
      reviews: ["Luxury fittings", "Neat installation"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Modern Bath Works",
      status: "Online",
      location: "Lahore",
      rating: 4.1,
      reviews: ["Quick and efficient", "Reasonable rates"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Crystal Bath Setup",
      status: "Online",
      location: "Faisalabad",
      rating: 4.6,
      reviews: ["Excellent service", "Highly skilled"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Bathroom Hub",
      status: "Offline",
      location: "Rawalpindi",
      rating: 4.2,
      reviews: ["Well organized team", "Good selection"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Elite Bath Fittings",
      status: "Online",
      location: "Multan",
      rating: 4.4,
      reviews: ["Stylish products", "Timely work"],
      imagePath: "assets/images/profile image icon.png",
    ),
    ServiceProvider(
      name: "Comfort Bath Solutions",
      status: "Online",
      location: "Hyderabad",
      rating: 4.0,
      reviews: ["Affordable", "Polite staff"],
      imagePath: "assets/images/profile image icon.png",
    ),
  ];

      default:
        return [
          ServiceProvider(
            name: "General Worker",
            status: "Online",
            location: "Pakistan",
            rating: 3.5,
            reviews: ["No specific category"],
            imagePath: "assets/images/profile image icon.png",
          ),
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final providers = getDummyProviders();

    return Scaffold(
      appBar: AppBar(
        title: Text('$category Providers'),
        backgroundColor: color,
      ),
      body: ListView.builder(
        itemCount: providers.length,
        itemBuilder: (context, index) {
          final provider = providers[index];
          final isOnline = provider.status.toLowerCase() == 'online';

        return Card(
  elevation: 2,
  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  child: ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    leading: CircleAvatar(
      radius: 28,
      backgroundImage: AssetImage(provider.imagePath),
    ),
    title: Text(
      provider.name,
      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
    ),
    subtitle: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 4),
        Row(
          children: [
            Icon(Icons.location_on, size: 14, color: Colors.grey),
            SizedBox(width: 4),
            Text(provider.location, style: TextStyle(fontSize: 13)),
          ],
        ),
        SizedBox(height: 4),
        Row(
          children: [
            ...List.generate(
              5,
              (index) => Icon(
                index < provider.rating.round()
                    ? Icons.star
                    : Icons.star_border,
                size: 16,
                color: Colors.amber,
              ),
            ),
            SizedBox(width: 6),
            Text(
              provider.rating.toString(),
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ],
        ),
      ],
    ),
    trailing: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.grey),
        SizedBox(height: 6),
        Text(
          provider.status,
          style: TextStyle(
            color: provider.status.toLowerCase() == 'online'
                ? Colors.green
                : Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ],
    ),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ProviderDetailScreen(
            provider: provider,
            color: color,
          ),
        ),
      );
    },
  ),
);

        },
      ),
    );
  }
}


class ProviderDetailScreen extends StatelessWidget {
  final ServiceProvider provider;
  final Color color;

  const ProviderDetailScreen({
    super.key,
    required this.provider,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(provider.name),
        backgroundColor: color,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(provider.imagePath),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  provider.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),

                
                Row(
                  children: [
                    Icon(Icons.location_on, color: color),
                    SizedBox(width: 6),
                    Text(provider.location, style: TextStyle(fontSize: 16)),
                  ],
                ),

                SizedBox(height: 10),

                
                Row(
                  children: [
                    Text("Status: ", style: TextStyle(fontSize: 16)),
                    Text(
                      provider.status,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: provider.status.toLowerCase() == 'online'
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10),

                
                Row(
                  children: [
                    Text("Rating: ", style: TextStyle(fontSize: 16)),
                    ...List.generate(
                      5,
                      (index) => Icon(
                        index < provider.rating.round()
                            ? Icons.star
                            : Icons.star_border,
                        color: Colors.orange,
                        size: 20,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(provider.rating.toString(), style: TextStyle(fontSize: 14)),
                  ],
                ),

                SizedBox(height: 20),
                Text(
                  "Customer Reviews",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Divider(),
                ...provider.reviews.map(
                  (review) => Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.comment, color: Colors.grey, size: 18),
                        SizedBox(width: 6),
                        Expanded(child: Text(review)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "Payment Methods",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.money, color: Colors.green),
                  title: Text("Cash"),
                ),
                ListTile(
                  leading: Icon(Icons.account_balance_wallet, color: Colors.orange),
                  title: Text("JazzCash"),
                ),
                ListTile(
                  leading: Icon(Icons.phone_android, color: Colors.purple),
                  title: Text("EasyPaisa"),
                ),
                ListTile(
                  leading: Icon(Icons.account_balance, color: Colors.blue),
                  title: Text("Bank Transfer"),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ChatScreen(providerName: provider.name),
                          ),
                        );
                      },
                      icon: Icon(Icons.chat_bubble_outline),
                      label: const Text("Chat"),
                      style: ElevatedButton.styleFrom(backgroundColor: color),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Calling ${provider.name}...")),
                        );
                      },
                      icon: const Icon(Icons.call),
                      label: const Text("Call"),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

