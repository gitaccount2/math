CONSTRUCTOR = require './array'

module.exports = Vector3 =
  create: (args) ->
    v = new CONSTRUCTOR args or 3
    
    # Object.defineProperty v, 'x', get: (=> @[0]), set: ((value) => @[0] = value)
    # Object.defineProperty v, 'y', get: (=> @[1]), set: ((value) => @[1] = value)
    # Object.defineProperty v, 'z', get: (=> @[2]), set: ((value) => @[2] = value)
    
    return v
  
  set: (v, out) ->
    [out[0], out[1], out[2]] = v
    
    return v
  
  add: (a, b, out) ->
    if not out or a is out
      a[0] += b[0]
      a[1] += b[1]
      a[2] += b[2]
      
      return a
    
    else
      out[0] = a[0] + b[0]
      out[1] = a[1] + b[1]
      out[2] = a[2] + b[2]
      
      return out
  
  subtract: (a, b, out) ->
    if not out or a is out
      a[0] -= b[0]
      a[1] -= b[1]
      a[2] -= b[2]
      
      return a
    
    else
      out[0] = a[0] - b[0]
      out[1] = a[1] - b[1]
      out[2] = a[2] - b[2]
      
      return out

  negate: (v, out) ->
    out ?= v
    
    out[0] = -v[0]
    out[1] = -v[1]
    out[2] = -v[2]
    
    return out
  
  scale: (v, k, out) ->
    if not out or v is out
      v[0] *= k
      v[1] *= k
      v[2] *= k
      
      return v
    
    else
      out[0] = v[0] * k
      out[1] = v[1] * k
      out[2] = v[2] * k
    
      return out
  
  normalize: (v, out) ->
    out ?= v
    
    [x, y, z] = v
    
    magnitude = Math.sqrt x * x + y * y + z * z
    
    unless magnitude
      out[0] = 0
      out[1] = 0
      out[2] = 0
      
      return out
    
    else if magnitude is 1
      out[0] = x
      out[1] = y
      out[2] = z
      
      return out
    
    else
      magnitude = 1 / magnitude
      
      out[0] = x * magnitude
      out[1] = y * magnitude
      out[2] = z * magnitude
      
      return out
  
  cross: (a, b, out) ->
    out ?= v
    
    [a0, a1, a2] = a
    [b0, b1, b2] = b
    
    out[0] = a1 * b2 - a2 * b1
    out[1] = a2 * b0 - a0 * b2
    out[2] = a0 * b1 - a1 * b0
    
    return out
    
  length: (v) ->
    [x, y, z] = v
    
    return Math.sqrt x * x + y * y + z * z
  
  dot: (a, b) ->
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
  
  direction: (a, b, out) ->
    out ?= a
    
    x = a[0] - b[0]
    y = a[1] - b[1]
    z = a[2] - b[2]

    magnitude = Math.sqrt x * x + y * y + z * z

    unless magnitude
      out[0] = 0
      out[1] = 0
      out[2] = 0
      
      return out
    
    else
      magnitude = 1 / magnitude
      
      out[0] = x * magnitude
      out[1] = y * magnitude
      out[2] = z * magnitude
      
      return out
  
  lerp: (a, b, bias, out) ->
    out ?= a
    
    out[0] = a[0] + bias * (b[0] - a[0])
    out[1] = a[1] + bias * (b[1] - a[1])
    out[2] = a[2] + bias * (b[2] - a[2])
    
    return out