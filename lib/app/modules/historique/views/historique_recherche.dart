import 'package:chronohouse/app/data/constants/controllers.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class HistoriqueRecherche extends StatelessWidget {
  const HistoriqueRecherche({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 4.sp),
      child: CupertinoSearchTextField(
        controller: ctlHistorique.searchTF,
        onSubmitted: (value) {
          // FocusScope.of(context).unfocus();
        },
        itemSize: 30,
        placeholder: "Rue 14, Ontario",
        onTap: () {
          ctlHistorique.historiquesList.value =
              ctlHistorique.permanentHistoriquesList;
        },
        onChanged: (value) {
          ctlHistorique.rechercherPrediction(value);
        },
        onSuffixTap: () {
          FocusScope.of(context).unfocus();
          ctlHistorique.searchTF.text = "";
          ctlHistorique.historiquesList.value =
              ctlHistorique.permanentHistoriquesList;
        },
      ),
    );
  }
}
