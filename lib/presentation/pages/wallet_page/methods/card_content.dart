import 'package:flix_id/presentation/extensions/int_extension.dart';
import 'package:flix_id/presentation/misc/methods.dart';
import 'package:flix_id/presentation/providers/user_data/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget cardContent(WidgetRef ref) => Padding(
      padding: EdgeInsets.fromLTRB(20, 10, 50, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Current Balance',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
              Text(
                (ref.watch(userDataProvider).valueOrNull?.balance ?? 0)
                    .toIDRCurrencyFormat(),
                style: const TextStyle(
                  color: Color(0xFFEAA94E),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              verticalSpace(10),
              Text(ref.watch(userDataProvider).valueOrNull?.name ?? "")
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => ref.read(userDataProvider.notifier).topUp(100000),
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Color(0xFFEAA94E),
                  ),
                ),
              ),
              const Text(
                'Top Up',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                ),
              ),
            ],
          )
        ],
      ),
    );
