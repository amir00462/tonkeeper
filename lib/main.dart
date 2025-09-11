import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tonkeeper/features/wallet/presentation/bloc/wallet_bloc.dart';
import 'package:tonkeeper/features/wallet/presentation/bloc/wallet_status.dart';
import 'package:tonkeeper/locator.dart';

void main() async {
  await setup();
  runApp(
    MaterialApp(
      title: 'TonKeeper Project',
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [BlocProvider(create: (context) => locator<WalletBloc>())],
        child: Main(),
      ),
    ),
  );
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<WalletBloc>(context).add(FetchWalletData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: BlocBuilder<WalletBloc, WalletState>(
          builder: (context, state) {
            if (state.walletStatus is WalletLoading) {
              return Text("is loading ...");
            }

            if (state.walletStatus is WalletLoaded) {
              return Text("data fetched");
            }

            if (state.walletStatus is WalletError) {
              return Text('Error in Getting Wallet Data');
            }

            return Container();
          },
        ),
      ),
    );
  }
}
