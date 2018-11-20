require 'sinatra'
require 'smarter_csv'
require 'sinatra/json'
require 'socket'

#definicao de URLs de servico
#onde cada resource responde
#/usuario/create
#/usuario/list
#/cliente
#/emails

#GET buscar
#POST grava 
#PUT atualizar (para recurso que já existe) 
#DELETE apagar 

#Restful (verbo + recurso) > o que fazer e com quem

#POST /usuario - cria novo usuário -> Rota, um caminho
#GET /usuario - lista todos os usuario 
#GET /usuario/:id_usuario - informacoes deste usuario
#PUT /usuario/:id_usuario - atualiza dados deste usuario
#DELETE /usuario/:id_usuario - remove este usuario

@@usuarios = [] 
#[{"user"=>"marcelo", "email"=>"andrioti@agirlab.com"}]    # senão vale só para este escopo (fora do métodos)

#Ultima Implementação: de tela em
get '/usuario/new' do  
    erb :usuario_new    #nome da tela que será criada 
end
# Trata-se de engine: erb (padrao de mercado) e haml 
# para ajudar nos testes 3a 

get '/'do 
    redirect '/usuario/new'
    # é a criação de um atalho
    # mostra 302 no stdout (=redirect) 
end

get "/usuarios" do
    # o que eu devolvo
    #"Listando informações de todos os usuários"
    # passando para view, quero que devolva uma tela 
    # aqui vai ter uma tela de listar usuários 
    # como não temos um banco para persistir os dados vamos gravar em uma 
        # variável na memória. 
    #json @@usuarios      #.to_s 
    erb :usuario_list 
    # up4 opção para uso de um leiaute específico 
    # (validar) erb :usuario_list, layout_options: {views: "views/app_layout"}, vai procurar em /views  
    # erb :usuario_list, layout: true  (vai procurar em /views/layout)  
end

# melhoria, correcao implementacao com parametro
# avanço com a implementação do segundo parametro /:_par1/:_par2
get "/usuario/:id_usuario/:id_funcao" do 
    puts "Conteudo var :: #{params[:id_usuario]}"
    puts "Tipo de entrada :: #{params[:id_usuario].class}" 
    puts params 
    puts params.class
    #Sinatra::IndifferentHash
    params[:id_usuario] + " HPD " + params[:id_funcao]
    #Lembrando que params é um hash 
    #Chamada browser: http://localhost:4567/usuario/Marcelo%20Andrioti/developer
    #{"id_usuario"=>"Marcelo Andrioti", "id_funcao"=>"developer"}

end

post "/usuario" do
    @@usuarios.push(params)
    #"criando usuário"
    #2a Vou tratar para mostrar os parametros 
    puts params  # devolvo no log, sem expor na aplicação. 
    puts params.class
    puts "Cadastrando usuário: #{params[:user]} , email: #{params[:email]}"
    #"Cadastrando usuário: #{params[:user]} , email: #{params[:email]}"
    #redirect '/usuario/new' Como inseri /new no list
    redirect '/usuarios'
    # Validar se é 303 o redirect do post 
    # por ultimo foi este ajuste do redirect para gerar um ciclo
end

get "/vlans" do
    vlans = SmarterCSV.process('../vlan.csv').to_s
end

get "/vlansj" do
    #vlans = SmarterCSV.process('../vlan.csv')
    #json :name => "Marcelo" > Na forma mais nativa (maa)
    # mostrando {"name":"Marcelo"}
    #falta converter vlans para devolver como json fazendo um parse
    #vlans = SmarterCSV.process('../vlan.csv').to_json #esta é para quem usa Rails
        # injeta um monte de coisa nova.. no teste que fiz retorna noisniff
    #puts um puts aqui sai no stdout (log na chamada do .rb) 
    vlans = SmarterCSV.process('../vlan.csv')  
    puts "vlans.class: #{vlans.class}"
    puts "vlans[0].class: #{vlans[0].class}"
    json vlans[0]    #pois este cara é um hash 
end

get "/hostname" do 
    Socket.gethostname
end

put "/usuario" do
end

delete "/usuario" do 
end 

