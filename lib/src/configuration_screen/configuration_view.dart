import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_hackaton/src/themes/custom_colors.dart';
import 'package:flutter_svg/svg.dart';

class ConfigurationScreen extends StatelessWidget {
  const ConfigurationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Configurações"),
          backgroundColor: CustomColors.mainBackground,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(2),
            child: Container(
              color: CustomColors.neutralColor70,
              height: 2,
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 23, 25, 28),
        body: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const SizedBox(height: 24),
            const InfoRow(info: "Toque nas opções para editar"),
            const SizedBox(height: 16),
            const SelectionItem(
              label: "Tempo da série",
              time: "00:20",
              icon_name: "weight_with_clock",
            ),
            const SizedBox(height: 8),
            const SelectionItem(
                label: "Quantidade de séries", time: "8", icon_name: "weight"),
            const SizedBox(height: 8),
            const SelectionItem(
                label: "Tempo de descanso",
                time: "00:10",
                icon_name: "couch-timer"),
            const SizedBox(height: 8),
            const SelectionItem(
                label: "Quantidade de ciclos", time: "1", icon_name: "refresh"),
            const SizedBox(height: 8),
            const SelectionItem(
                label: "Intervalo entre ciclos",
                time: "00:00",
                icon_name: "rest-disable"),
            const SizedBox(height: 8),
            const SelectionItem(
                label: "Tempo total",
                time: "04:00",
                icon_name: "complete-timer"),
          ],
        ));
  }
}

class SelectionItem extends StatefulWidget {
  final String label;
  final String time;
  final String icon_name;

  const SelectionItem(
      {Key? key,
      required this.label,
      required this.time,
      required this.icon_name})
      : super(key: key);
  @override
  _SelectionItemState createState() => _SelectionItemState();
}

class _SelectionItemState extends State<SelectionItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 56,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 34, 38, 42),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          const SizedBox(width: 16),
          SizedBox(
              height: 24,
              width: 24,
              child: SvgPicture.asset(
                  "assets/images/icons/${widget.icon_name}.svg")),
          const SizedBox(width: 8),
          Text(
            widget.label,
            style: const TextStyle(color: Colors.white),
          ),
          const Spacer(),
          Text(widget.time, style: const TextStyle(color: Colors.white)),
          const SizedBox(width: 16)
        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  const InfoRow({Key? key, required this.info}) : super(key: key);
  final String info;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 16),
        SizedBox(
            height: 16,
            width: 16,
            child: SvgPicture.asset("assets/images/icons/Info_fill.svg")),
        const SizedBox(width: 8),
        Text(info, style: const TextStyle(color: Colors.white))
      ],
    );
  }
}
