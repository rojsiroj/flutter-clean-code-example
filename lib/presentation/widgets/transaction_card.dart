import 'package:flix_id/domain/entities/transaction.dart';
import 'package:flix_id/presentation/extensions/int_extension.dart';
import 'package:flix_id/presentation/misc/methods.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;
  const TransactionCard({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: transaction.title != 'Top Up'
                      ? NetworkImage(
                              'https://image.tmdb.org/t/p/w500${transaction.transactionImage}')
                          as ImageProvider
                      : const AssetImage('assets/topup.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat('EEEE, d MMMM y').format(
                      DateTime.fromMillisecondsSinceEpoch(
                          transaction.transactionTime!),
                    ),
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  verticalSpace(5),
                  Text(
                    transaction.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    transaction.title == 'Top Up'
                        ? '+ ${(-transaction.total).toIDRCurrencyFormat()}'
                        : transaction.total.toIDRCurrencyFormat(),
                    style: TextStyle(
                      color: transaction.title == 'Top Up'
                          ? const Color.fromARGB(255, 107, 237, 90)
                          : const Color(0xFFEAA94E),
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
