
=begin 

puts 'teste'
#comentário
nome = 'Marcelo'
puts nome.downcase
puts nome.downcase!
puts nome 


Só  chamadas neste arquivo agora 
=end

#Deveria ter copiado os testes de comandos para não perder o histórico
# provisionamento = commission / decomission

#Exemplo de script

require './def_digital_ocean_cloud'

autenticar("https://digitalocean.com/api/v1.0/","user","pass")
enviar_email(:autenticacao) 
provisionar()
enviar_email(:provisionamento)

