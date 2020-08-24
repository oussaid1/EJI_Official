import 'package:EJI/model/player.dart';
import 'package:EJI/settings/params.dart';

class Squad {
  String id;
  Player pGK;
  Player pCB5;
  Player pCB4;
  Player pLB;
  Player pRB;
  Player pDMF;
  Player pCMF;
  Player pLMF;
  Player pRMF;
  Player pAMF;
  Player pRWF;
  Player pLWF;
  Player pSS;
  Player pCF;

  int toRemove = 0;
  Player getPlayerX(List<Player> l, String a) {
    int p = 0;

    if (l.indexWhere((us) => positions[us.position].startsWith(a.trim(), 0)) >
        0) {
      p = l.indexWhere((us) => positions[us.position].startsWith(a.trim(), 0));
      toRemove = p;
      return l[p];
    } else {
      return new Player.dummy();
    }
  }

  Squad.main433({List<Player> list11Players}) {
    this.pGK = getPlayerX(list11Players, 'a');
    this.pCB5 = getPlayerX(list11Players, 'd');
    list11Players.removeAt(toRemove);
    this.pCB4 = getPlayerX(list11Players, 'd');
    this.pRB = getPlayerX(list11Players, 'b');
    this.pLB = getPlayerX(list11Players, 'c');
    this.pCMF = getPlayerX(list11Players, 'h');
    this.pRMF = getPlayerX(list11Players, 'i');
    this.pLMF = getPlayerX(list11Players, 'g');
    this.pLWF = getPlayerX(list11Players, 'j');
    this.pRWF = getPlayerX(list11Players, 'l');
    this.pCF = getPlayerX(list11Players, 'm');
    print(this.pRB.toMap());
  }

  Squad.main4123({
    this.id,
    this.pGK,
    this.pCB5,
    this.pCB4,
    this.pRB,
    this.pLB,
    this.pAMF,
    this.pCF,
    this.pCMF,
    this.pDMF,
    this.pLMF,
    this.pLWF,
    this.pRMF,
    this.pRWF,
    this.pSS,
  });
}
