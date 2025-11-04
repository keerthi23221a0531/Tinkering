import 'package:flutter/material.dart';

void main() => runApp(const HospitalApp());

class HospitalApp extends StatelessWidget {
  const HospitalApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Hospital UI',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.teal, fontFamily: 'Poppins'),
        home: const HomeScreen(),
      );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Hospital Dashboard')),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            SectionTitle('Doctors'),
            DoctorCard('Dr. Smith', 'Cardiologist', 'https://via.placeholder.com/150', 'Dr. Smith is a senior cardiologist with 10 years experience.'),
            DoctorCard('Dr. Lisa', 'Pediatrician', 'https://via.placeholder.com/150', 'Dr. Lisa specializes in child health and wellness.'),
            SizedBox(height: 20),
            SectionTitle('Services'),
            ServiceCard('Emergency', Icons.local_hospital, 'Emergency services available 24/7 for urgent care.'),
            ServiceCard('Pharmacy', Icons.medical_services, 'Get all prescription medicines and health products here.'),
            SizedBox(height: 20),
            SectionTitle('Appointments'),
            AppointmentCard('John Doe', '10:00 AM', 'Appointment with Dr. Smith regarding heart checkup.'),
            AppointmentCard('Jane Smith', '11:30 AM', 'Appointment with Dr. Lisa for child vaccination.'),
          ],
        ),
      );
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle(this.title, {super.key});
  @override
  Widget build(BuildContext context) =>
      Padding(padding: const EdgeInsets.symmetric(vertical: 8), child: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)));
}

class DoctorCard extends StatelessWidget {
  final String name, specialty, image, info;
  const DoctorCard(this.name, this.specialty, this.image, this.info, {super.key});
  @override
  Widget build(BuildContext context) => Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          leading: CircleAvatar(backgroundImage: NetworkImage(image)),
          title: Text(name),
          subtitle: Text(specialty),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => InfoScreen(name, info))),
        ),
      );
}

class ServiceCard extends StatelessWidget {
  final String service, info;
  final IconData icon;
  const ServiceCard(this.service, this.icon, this.info, {super.key});
  @override
  Widget build(BuildContext context) => Card(
        color: Colors.teal[50],
        margin: const EdgeInsets.symmetric(vertical: 6),
        child: ListTile(
          leading: Icon(icon, color: Colors.teal),
          title: Text(service),
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => InfoScreen(service, info))),
        ),
      );
}

class AppointmentCard extends StatelessWidget {
  final String patient, time, info;
  const AppointmentCard(this.patient, this.time, this.info, {super.key});
  @override
  Widget build(BuildContext context) => Card(
        color: Colors.orange[50],
        margin: const EdgeInsets.symmetric(vertical: 6),
        child: ListTile(
          title: Text(patient),
          subtitle: Text('Appointment at $time'),
          trailing: const Icon(Icons.check_circle, color: Colors.green),
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => InfoScreen(patient, info))),
        ),
      );
}

class InfoScreen extends StatelessWidget {
  final String title, info;
  const InfoScreen(this.title, this.info, {super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Padding(padding: const EdgeInsets.all(16), child: Text(info, style: const TextStyle(fontSize: 18))),
      );
}
