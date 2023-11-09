import 'package:flutter/material.dart';
import 'package:flutter_test_app/aprpos_section.dart';
import 'package:flutter_test_app/blog_section.dart';
import 'package:flutter_test_app/capture_section.dart';
import 'package:flutter_test_app/contact_section.dart';
import 'package:flutter_test_app/home_section.dart';
import 'package:flutter_test_app/service_section.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  final List<String> sections = [
    "Accueil",
    "A propos",
    "Nos services",
    "Capture d'écran",
    "Blog",
    "Témoignage",
    "Contact",
  ];
//
  final List<Widget> sectionBody = [
    const HomeSection(),
    const AproposSection(),
    const ServicesSection(),
    const CaptureSection(),
    const BlogSection(),
    const ContactSection()
  ];

  LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: sections.length,
      child: Scaffold(
        appBar: AppBar(
          //title: Text('Landing Page'),
          title: Row(
            children: [
              Image.asset("assets/images/super_app.png"),
              TabBar(
                isScrollable: true,
                tabs: sections.map((section) => Tab(text: section)).toList(),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: sections.map((section) {
            return Section(
              title: section,
              sectionBody: sectionBody,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class Section extends StatelessWidget {
  final String title;
  final List sectionBody;
  const Section({
    super.key,
    required this.title,
    required this.sectionBody,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      alignment: Alignment.center,
      color: _getRandomColor(),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          color: Colors.white,
        ),
      ),
    );
  }

  Color _getRandomColor() {
    return Color(
      (0xFF000000) | (const Color(0xFF000000).hashCode + title.hashCode),
    ).withOpacity(1.0);
  }
}
