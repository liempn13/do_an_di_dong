import 'package:do_an_di_dong/views/shared_layouts/base_screen.dart';
import 'package:flutter/material.dart';

class new_password_screen extends StatefulWidget {
  const new_password_screen({super.key});

  @override
  State<new_password_screen> createState() => _new_password_screenState();
}

class _new_password_screenState extends State<new_password_screen> {
  bool _anHienPass = true;
  bool _anHienPass2 = true;
  @override
  Widget build(BuildContext context) {
    return BasePage(
      backgroundColor: Colors.white,
      showAppBar: true,
      appBar: AppBar(
        title: const Text('Tạo mật khẩu mới',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          children: [
            const SizedBox(height: 30.0),
            // nhập mk
            TextField(
              //controller: ,
              obscureText: _anHienPass,
              decoration: InputDecoration(
                labelText: 'Mật khẩu mới',
                labelStyle: const TextStyle(
                color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    _anHienPass ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _anHienPass = !_anHienPass;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 16.0),
             TextField(
              //controller: ,
              obscureText: _anHienPass2,
              decoration: InputDecoration(
                labelText: 'Lặp lại mật khẩu mới',
                labelStyle: const TextStyle(
                color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    _anHienPass2 ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _anHienPass2 = !_anHienPass2;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            // Nút gửi
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                onPressed: () {
                  
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => OTP_forgot_password()));
                },
                child: const Text(
                  'Đặt lại mật khẩu',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}