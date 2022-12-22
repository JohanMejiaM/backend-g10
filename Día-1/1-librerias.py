from camelcase import CamelCase

isntancia = CamelCase()

texto = 'hola yo deberia estar camel caseado'

resultado = isntancia.hump(texto)

print(resultado)