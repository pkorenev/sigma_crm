String.prototype.replaceAt = (index, character)->
  return this.substr(0, index) + character + this.substr(index+character.length);


String.prototype.toCamelCase = ()->
  s = this
  s = s.replace /[\s\-_](.)/g, ($1)-> return $1.toUpperCase();
  s = s.replace(/[\s\-_]/g, '')
  s = s.replace /^(.)/, ($1)->  return $1.toLowerCase();
  s

String.prototype.toUpperCamelCase = ()->
  s = this.toCamelCase()
  s = s.replaceAt(0, s[0].toUpperCase())
  return s



window.template_path = (path)->
  "/assets/views/#{path}.html"

window.controller_name = (name)->
  "#{name.toUpperCamelCase()}Controller"
