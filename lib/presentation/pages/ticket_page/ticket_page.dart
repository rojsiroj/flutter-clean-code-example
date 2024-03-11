import 'package:flix_id/presentation/providers/transaction_data/transaction_data_provider.dart';
import 'package:flix_id/presentation/widgets/ticket.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TicketPage extends ConsumerWidget {
  const TicketPage({super.key});

  // TODO SHOW TICKET HISTORY, MAYBE USE TAB

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(24, 24, 24, 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: ref.watch(transactionDataProvider).when(
                data: (transactions) => (transactions
                        .where((element) =>
                            element.title != 'Top Up' &&
                            element.watchingTime! >=
                                DateTime.now().millisecondsSinceEpoch)
                        .toList()
                      ..sort(
                        (a, b) => a.watchingTime!.compareTo(b.watchingTime!),
                      ))
                    .map(
                      (transaction) => Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Ticket(transaction: transaction),
                      ),
                    )
                    .toList(),
                error: (error, stackTrace) => [],
                loading: () => const [CircularProgressIndicator()]),
          ),
        ),
      ],
    );
  }
}
