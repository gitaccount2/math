name: 'math'
description: 'Extensions to CommonJS "Math" module'

keywords: ['math']

version: require('fs').readFileSync('./VERSION', 'utf8')

author: 'Feisty Studios <math@feistystudios.com> (http://feistystudios.com/)'

licenses: [
  {
    type: 'FEISTY'
    url: 'http://github.com/feisty/license/raw/master/LICENSE'
  }
]

contributors: [
  'Nicholas Kinsey <nicholas.kinsey@feistystudios.com>'
  'Nathan Rashleigh <nathan.rashleigh@feistystudios.com>'
]

repository:
  type: 'git'
  url: 'http://github.com/feisty/math.git'
  private: 'git@github.com:feisty/math.git'
  web: 'http://github.com/feisty/math'

bugs:
  mail: 'math@feistystudios.com'
  web: 'http://github.com/feisty/math/issues'
  
directories:
  lib: './lib'
  doc: './doc'
  
main: 'lib/index.js'

scripts:
  test: 'cake test'
  postinstall: 'cake init'
  
dependencies:
  'coffee-script': '>= 1.1.1 < 1.2'
  'vows': '*'
  
engines:
  node: '>= 0.4.9 < 0.5'
  npm: '>= 1.0.15 < 1.1'