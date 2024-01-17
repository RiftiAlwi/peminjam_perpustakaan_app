import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegisterView'),
        centerTitle: true,
      ),
      body: Form(
        key: controller.formKey,
        child: Column(
          children: [
            TextFormField(
              controller: controller.namaController,
              decoration: InputDecoration(
                hintText: "Masukkan Nama",
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Judul Tidak Boleh Kosong";
                }
                return null;
              },
            ),
            TextFormField(
              controller: controller.usernameController,
              //
              decoration: InputDecoration(
                hintText: "Masukkan Username",
              ),

              validator: (value) {
                if (value!.isEmpty) {
                  return "penulis Tidak Boleh Kosong";
                }
                return null;
              },
            ),
            TextFormField(
              obscureText: true,
              controller: controller.passwordController,
              //
              decoration: InputDecoration(
                hintText: "Masukkan Password",
              ),

              validator: (value) {
                if (value!.isEmpty) {
                  return "penerbit Tidak Boleh Kosong";
                }
                return null;
              },
            ),
            TextFormField(
              controller: controller.alamatController,
              //
              decoration: InputDecoration(
                hintText: "Masukkan Alamat",
              ),

              validator: (value) {
                if (value!.isEmpty) {
                  return "tahun terbit Tidak Boleh Kosong";
                }
                return null;
              },
            ),
            TextFormField(
              controller: controller.telpController,
              //
              decoration: InputDecoration(
                hintText: "Masukkan Nomor Telepon",
              ),

              validator: (value) {
                if (value!.isEmpty) {
                  return "tahun terbit Tidak Boleh Kosong";
                }
                return null;
              },
            ),
            Obx(() => controller.loadingregister.value
                ? CircularProgressIndicator()
                : ElevatedButton(
                onPressed: () {
                  controller.register();
                },
                child: Text("Register")))
          ],
        ),
      ),
    );
  }
}
