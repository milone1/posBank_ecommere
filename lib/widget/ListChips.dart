import 'package:flutter/material.dart';

class ListChips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        spacing: 10.0, // gap between adjacent chips
        runSpacing: 9.0,
        children: [
          Chip(
            avatar: CircleAvatar(
              backgroundColor: Colors.grey.shade800,
              child: const Text('C'),
            ),
            label: const Text('Carnes'),
          ),
          Chip(
            avatar: CircleAvatar(
              backgroundColor: Colors.grey.shade800,
              child: const Text('C'),
            ),
            label: const Text('Carnes'),
          ),
          Chip(
            avatar: CircleAvatar(
              backgroundColor: Colors.grey.shade800,
              child: const Text('C'),
            ),
            label: const Text('Carnes'),
          ),
          Chip(
            avatar: CircleAvatar(
              backgroundColor: Colors.grey.shade800,
              child: const Text('C'),
            ),
            label: const Text('Carnes'),
          ),
          Chip(
            avatar: CircleAvatar(
              backgroundColor: Colors.grey.shade800,
              child: const Text('C'),
            ),
            label: const Text('Carnes'),
          ),
          Chip(
            avatar: CircleAvatar(
              backgroundColor: Colors.grey.shade800,
              child: const Text('C'),
            ),
            label: const Text('Carnes'),
          ),
        ],
      ),
    );
  }
}
