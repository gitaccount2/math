name: 'math'
description: '''Geometrical (vector, matrix, quaternion) extensions to JavaScript's "Math" module'''

keywords: ['math', '3D', 'geometry', 'vector', 'matrix', 'quaternion']

version: (require 'fs').readFileSync './VERSION', 'utf8'

author: 'feisty <math@feisty.co> (feisty.co)'

licenses: [type: 'FEISTY', url: 'http://github.com/feisty/license/raw/master/LICENSE']

contributors: [
  'Nicholas Kinsey <nicholas.kinsey@feisty.co>'
  'Nathan Rashleigh <nathan.rashleigh@feisty.co>'
]

repository:
  type: 'git'
  url: 'http://github.com/feisty/math.git'
  private: 'git@github.com:feisty/math.git'
  web: 'http://github.com/feisty/math'

bugs:
  mail: 'math@feisty.co'
  web: 'http://github.com/feisty/math/issues'

main: 'index.coffee'

scripts:
  # postinstall: 'cake build'

engines:
  node: '~0.4.0'
  npm: '~1.0.0'