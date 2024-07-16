import 'package:flutter/material.dart';



class ServicePage extends StatelessWidget {
  final List<Service> services = [
    Service('Career Counseling', Icons.business_center),
    Service('Interview Training', Icons.school),
    Service('Visa Documentation', Icons.description),
    Service('Accommodation', Icons.home),
    Service('Language Training', Icons.language),
    Service('Pre-Departure Briefing', Icons.flight_takeoff),
    Service('Placement Support', Icons.work),
    Service('Bank Loan Assistance', Icons.attach_money),
    Service('University and Course Selection', Icons.account_balance),
    Service('Scholarship Assistance', Icons.card_giftcard),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: GradientText(
            'Our Services',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  blurRadius: 10.0,
                  color: Colors.black.withOpacity(0.5),
                  offset:const Offset(2.0, 2.0),
                ),
              ],
            ),
            gradient: const LinearGradient(
              colors: [Colors.red, Colors.black],
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: services.length,
        itemBuilder: (context, index) {
          return ServiceCard(
            title: services[index].title,
            icon: services[index].icon,
          );
        },
      ),
    );
  }
}

class Service {
  final String title;
  final IconData icon;

  Service(this.title, this.icon);
}

class ServiceCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const ServiceCard({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(
                icon,
                size: 40,
                color: Colors.black12,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: GradientText(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  gradient: LinearGradient(
                    colors: [Colors.red.shade400, Colors.black],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Gradient gradient;

  const GradientText(
      this.text, {
        required this.style,
        required this.gradient,
      });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
