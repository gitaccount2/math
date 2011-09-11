CONSTRUCTOR = require './array'

Matrix4 = require './matrix4'

module.exports = Matrix3 =
  create: (args) ->
    m = new CONSTRUCTOR args or 9
    
    # Object.defineProperty m, 'm00', get: (=> @[0]), set: (=> @[0] = value)
    # Object.defineProperty m, 'm01', get: (=> @[1]), set: (=> @[1] = value)
    # Object.defineProperty m, 'm02', get: (=> @[2]), set: (=> @[2] = value)
    # Object.defineProperty m, 'm10', get: (=> @[3]), set: (=> @[3] = value)
    # Object.defineProperty m, 'm11', get: (=> @[4]), set: (=> @[4] = value)
    # Object.defineProperty m, 'm12', get: (=> @[5]), set: (=> @[5] = value)
    # Object.defineProperty m, 'm20', get: (=> @[6]), set: (=> @[6] = value)
    # Object.defineProperty m, 'm21', get: (=> @[7]), set: (=> @[7] = value)
    # Object.defineProperty m, 'm22', get: (=> @[8]), set: (=> @[8] = value)
  
  set: (m, out) ->
    [out[0], out[1], out[2], out[3], out[4], out[5], out[6], out[7], out[8]] = m
    
    return out
  
  identity: (out) ->
    out[0] = 1
    out[1] = 0
    out[2] = 0
    out[3] = 0
    out[4] = 1
    out[5] = 0
    out[6] = 0
    out[7] = 0
    out[8] = 1
  
    return out
    
  transpose: (m, out) ->
    if not out or m is out
      m01 = m[1]
      m02 = m[2]
      m12 = m[5]
      
      m[1] = m[3]
      m[2] = m[6]
      m[3] = m01
      m[5] = m[7]
      m[6] = m02
      m[7] = m12
      
      return m
      
    out[0] = mat[0]
    out[1] = mat[3]
    out[2] = mat[6]
    out[3] = mat[1]
    out[4] = mat[4]
    out[5] = mat[7]
    out[6] = mat[2]
    out[7] = mat[5]
    out[8] = mat[8]
    
    return out
  
  toMatrix4: (m, out) ->
    out ?= Matrix4.create()
    
    out[0] = m[0]
    out[1] = m[1]
    out[2] = m[2]
    out[3] = 0
    
    out[4]  = m[3]
    out[5]  = m[4]
    out[6]  = m[5]
    out[7]  = 0
  
    out[8]  = m[6]
    out[9]  = m[7]
    out[10] = m[8]
    out[11] = 0
  
    out[12] = 0
    out[13] = 0
    out[14] = 0
    out[15] = 1
  
    return out