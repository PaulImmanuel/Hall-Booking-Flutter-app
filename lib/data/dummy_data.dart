// lib/data/dummy_data.dart
import 'package:flutter/material.dart'; // <-- ADD THIS IMPORT
import '../models/hall_model.dart';
import '../models/booking_model.dart';

// This is our fake database
final List<Hall> dummyHalls = [
  Hall(
    id: "h1",
    name: "Grand Royal Hall",
    location: "Coimbatore, Tamil Nadu",
    imagePath: "assets/images/hall_1.jpeg",
    price: 50000,
    rating: 4.8,
    reviewCount: 120,
    // ADD THIS 'facilities' LIST
    facilities: [
      {'name': 'A/C', 'icon': Icons.ac_unit},
      {'name': 'Parking', 'icon': Icons.local_parking},
      {'name': 'Food', 'icon': Icons.fastfood},
      {'name': 'Wi-Fi', 'icon': Icons.wifi},
      {'name': '500 Seats', 'icon': Icons.people},
    ],
  ),
  Hall(
    id: "h2",
    name: "The Majestic Palace",
    location: "Chennai, Tamil Nadu",
    imagePath: "assets/images/hall_2.jpeg",
    price: 75000,
    rating: 4.9,
    reviewCount: 230,
    // ADD THIS 'facilities' LIST
    facilities: [
      {'name': 'A/C', 'icon': Icons.ac_unit},
      {'name': 'Parking', 'icon': Icons.local_parking},
      {'name': 'Food', 'icon': Icons.fastfood},
      {'name': 'DJ', 'icon': Icons.music_note},
      {'name': '1000 Seats', 'icon': Icons.people},
      {'name': 'Wi-Fi', 'icon': Icons.wifi},
    ],
  ),
  Hall(
    id: "h3",
    name: "Green Valley Resort",
    location: "Ooty, Tamil Nadu",
    imagePath: "assets/images/hall_3.jpeg",
    price: 60000,
    rating: 4.7,
    reviewCount: 95,
    // ADD THIS 'facilities' LIST
    facilities: [
      {'name': 'A/C', 'icon': Icons.ac_unit},
      {'name': 'Food', 'icon': Icons.fastfood},
      {'name': 'Wi-Fi', 'icon': Icons.wifi},
      {'name': '300 Seats', 'icon': Icons.people},
    ],
  ),
  Hall(
    id: "h4",
    name: "Sunset View Auditorium",
    location: "Kovalam, Kerala",
    imagePath: "assets/images/hall_4.jpeg",
    price: 45000,
    rating: 4.6,
    reviewCount: 80,
    // ADD THIS 'facilities' LIST
    facilities: [
      {'name': 'A/C', 'icon': Icons.ac_unit},
      {'name': 'Parking', 'icon': Icons.local_parking},
      {'name': '250 Seats', 'icon': Icons.people},
    ],
  ),
];


// This is our fake list of bookings
final List<Booking> dummyBookings = [
  Booking(
    bookingId: "b1",
    hall: dummyHalls[0], // Grand Royal Hall
    date: DateTime.now().add(const Duration(days: 14)), // 2 weeks from now
    timeSlot: "Morning (9AM - 1PM)",
    amountPaid: 25000,
    paymentStatus: "Advance Paid",
  ),
  Booking(
    bookingId: "b2",
    hall: dummyHalls[3], // Sunset View Auditorium
    date: DateTime.now().add(const Duration(days: 30)), // 1 month from now
    timeSlot: "Evening (7PM - 11PM)",
    amountPaid: 45000,
    paymentStatus: "Full Payment",
  ),
];