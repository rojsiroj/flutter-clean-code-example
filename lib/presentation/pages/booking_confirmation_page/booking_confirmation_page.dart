import 'package:flix_id/domain/entities/movie_detail.dart';
import 'package:flix_id/domain/entities/transaction.dart';
import 'package:flix_id/presentation/misc/constants.dart';
import 'package:flix_id/presentation/misc/methods.dart';
import 'package:flix_id/presentation/pages/booking_confirmation_page/methods/transaction_row.dart';
import 'package:flix_id/presentation/providers/router/router_provider.dart';
import 'package:flix_id/presentation/widgets/back_navigation_bar.dart';
import 'package:flix_id/presentation/widgets/network_image_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class BookingConfirmationPage extends ConsumerWidget {
  final (MovieDetail, Transaction) transactionDetail;

  const BookingConfirmationPage({required this.transactionDetail, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var (movieDetail, transaction) = transactionDetail;

    transaction = transaction.copyWith(
      total: transaction.ticketAmount! * transaction.ticketPrice! +
          transaction.adminFee,
    );

    final transactionRowWidth = MediaQuery.of(context).size.width - 48;

    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 40),
            child: Column(
              children: [
                BackNavigationBar(
                  title: 'Booking Confirmation',
                  onTap: () => ref.read(routerProvider).pop(),
                ),
                verticalSpace(24),
                NetworkImageCard(
                  width: transactionRowWidth,
                  height: (transactionRowWidth) * 0.6,
                  borderRadius: 15,
                  imageUrl:
                      'https://image.tmdb.org/t/p/w500${movieDetail.backdropPath ?? movieDetail.posterPath}',
                  fit: BoxFit.cover,
                ),
                verticalSpace(24),
                SizedBox(
                  width: transactionRowWidth,
                  child: Text(
                    transaction.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                verticalSpace(5),
                const Divider(
                  color: ghostWhite,
                ),
                verticalSpace(5),
                transactionRow(
                  title: 'Showing Date',
                  value: DateFormat('EEEE, d MMMM y').format(
                    DateTime.fromMillisecondsSinceEpoch(
                      transaction.watchingTime ?? 0,
                    ),
                  ),
                  width: transactionRowWidth,
                ),
                transactionRow(
                  title: 'Theater',
                  value: transaction.theaterName ?? '-',
                  width: transactionRowWidth,
                ),
                transactionRow(
                  title: 'Seat Numbers',
                  value: transaction.seats.join(', '),
                  width: transactionRowWidth,
                ),
                transactionRow(
                  title: '# of',
                  value: transaction.seats.join(', '),
                  width: transactionRowWidth,
                ),
                // summary
                verticalSpace(5),
                const Divider(
                  color: ghostWhite,
                ),
                verticalSpace(5),
                // total
                ElevatedButton(onPressed: () {}, child: const Text('Pay Now'))
              ],
            ),
          )
        ],
      ),
    );
  }
}
