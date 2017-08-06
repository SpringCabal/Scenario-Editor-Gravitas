return {
  name = 'SpringBoard Gravitas',
  shortname = 'SB_GRR',
  game = 'SpringBoard Gravitas',
  shortGame = 'SB_GRR',
  description = 'SpringBoard for Gravitas',
  version = '$VERSION',
  mutator = 'Official',
  modtype = 1,
  depend = {
    --'rapid://gravitas:test',
    'Gravitas',
    --'rapid://sbc:test',
    'SpringBoard Core $VERSION',
  },
}
