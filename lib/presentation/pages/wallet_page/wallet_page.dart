import 'package:flix_id/presentation/misc/methods.dart';
import 'package:flix_id/presentation/pages/wallet_page/methods/recent_transaction.dart';
import 'package:flix_id/presentation/pages/wallet_page/methods/wallet_card.dart';
import 'package:flix_id/presentation/providers/router/router_provider.dart';
import 'package:flix_id/presentation/providers/user_data/user_data_provider.dart';
import 'package:flix_id/presentation/widgets/back_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WalletPage extends ConsumerWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
            child: Column(
              children: [
                BackNavigationBar(
                  title: 'My Wallet',
                  onTap: () => ref.read(routerProvider).pop(),
                ),
                verticalSpace(24),
                wallterCard(ref),
                verticalSpace(24),
                ...recentTransactions(ref),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
