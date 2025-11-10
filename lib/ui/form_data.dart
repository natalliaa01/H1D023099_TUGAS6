import 'package:flutter/material.dart';
import 'tampil_data.dart';

class FormDataPage extends StatefulWidget {
  const FormDataPage({super.key});

  @override
  State<FormDataPage> createState() => _FormDataPageState();
}

class _FormDataPageState extends State<FormDataPage> {
  final _formKey = GlobalKey<FormState>();

  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _tahunLahirController = TextEditingController();

  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    _tahunLahirController.dispose();
    super.dispose();
  }

  void _simpan() {
    if (_formKey.currentState!.validate()) {
      final tahunLahir = int.parse(_tahunLahirController.text);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TampilDataPage(
            nama: _namaController.text.trim(),
            nim: _nimController.text.trim(),
            tahunLahir: tahunLahir,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Data'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Column(
              children: [
                // Card utama
                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.primary
                                      .withOpacity(0.12),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Icon(
                                  Icons.school_rounded,
                                  color: theme.colorScheme.primary,
                                  size: 26,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Data Mahasiswa',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      'Isi data di bawah ini lalu simpan untuk melihat perkenalan.',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _namaController,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              labelText: 'Nama',
                              prefixIcon: Icon(Icons.person_rounded),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Nama tidak boleh kosong';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 14),
                          TextFormField(
                            controller: _nimController,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              labelText: 'NIM',
                              prefixIcon: Icon(Icons.badge_rounded),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'NIM tidak boleh kosong';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 14),
                          TextFormField(
                            controller: _tahunLahirController,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.done,
                            decoration: const InputDecoration(
                              labelText: 'Tahun Lahir',
                              prefixIcon:
                                  Icon(Icons.calendar_today_rounded),
                              hintText: 'contoh: 2004',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Tahun lahir tidak boleh kosong';
                              }
                              if (int.tryParse(value) == null) {
                                return 'Tahun lahir harus berupa angka';
                              }
                              if (value.length != 4) {
                                return 'Gunakan format tahun 4 digit';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: _simpan,
                              child: const Text(
                                'Simpan',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Tugas 6 Pemrograman Mobile',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
