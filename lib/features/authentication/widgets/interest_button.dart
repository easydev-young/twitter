import 'package:flutter/material.dart';
import 'package:onboarding_flow_part1/constants/sizes.dart';

class InterestButton extends StatefulWidget {
  const InterestButton({
    super.key,
    required this.interest,
    required this.toggleInterest,
  });

  final String interest;
  final Function toggleInterest;

  @override
  State<InterestButton> createState() => _InterestButtonState();
}

class _InterestButtonState extends State<InterestButton> {
  bool _isSelected = false;

  void _onTap() {
    setState(() {
      _isSelected = !_isSelected;
      widget.toggleInterest(widget.interest);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedContainer(
        width: 180,
        height: 80,
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: _isSelected ? Theme.of(context).primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(
            Sizes.size14,
          ),
          border: Border.all(
            color: Colors.black.withOpacity(0.1),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Sizes.size10,
                horizontal: Sizes.size10,
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  height: 50,
                  width: 110,
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    widget.interest,
                    style: TextStyle(
                      fontSize: Sizes.size16,
                      fontWeight: FontWeight.bold,
                      color: _isSelected ? Colors.white : Colors.black87,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
            if (_isSelected)
              const Positioned(
                top: 8,
                right: 8,
                child: Icon(
                  Icons.check_circle,
                  color: Colors.white,
                  size: Sizes.size24,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
