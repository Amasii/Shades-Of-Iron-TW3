
class CShadesInitializer extends CEntityMod {
  default modName = 'Shades Of Iron';
  default modAuthor = "Skydoespoint";
  default modUrl = "http://www.nexusmods.com/witcher3/mods/0000";
  default modVersion = '0.1';

  default logLevel = MLOG_DEBUG;

  default template = "dlc\modtemplates\dlcsoi\data\soi_init.w2ent";
}

function modCreate_ShadesOfIron() : CMod {
  return new CShadesInitializer in thePlayer;
}

statemachine class CShades extends CEntity {
  event OnSpawned(spawn_data: SEntitySpawnData) {
    var ents: array<CEntity>;

    LogChannel('modShades', "modShades spawned");

    theGame.GetEntitiesByTag('ShadesTag', ents);

    if (ents.Size() > 1) {
      this.Destroy();
    }
    else {
      this.AddTag('ShadesTag');

      // add our own code
    }
  }
}

function getShades(out shades_entity: CShades): bool {
  var entities : array<CEntity>;

  theGame.GetEntitiesByTag('ShadesTag', entities);
		
  if (entities.Size() == 0) {
    LogAssert(false, "No entity found with tag <ShadesTag>" );
    
    return false;
  }

  shades_entity = (CShades)entities[0];

  return true;
}

