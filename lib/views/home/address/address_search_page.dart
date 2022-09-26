import 'package:allfit_flutter/widgets/default_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kpostal/kpostal.dart';

class AddressSearchPage extends StatelessWidget {
  const AddressSearchPage({super.key});

  static const route = "/home/address/search";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: KpostalView(
          appBar: const DefaultAppBar(title: "주소 설정"),
          callback: (result) async {
            final arguments = Get.arguments as List<TextEditingController>?;
            if (arguments != null) {
              final postCodeEdit = arguments[0];
              final roadAddressEdit = arguments[1];

              postCodeEdit.text = result.postCode;
              roadAddressEdit.text = result.roadAddress;
            }
          },
          useLocalServer: true,
          loadingColor: Colors.black,
        ),
      ),
    );
  }
}
