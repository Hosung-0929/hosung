import 'package:flutter/material.dart';

class EmailInputScreen extends StatefulWidget {
  @override
  _EmailInputScreenState createState() => _EmailInputScreenState();
}

class _EmailInputScreenState extends State<EmailInputScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _isButtonEnabled = false;
  bool _subscribeToEmails = true; // 초기 체크 상태

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
      String email = _controller.text.trim();
      bool isValidEmail = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
      _isButtonEnabled = email.isNotEmpty && isValidEmail;
    });
  }

  void _toggleSubscribe() {
    setState(() {
      _subscribeToEmails = !_subscribeToEmails;
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
                  value: 0.6,
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
            SizedBox(
              width: 800, // 너비를 조정하여 필요한 크기에 맞게 설정하세요
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'メールアドレス',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightGreen,
                    ),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    cursorColor: Colors.lightGreen,
                    controller: _controller, // 이메일 입력을 받기 위한 컨트롤러 사용
                    keyboardType: TextInputType.emailAddress, // 이메일 형식의 입력을 받도록 설정
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                      filled: true, // 배경을 채우도록 설정
                      fillColor: Colors.grey[200], // 회색 배경 설정
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none, // 외곽선 없음
                        borderRadius: BorderRadius.circular(8.0), // 모서리 둥글게 설정 (선택 사항)
                      ),

                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                  value: _subscribeToEmails,
                  onChanged: (value) {
                    _toggleSubscribe();
                  },
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  activeColor: Colors.lightGreen,
                ),
                GestureDetector(
                  onTap: () {
                    _toggleSubscribe();
                  },
                  child: Text(
                    '健康に関する情報やイベントメールを受け取る',
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ),
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ElevatedButton(
                onPressed: _isButtonEnabled
                    ? () {
                  // 다음 화면으로 이동하는 로직 추가
                  // 예: Navigator.push(context, MaterialPageRoute(builder: (context) => NextScreen()));
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
