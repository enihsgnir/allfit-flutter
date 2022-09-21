import 'package:allfit_flutter/domains/user/user_repository.dart';
import 'package:allfit_flutter/views/main_controller.dart';
import 'package:allfit_flutter/widgets/default_app_bar.dart';
import 'package:allfit_flutter/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:kpostal/kpostal.dart';

class AddressSettingPage extends StatelessWidget {
  const AddressSettingPage({super.key});

  static const route = "/home/address_setting";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: KpostalView(
          appBar: const DefaultAppBar(title: "주소 설정"),
          callback: (result) async {
            final controller = MainController.to;
            final user = controller.currentUser;
            if (user != null) {
              controller.currentUser = await userRepository.updateAddress(
                user.id,
                result.roadAddress,
              );
            }

            showToast("주소 설정 완료");
          },
          useLocalServer: true,
          loadingColor: Colors.black,
        ),
      ),
    );
  }
}
