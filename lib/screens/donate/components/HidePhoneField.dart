import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:centavo_tcc/stores/donate_store.dart';

class HidePhoneField extends StatelessWidget {
  HidePhoneField(this.donateStore);

  final DonateStore donateStore;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Row(
        children: [
          Observer(builder: (_) {
            return Checkbox(
              value: donateStore.hidePhone,
              onChanged: donateStore.setHidePhone,
              activeColor: Colors.amberAccent,
            );
          }),
          Expanded(
            child: Text(
              'Ocultar o meu telefone neste anúncio',
            ),
          )
        ],
      ),
    );
  }
}
