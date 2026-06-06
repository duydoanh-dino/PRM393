import 'package:flutter/material.dart';


// EXERCISE 2 – Input Controls Demo
// StatefulWidget quản lý trạng thái Slider, Switch, Radio,
// và DatePicker.

class InputControlsDemo extends StatefulWidget {
  const InputControlsDemo({super.key});

  @override
  State<InputControlsDemo> createState() => _InputControlsDemoState();
}

class _InputControlsDemoState extends State<InputControlsDemo> {
  // --- Trạng thái Slider (rating 0–100) ---
  double _sliderValue = 50;

  // --- Trạng thái Switch (active) ---
  bool _isActive = false;

  // --- Trạng thái Radio (thể loại phim) ---
  String? _selectedGenre; // null = chưa chọn

  // --- Trạng thái DatePicker ---
  DateTime? _selectedDate;

  /// Mở hộp thoại chọn ngày và lưu kết quả
  Future<void> _openDatePicker() async {
    final now = DateTime.now();
    // showDatePicker trả về DateTime? nếu người dùng xác nhận
    final picked = await showDatePicker(
      context: context, // BuildContext hợp lệ từ State
      initialDate: _selectedDate ?? now,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    // Chỉ cập nhật nếu người dùng đã chọn (không bấm Cancel)
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Exercise 2 – Input Controls')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ── Slider ──────────────────────────────────────────
          Text('Rating (Slider)', style: theme.textTheme.titleMedium),
          Slider(
            value: _sliderValue,
            min: 0,
            max: 100,
            divisions: 100,
            label: _sliderValue.round().toString(),
            // setState() đảm bảo UI re-render khi kéo slider
            onChanged: (v) => setState(() => _sliderValue = v),
          ),
          Text(
            'Current value: ${_sliderValue.round()}',
            textAlign: TextAlign.center,
          ),
          const Divider(height: 32),

          // ── Switch ──────────────────────────────────────────
          Text('Active Switch', style: theme.textTheme.titleMedium),
          SwitchListTile(
            title: const Text('Is movie active?'),
            value: _isActive,
            // setState() đảm bảo switch re-render ngay lập tức
            onChanged: (v) => setState(() => _isActive = v),
          ),
          const Divider(height: 32),

          // ── RadioListTile (Genre) ───────────────────────────
          Text('Genre (RadioListTitle)', style: theme.textTheme.titleMedium),
          RadioListTile<String>(
            title: const Text('Action'),
            value: 'Action',
            groupValue: _selectedGenre,
            onChanged: (v) => setState(() => _selectedGenre = v),
          ),
          RadioListTile<String>(
            title: const Text('Comedy'),
            value: 'Comedy',
            groupValue: _selectedGenre,
            onChanged: (v) => setState(() => _selectedGenre = v),
          ),
          RadioListTile<String>(
            title: const Text('Drama'),
            value: 'Drama',
            groupValue: _selectedGenre,
            onChanged: (v) => setState(() => _selectedGenre = v),
          ),
          Text(
            'Selected genre: ${_selectedGenre ?? 'None'}',
            textAlign: TextAlign.left,
          ),
          const Divider(height: 32),

          // ── DatePicker ──────────────────────────────────────
          // Text('Release Date', style: theme.textTheme.titleMedium),
          // const SizedBox(height: 8),
          ElevatedButton.icon(
            onPressed: _openDatePicker,
            icon: const Icon(Icons.calendar_today),
            label: const Text('Open Date Picker'),
          ),
          const SizedBox(height: 8),
          Text(
            _selectedDate != null
                ? 'Selected date: ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                : 'No date selected',
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}