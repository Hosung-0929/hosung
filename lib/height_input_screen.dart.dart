import 'package:flutter/material.dart';
import 'package:dev/weight_input_screen.dart'; // 다음 화면에 해당하는 파일을 임포트합니다.

class HeightInputScreen extends StatefulWidget {
  @override
  _HeightInputScreenState createState() => _HeightInputScreenState();
}

class _HeightInputScreenState extends State<HeightInputScreen> {
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
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            _buildImage(),
            const SizedBox(height: 50),
            _buildTitle(),
            const SizedBox(height: 70),
            _buildHeightInput(),
            const SizedBox(height: 8),
            _buildUnderline(),
            const Spacer(),
            _buildNextButton(context),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: LinearProgressIndicator(
                value: 0.4,
                backgroundColor: Colors.grey[300],
                color: Colors.green,
                minHeight: 6.0,
              ),
            ),
          ),
          const SizedBox(width: 16),
          const Text(
            '次へ',
            style: TextStyle(fontSize: 16, color: Colors.lightGreen),
          ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Image.asset(
      'asset/img/scale.png',
      height: 100,
    );
  }

  Widget _buildTitle() {
    return const Text(
      'あなたの身長は ?',
      style: TextStyle(fontSize: 18, color: Colors.grey),
    );
  }

  Widget _buildHeightInput() {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            right: 5,
            child: const Text(
              'cm',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 25,
              ),
            ),
          ),
          SizedBox(
            width: 200,
            height: 30,
            child: TextField(
              cursorColor: Colors.lightGreen,
              controller: _controller,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 28),
              maxLength: 6, // 최대 길이 6
              showCursor: true,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: '',
                hintStyle: TextStyle(color: Colors.green),
                counterText: '', // 글자 수 카운터 텍스트 제거
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUnderline() {
    return Container(
      width: 100,
      height: 2,
      color: Colors.green, // 녹색 선 색상
    );
  }

  Widget _buildNextButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        decoration: BoxDecoration(
           // 연두색 배경 설정
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: ElevatedButton(
          onPressed: _isButtonEnabled
              ? () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WeightInputScreen(),
              ),
            );
          }
              : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: _isButtonEnabled ? Colors.lightGreen.withOpacity(0.5) : Colors.grey,
            minimumSize: const Size.fromHeight(50),
            elevation: 0,
          ),
          child: const Text(
            '次へ',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
