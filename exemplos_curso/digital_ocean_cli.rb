#puts ARGV.class
#puts ARGV.inspect
#puts ARGV[0]
#muitos desenvolvimentos de forma padrao para recebimento de variáveis
 

#Validar
#Projeto 
# Login para autenticacao 

#if ARGV[0] == 'Login' or ARGV[0] == 'login'

require './def_digital_ocean_cloud'

commands = ['Login','login']

#puts "conteudo de commands + #{commands} "
#puts "parametro recebido na passagem + #{ARGV[0]} "
#puts "index do conteudo + #{commands.index(ARGV[0])}"
=begin    
end
if commands.index(ARGV[0]) != nil 
    if commands.index(ARGV[0]) >= 0 
        puts "Rotina de autenticacao na Digital Ocean"
    end
end
=end

if ARGV[0] = 'login'
    autenticar("https://.....",ARGV[1],ARGV[2])
end








