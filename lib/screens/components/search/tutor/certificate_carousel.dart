import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CertificateCarousel extends StatelessWidget {
  final List<String> certificateUrls;

  CertificateCarousel({required this.certificateUrls});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Certificates:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        CarouselSlider(
          items: certificateUrls.map((url) {
            return Image.network(url, fit: BoxFit.cover);
          }).toList(),
          options: CarouselOptions(
            aspectRatio: 16 / 9, // Adjust aspect ratio as needed
            autoPlay: true,
            enlargeCenterPage: true,
            enableInfiniteScroll: false, // Set to true if you want infinite scroll
          ),
        ),
      ],
    );
  }
}
