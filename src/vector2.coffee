CONSTRUCTOR = Float32Array or Array

module.exports = Vector2 =
  create: (args) ->
    v = new CONSTRUCTOR args or 2
    
    # Object.defineProperty v, 'x', get: (=> @[0]), set: ((value) => @[0] = value)
    # Object.defineProperty v, 'y', get: (=> @[1]), set: ((value) => @[1] = value)
    
    return v
  
  set: (v, out) ->
    [out[0], out[1]] = v
    
    return v
  
  add: (a, b, out) ->
    if not out or a is out
      a[0] += b[0]
      a[1] += b[1]
      
      return a
    
    out[0] = a[0] + b[0]
    out[1] = a[1] + b[1]
    
    return out
    
  subtract: (a, b, out) ->
    if not out or a is out
      a[0] -= b[0]
      a[1] -= b[1]
      
      return a
    
    else
      out[0] = a[0] - b[0]
      out[1] = a[1] - b[1]
      
      return out

  negate: (v, out) ->
    out ?= v
    
    out[0] = -v[0]
    out[1] = -v[1]
    
    return out
  
  scale: (v, k, out) ->
    if not out or v is out
      v[0] *= k
      v[1] *= k
      
      return v
    
    else
      out[0] = v[0] * k
      out[1] = v[1] * k
      
      return out
  
  normalize: (v, out) ->
    out ?= v
    
    [x, y] = v
    
    magnitude = Math.sqrt x * x + y * y
    
    unless magnitude
      out[0] = 0
      out[1] = 0
      
      return out
    
    else if magnitude is 1
      [out[0], out[1]] = v
      
      return out
    
    else
      magnitude = 1 / magnitude
      
      out[0] = x * magnitude
      out[1] = y * magnitude
      
      return out
  
  length: (v) ->
    [x, y] = v
    
    Math.sqrt x * x + y * y
  
  dot: (a, b) ->
    a[0] * b[0] + a[1] * b[1]
  
  direction: (a, b, out) ->
    out ?= a
    
    x = a[0] - b[0]
    y = a[1] - b[1]
    
    magnitude = Math.sqrt x * x + y * y
    
    unless magnitude
      out[0] = 0
      out[1] = 0
      return out
      
    magnitude = 1 / magnitude
    
    out[0] = x * magnitude
    out[1] = y * magnitude
    
    return out