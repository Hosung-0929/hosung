import 'package:flutter/material.dart';
import 'package:dev/email_input_screen.dart'; // 다음 화면에 해당하는 파일을 임포트합니다.

class WeightInputScreen extends StatefulWidget {
  @override
  _WeightInputScreenState createState() => _WeightInputScreenState();
}

class _WeightInputScreenState extends State<WeightInputScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_checkButtonState);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _checkButtonState() {
    setState(() {
      _isButtonEnabled = _controller.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // 뒤로가기 버튼을 누르면 이전 화면으로 이동
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(3.0),
                child: LinearProgressIndicator(
                  value: 0.5,
                  backgroundColor: Colors.grey[300],
                  color: Colors.green,
                  minHeight: 6.0,
                ),
              ),
            ),
            SizedBox(width: 16),
            Text(
              '次へ',
              style: TextStyle(fontSize: 16, color: Colors.lightGreen),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Image.asset(
              'asset/img/weight.png',
              height: 100,
            ),
            SizedBox(height: 50),
            Text(
              'あなたの体重は ?',
              style: TextStyle(fontSize: 18, color: Colors.grey.shade700),
            ),
            Text(
              '大体でOKです。　後でいつでも変更できます。',
              style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
            ),
            SizedBox(height: 70),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  child: TextField(
                    cursorColor: Colors.lightGreen,
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 48),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '',
                      hintStyle: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
                Text(
                  'kg',
                  style: TextStyle(fontSize: 24, color: Colors.grey.shade700),
                ),
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ElevatedButton(
                onPressed: _isButtonEnabled
                    ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EmailInputScreen(),
                    ),
                  );
                }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen,
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text(
                  '次へ',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
