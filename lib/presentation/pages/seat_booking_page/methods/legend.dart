import 'package:flix_id/presentation/misc/methods.dart';
import 'package:flix_id/presentation/widgets/seat.dart';
import 'package:flutter/material.dart';

Widget legend() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Seat(size: 20),
        horizontalSpace(5),
        const Text(
          'Available',
          style: TextStyle(fontSize: 12),
        ),
        horizontalSpace(10),
        const Seat(
          size: 20,
          status: SeatStatus.selected,
        ),
        horizontalSpace(5),
        const Text(
          'Selected',
          style: TextStyle(fontSize: 12),
        ),
        horizontalSpace(10),
        const Seat(
          size: 20,
          status: SeatStatus.reserved,
        ),
        horizontalSpace(5),
        const Text(
          'Reserved',
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
