// lib/models/booking_model.dart
import 'hall_model.dart'; // We need to know which hall was booked

class Booking {
  final String bookingId;
  final Hall hall; // The hall that was booked
  final DateTime date; // The date of the booking
  final String timeSlot; // The timeslot
  final double amountPaid;
  final String paymentStatus;

  Booking({
    required this.bookingId,
    required this.hall,
    required this.date,
    required this.timeSlot,
    required this.amountPaid,
    required this.paymentStatus,
  });
}