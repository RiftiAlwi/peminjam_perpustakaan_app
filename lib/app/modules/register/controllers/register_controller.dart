import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:peminjam_perpustakan_app/app/data/constant/endpoint.dart';
import 'package:peminjam_perpustakan_app/app/data/provider/api_provider.dart';


class RegisterController extends GetxController {
  //TODO: Implement AddBookController
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController telpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
   // final RegisterController _registerController= Get.find();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
  final loadingregister = false.obs;

  register() async {
    loadingregister(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState?.save();
      if (formKey.currentState!.validate()) {
        final response = await ApiProvider.instance().post(Endpoint.register,
            data:
            {
              "nama": namaController.text.toString(),
              "username": usernameController.text.toString(),
              "alamat": alamatController.text.toString(),
              "password": passwordController.text.toString(),
              "telp": int.parse(telpController.text.toString()),
            }
        );
        if (response.statusCode == 201) {
           // _registerController.getData();
          Get.back();
        } else {
          Get.snackbar("Sorry", "Login Gagal", backgroundColor: Colors.orange);
        }
      }
      loadingregister(false);
    } on dio.DioException catch (e) {
      loadingregister(false);
      Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
    } catch (e) {
      loadingregister(false);
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
      throw Exception('Error: $e');
    }
  }
}
