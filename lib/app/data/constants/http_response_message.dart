import 'package:chronohouse/app/data/models/result_dashboards_model.dart';
import 'package:chronohouse/app/data/models/result_predictions_model.dart';

import '../models/result_users_model.dart';
import '../models/resultat_model.dart';

/// `Toutes ces classes sont spécialement conçues pour`
/// `gérer les éventuelles erreurs lors de l'envoie ou`
/// `la réception des quetes http.`
/// `Le but est d'éviter les erreur de type [null] ou de``
/// `longs textes [404, 40x]`

class HttpResponseMessage {
  static const String success = 'SUCCESS';
  static const String exists = 'EXISTS';
  static const String notexists = 'NOT_EXISTS';
  static const String echec = 'ECHEC';
}

class DashboardHttpResultError {
  var error = ResultDashboards(
      resultat: Resultat(
        status: false,
        exists: false,
        message: HttpResponseMessage.echec,
      ),
      dashboards: []);
}

class PredictionHttpResultError {
  var error = ResultPredictions(
      resultat: Resultat(
        status: false,
        exists: false,
        message: HttpResponseMessage.echec,
      ),
      predictions: []);
}

class UserHttpResultError {
  var error = ResultUsers(
      resultat: Resultat(
        status: false,
        exists: false,
        message: HttpResponseMessage.echec,
      ),
      users: []);
}
