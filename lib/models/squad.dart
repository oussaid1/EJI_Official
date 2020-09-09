import 'package:EJI/models/player.dart';
import 'package:EJI/settings/params.dart';

class Squad {
  String id;
  int count;
  Player pGK;
  Player pCB5;
  Player pCB4;
  Player pLB;
  Player pRB;
  Player pDMF;
  Player pCMF1;
  Player pCMF2;
  Player pLMF;
  Player pRMF;
  Player pAMF;
  Player pRWF;
  Player pLWF;
  Player pSS;
  Player pCF;

  int toRemove = 0;
  Player getPlayerX(List<Player> l, String a) {
    Player plr;
    int p = 0;

    if (l.indexWhere((us) => positions[us.position].startsWith(a, 0)) > 0) {
      p = l.indexWhere((us) => positions[us.position].startsWith(a, 0));

      plr = l[p];

      l.removeAt(p);
    } else {
      plr = new Player.dummy(positionsInvers[a]);
    }
    return plr;
  }

  Squad.main433({List<Player> list11Players}) {
    this.pGK = getPlayerX(list11Players, 'a');
    this.pCB5 = getPlayerX(list11Players, 'd');

    this.pCB4 = getPlayerX(list11Players, 'd');
    this.pRB = getPlayerX(list11Players, 'b');
    this.pLB = getPlayerX(list11Players, 'c');
    this.pDMF = getPlayerX(list11Players, 'f');
    this.pCMF1 = getPlayerX(list11Players, 'h');

    this.pCMF2 = getPlayerX(list11Players, 'h');
    this.pRMF = getPlayerX(list11Players, 'i');
    this.pLMF = getPlayerX(list11Players, 'g');
    this.pLWF = getPlayerX(list11Players, 'j');
    this.pRWF = getPlayerX(list11Players, 'l');
    this.pSS = getPlayerX(list11Players, 'k');
    this.pCF = getPlayerX(list11Players, 'm');
  }

  Squad.dummy() {
    this.pGK = new Player.dummy('GK');
    this.pCB5 = new Player.dummy('CB');
    this.pCB4 = new Player.dummy('CB');
    this.pRB = new Player.dummy('RB');
    this.pLB = new Player.dummy('LB');
    this.pDMF = new Player.dummy('DMF');
    this.pCMF1 = new Player.dummy('CMF');
    this.pCMF2 = new Player.dummy('CMF');
    this.pAMF = new Player.dummy('AMF');
    this.pRMF = new Player.dummy('RMF');
    this.pLMF = new Player.dummy('LMF');
    this.pLWF = new Player.dummy('LWF');
    this.pRWF = new Player.dummy('RWF');
    this.pSS = new Player.dummy('SS');
    this.pCF = new Player.dummy('CF');
  }
  Squad.main442({List<Player> list11Players}) {
    this.pGK = getPlayerX(list11Players, 'a');
    this.pCB5 = getPlayerX(list11Players, 'd');
    list11Players.removeAt(toRemove);
    this.pCB4 = getPlayerX(list11Players, 'd');
    this.pRB = getPlayerX(list11Players, 'b');
    this.pLB = getPlayerX(list11Players, 'c');
    this.pDMF = getPlayerX(list11Players, 'f');
    this.pCMF1 = getPlayerX(list11Players, 'h');
    list11Players.removeAt(toRemove);
    this.pCMF2 = getPlayerX(list11Players, 'h');
    this.pRMF = getPlayerX(list11Players, 'i');
    this.pSS = getPlayerX(list11Players, 'k');
    this.pCF = getPlayerX(list11Players, 'm');
  }
}
