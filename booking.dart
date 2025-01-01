import 'package:flutter/material.dart';

class Booking {
  final String name;
  final String phoneNumber;
  final DateTime dateTime;
  final String location;

  const Booking({
    required this.name,
    required this.phoneNumber,
    required this.dateTime,
    required this.location,
  });
}

class BookingForm extends StatefulWidget {
  final Function(Booking) onBookingSubmitted;

  const BookingForm({Key? key, required this.onBookingSubmitted})
      : super(key: key);

  @override
  State<BookingForm> createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  DateTime _dateTime = DateTime.now();
  String _location = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(labelText: "Phone Number"),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text("Date & Time: "),
                TextButton(
                  onPressed: () async {
                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: _dateTime,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null) {
                      final TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(_dateTime),
                      );
                      if (pickedTime != null) {
                        setState(() {
                          _dateTime = DateTime(
                            pickedDate.year,
                            pickedDate.month,
                            pickedDate.day,
                            pickedTime.hour,
                            pickedTime.minute,
                          );
                        });
                      }
                    }
                  },
                  child: Text(
                    "${_dateTime.toLocal().toIso8601String().split('T')[0]} ${_dateTime.toLocal().toIso8601String().split('T')[1].split('.')[0]}",
                    style: const TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            TextField(
              onChanged: (value) {
                setState(() {
                  _location = value;
                });
              },
              decoration: const InputDecoration(labelText: "Location"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (_nameController.text.isNotEmpty &&
                    _phoneNumberController.text.isNotEmpty &&
                    _location.isNotEmpty) {
                  final booking = Booking(
                    name: _nameController.text,
                    phoneNumber: _phoneNumberController.text,
                    dateTime: _dateTime,
                    location: _location,
                  );
                  widget.onBookingSubmitted(booking);
                  _nameController.clear();
                  _phoneNumberController.clear();
                  _location = "";
                }
              },
              child: const Text("Book Now"),
            ),
          ],
        ),
      ),
    );
  }
}
