=begin
Dicas gerais da linguagem 
Aulas com Mateus Prado

Conexão no GITLAB: 
**Para um diretório já existente (1a rodada):
Dentro da pasta de arquivos 
>> git init
>> git remote add origin http://172.20.20.62/devops/exemplos_curso.git
>> git add .
>> git commit -m "Commit inicial"
>> git push -u origin master

**Para um repositório existente:






Métodos com ! e com ? 
Tem que declarar antes so métodos 
Convencao do método com parametro () que são opcionais 
Ruby nao precisa de ; 
Chamada de métodos não precisa de () por convencao nao usa  
sintaxe de concatenacao SHOW #{tipo_email} ele faz a troca dinamica 
Proximo passo de levar tudo para um arquivo de definicao usando require
Quando mando um simbolo concatenado no log sai como string, sem os : 
Tópico: Controle de fluxo (if....)
Comparacao ==
elsif OK
Tópico Listas e Hash (fonte Script0 para testes)
	Lista Ex Digital Ocean a lista de VMs 
	maquinas_virtuais = "srv01;sr02;sr3"
	Quero pegar uma e executar um bloco de código 
	Array com diversos tipos de dados 
	Inspect bom para debugar (modo melhor de ver a lista)
Olhar métodos split e slice para classe String

Tópico Hash 06/11/2018
Tipo de dado estruturado chave + valor 
Em outras linguagens JSON, hashmap, dictionary 
{:name=>"docker", :version=>"17.0.3", :description=>"docker daemon"} sintaxe padrao de apresentação, 
nas versões anteriores e atribuicao de valores era assim 

Tópico Iteração
Each
JSON.parse

> gem list  #lista as gemas instaladas
Local Gems 
bigdecimal (1.2.8)
CFPropertyList (2.2.8)
did_you_mean (1.0.0)
io-console (0.4.5)
json (1.8.3.1)
libxml-ruby (2.9.0)
minitest (5.8.5)
net-telnet (0.1.1)
nokogiri (1.5.6)
power_assert (0.2.6)
psych (2.1.0.1)
rake (10.4.2)
rdoc (4.2.1)
sqlite3 (1.3.11)
test-unit (3.1.5)

Uso de vartiavel de ambiente
aws_sk = ENV['AWS_SECRET_KEY']

_____
Aula 02
Exception 
Pilha Errono access
Exemplo de erro abrindo um arquivo que não existe: Errno::ENOENT 
ler_arquivo.rb:6:in `initialize': No such file or directory @ rb_sysopen - ./resolv.con (Errno::ENOENT)
        from ler_arquivo.rb:6:in `open'
        from ler_arquivo.rb:6:in `<main>'
Família de excessoes 

dica de uso de uma classe de trabalho com Files e DIrs 
FileUitls 
eg
begin
    #vou pegar tudo que está até o end e tratar
    #file = File.open("./resolv.conf")  # aqui funciona também só "resolv.conf"
    #puts file.read
    #puts File.open("./resolv.conf").read     #.class devolve String 
    #Tem biblioteca para ler .csv
    #.read = cat cuidado com arquivos gigantes 
    #outra forma é ler linha a linha
    #file2 = File.open("./resolv.conf")
    #.open posso especicifar o mode de abertura  (r, w...)
    #puts file2.class #devolve Class File 
    #Abrindo linha a linha
    file2 = File.open("./resolv.conf")
    file2.each do |l|  #faço a leitura linha a linha 
        puts l 
    end 
rescue Errno::ENOENT => e
    puts "erro ao ler arquivo. arquivo nao existe" #melhor que ver a stack trace
    puts e.message
rescue Exception => e
    puts "ocorreu um erro qualquer"
    puts e.message
end

Tópico: Recebimento de argumentos ARGV

Tópico: Uso de Case, when 
Usei em: kernel-cli.rb 

Dúvida: debug
 Existe uma biblioteca (gem) chamada pry
 Tem a RubyDebuger, mas com ultimo comit em 2011, ou seja 
   não é muito utilizada 
 Usamos muito Inspect (por convencao)
 Breakpoint > puts (mais usado)
PRY é uma GEM funciona como um IRB alternativo. 
 
ruby -r (e declara uma biblioteca que precisa ser executada)
eg

ruby -r debug kernel-cli.rb (vai carregar a biblioteca debug antes de rodar 
    o seu programa)
> ver se a biblioteca debug está instalada 
já abre a tela em breakpoint e consigo dar next no irb 
next pula 
list (mostra => em que ponto do programa está)
b 4 (seta um breakpoint na linha 4)
> Linguagem de script de um modo geral usa pouco debug, pois não tem compilação
>  os outputs (puts) já estão na mão, console....
Tópico ExitCodes  
> Ops se preocupa com isso 
> Devs não (nunca) se preocuparam com isso 

> Sucesso / Não sucesso
echo $? (retorno o último Exitcode) LastExitCode
> se rodou sem probleas=mas um ls por exemplo, retorna 0
> se uso uma opcao invalida retorna 1

> Gitlab CI, tem uma etapa de buildar 
>   Jenkings, Rundeck, Chef, Ansible 
> Se forço 1 já aviso que falhou para TODO mundo que chamou ou pode chamar
> Mesmo tratando script ele retorna 0 (deu erro para nossa lógica)
> exit(true) = 0 false = 1 
  
Tópico Datas
> Uso a classe Time 
> irb(main):001:0> Time.now
=> 2018-11-14 17:27:27 -0200
irb(main):002:0> Time.new
=> 2018-11-14 17:28:07 -0200
irb(main):003:0> Time.now.day
=> 14
irb(main):007:0> data_cadastro.day
=> 14
irb(main):008:0> data_cadastro.year
=> 2018
irb(main):009:0> 
data_cadastro.saturday?
data_cadastro.wday (numero que representa o dia da semana)
> Formato timestamps (formato numerico)
>   métodos conversores 
data.to_a [sec, min, hour, day, month, year, wday, yday, isdst, zone]
data.to_i segundos desde Epoch = Unix time 0 (midnight 1/1/1970)
irb(main):017:0> data_cadastro_ts = data_cadastro.to_i
=> 1542223810
irb(main):022:0> data_cadastro_serh = Time.at(data_cadastro_ts)
=> 2018-11-14 17:30:10 -0200
> Bom para uso com informação de log 
> Se precisar montar uma consulta no ElasticSearch Kibana,... 
Time.at([timestamp]) > 
> strftime(string) > string 
irb(main):031:0> data_formatada = data_cadastro.strftime("%d/%m/%Y")
=> "14/11/2018"
> datetime = para calculos com datas 
> DateTime.3.days.ago (ver se esta classe está instalada)
> time_difference
** Instalção de Bibliotecas
> Rubygems.org 
> $ gem install [gem name] 
irb(main):002:0> data_criacao = Time.new(2013,1)
=> 2013-01-01 00:00:00 -0200
irb(main):003:0> data_alteracao = Time.new(2014,4)
=> 2014-04-01 00:00:00 -0300
irb(main):004:0> require 'time_difference' (require)
=> true   (OK) 
TimeDifference.between(data_alteracao, data_criacao).in_years / days...
TimeDifference.between(data_alteracao, data_criacao).in_general 
=> {:years=>1, :months=>2, :weeks=>4, :days=>0, :hours=>22, :minutes=>12, :seconds=>36}
TimeDifference.between(data_alteracao, data_criacao).humanize
=> "1 Year, 2 Months, 4 Weeks, 22 Hours, 12 Minutes and 36 Seconds"

Tópico Gravação de Log
> Classe logger especifica para gravar log em arquivo 
>  Pode gerar para um syslog que vai para um ElasticSearch pex
>  fazer sair no stdout  
> Require de classes e bibliotecas = import, use.... de outras linguagens 
>  Para coisas diferentes do standard
** Troubleshooting com tail -f e | grep 
> logger.info, warn, error, fatal (interromper - deveria lançar um exitcode (1))
>   Nao deveria acontecer mais nada depois de um Fatal 
> ver doc da binblioteca Logger 
> Importante é tratar, dashboard por tipo de mensagem, medir o tipo de erro
>   Gerar métrica 
*** @logger.level = Logger::INFO no meu log tirou só DEBUG 
> ERROR, FATAL ...
** Dica: fazer um log para ser humano e um com TAGS para gerar dados > métricas 
> já esta implementado e comentado em def_.... 
> Para gerar um arquivo de log 
> por default vai appendando
file = File.open(cli.log)
@logger = Logger.new(file)
> ou (mais simples)
@logger = Logger.new(cli.log)
> Referencia de livro para a geracao de estatísticas de aplicação
> Show Me the Numbers autor: Stephen Few 


Tópico: Escopo de variáveis 
> var de escopo local nao persiste (exixte) dentro dos métodos 
nome = 'teste'
@nome (global, em qualquer local do script)
    > outras linguagens defini como public....
> ARGV no Ruby é uma constante 

AULA03 - 

Tópico:Ruby com Redes 
> Classe:  Socket, é uma classe não inicializada 
> Não dá informação de devices 
> Para dar informações de devides tem outro classe
> Preciso dizer que quero usar 
require 'socket'
> em minusculo!!! arquivo mesmo 
irb(main):004:0> require 'socket'
=> true
> sem extensão vai procurara na lib standard do Ruby
> <> de require './file.rb' 
irb(main):005:0> Socket
=> Socket > (require OK)
Socket.methods 
Socket.ip_address_list
> Lista de IPs da máquina que está executando o script
irb(main):014:0> Socket.ip_address_list[1].class
=> Addrinfo
irb(main):018:0> Socket.ip_address_list[0].ip_address
=> "127.0.0.1"
irb(main):019:0> Socket.ip_address_list.each do |ip|
irb(main):020:1* puts ip.ip_address
irb(main):021:1> end
127.0.0.1
::1
fe80::1%lo0
fe80::aede:48ff:fe00:1122%en5
fe80::472:92cc:38e3:e365%en0
10.0.1.27
fe80::58ff:fff:feeb:2b5d%awdl0
fe80::b9b:449a:ecea:883%utun0
fe80::3c42:ff8e:9db5:a34e%utun1
fe80::e58b:cffe:268b:3759%utun2
fe80::7052:2334:dc4d:d53b%utun3
10.20.21.6
> Get Host Name 
Socket.gethostname
Tópico Uso de Threads 
> Performar com scripts executando em paralelo. 
> Desde que não tenha concorrência  
> eg. Lista de arquivos > monto um array e vou locando (tirando sa lista)
> eg2. Banco de dados
> Testes em paralelismo.rb
> output fica alternado (muda a ordem do puts)
> Pensamento tem que ser posso execurar o que está dentro das chaves junto?
thr2 = Thread.new {
    puts "ola Thread=2"
}
> Para python dar uma olhada em corotines (já beixei no Dash)
> Status de Threads rodando 

Tópico GEMs 
> Bibliotecas 
> Java.. baixo um jar 
> rubygems.org (público), posso criar um dentro da empresa **
gem install cpf_cnpj 
> Se estivesse na máquina 
> Faço o download 1o (posso estar em um ambiente de proxy)

> Testes com um Gem da trata CSV 
SmarterCSV.process('./vlan.csv').each do |vlan|
    puts vlan[:description]  >trata como se fosse a estrutura de dicionário
#puts vlans.class
#puts vlans.inspect
end 
>> Comentou sobre lambida
> ** sobe um cache na sua maquina (o que você tem 0.0.0.0:8808)
gem server
> Para garantir que vai usar Gem de "dentro" da empresa, pode validar no 
> Jenkins (no CI para não buildar) para checar a linha do fonte e 
    > limar o que for rubygems.org
> Criando a sua própria Gem, seguinte estrutura:
% tree
.
├── hola.gemspec
└── lib
    └── hola.rb
> Gem: (dentro do lib - para o build)
% cat lib/hola.rb
class Hola
  def self.hi
    puts "Hello world!"
  end
end
> Gemspec file 
Gem::Specification.new do |s|
  s.name        = 'hola'
  s.version     = '0.0.0'
  s.date        = '2010-04-28'
  s.summary     = "Hola!"
  s.description = "A simple hello world gem"
  s.authors     = ["Nick Quaranto"]
  s.email       = 'nick@quaran.to'
  s.files       = ["lib/hola.rb"]
  s.homepage    =
    'http://rubygems.org/gems/hola'
  s.license       = 'MIT'
end
> Build 
% gem build hola.gemspec
Successfully built RubyGem
Name: hola
Version: 0.0.0
File: hola-0.0.0.gem
> Install 
% gem install ./hola-0.0.0.gem
Successfully installed hola-0.0.0
1 gem installed
> Pesquisar na lista 
gem list | grep hola 
> Teste no irb
% irb
>> require 'hola'
=> true
>> Hola.hi
Hello world!
> Voilá!!!
> No meu teste deu o mesmo erro que para o Mateus: 
irb(main):002:0> require 'codeops'
LoadError: cannot load such file -- codeops

>> Push da sua própria Gem no RubyGems 
> Ajustar o array de autores (gem owner code)
gem push codeops-0.1.0.gem 
**P Fazer uma gem para ajustar data no Grafana. 
> Homepage sempre levar para o GitHub, tem que saber o que o código faz
> Versão específica de ruby que precisa 
> diretóiro de testes (ver como dá para subir os testes para o GH [**P])

Tópico Dependências
> Programador novo da equipe, nossos códigos com dependencias 
> Gemfile (Arquivo que controla dependencias de um projeto) 
> Definir a origem das bibliotecas que uso
> gem 'csv', '~> 3.0' peguei como exemplo do RubyGems 
> Tenho que frisar a versão específica
> '2.9.1' ou '>= 2.9.1' (maior =)...
buldle install (se não funcionar instala a bundler)**
> se já tiver instalado vai aparecer using..
> vai gerar um Gemfile.lock (não mexer) mostra as versoes que usou
> Facilita por não ter que entrar arquivo .rb 1 a 1 para ver se tem require
bundle package (cria um dir vendor/cache com as gems requeridas pela sua app
** buldle help (bem completo) 
> vendorizar as Gems

Tópico Gem thor 
> Tratar if ou case, when, checando as entradas de ARGV 
> Biblioteca def (method) > já vira um argumento da CommandLine 
> exemplo e comentário 

Tópico Sinatra / Web
> Consumo e criação de APIs Rest
> Rails tem foco em web (deixou o ruby famoso) - pela simplicidade
> Rails cria um encapsulamento gigante ruby para web 
> Framework (caixa de ferramenta de Gems juntas) muito completo
> sinatrarb.com
> ruby-toolbox.com The Ruby Toolbox 
> rubyonrails.org 
> Sinatra também é um framework (famoso como o rails)
> Protocolo http : importante saber para qquer troubleshhooting 
> HTTP: requests e responses 
> protocolo: cabeçalho e conteúdo da requisição e da resposta 
> Status code em famílias 100 200 300 400 
> 200 = sucesso 
> 404 = serviço não existe, não encontrado 
> 500 falha do lado do servidor 
    > Tem que usar o protocolo de verdade!
> Restfull:
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
> Exemplo em app.rb (dir restfiul-ws)
> Fiz a instalacao do sinatra pelo gem install 
> Demora a inatalacao do ri documentation
sh-3.2# gem install sinatra
Fetching: tilt-2.0.8.gem (100%)
Successfully installed tilt-2.0.8
Fetching: rack-protection-2.0.4.gem (100%)
Successfully installed rack-protection-2.0.4
Fetching: mustermann-1.0.3.gem (100%)
Successfully installed mustermann-1.0.3
Fetching: sinatra-2.0.4.gem (100%)
Successfully installed sinatra-2.0.4
Parsing documentation for tilt-2.0.8
Installing ri documentation for tilt-2.0.8
Parsing documentation for rack-protection-2.0.4
Installing ri documentation for rack-protection-2.0.4
Parsing documentation for mustermann-1.0.3
Installing ri documentation for mustermann-1.0.3
Parsing documentation for sinatra-2.0.4
Installing ri documentation for sinatra-2.0.4
Done installing documentation for tilt, rack-protection, mustermann, sinatra after 214 seconds
> Para exibir array (vlans) com smarter_csv usei to_s
> Ensinou usando JSON, com requitre de sinatra/jason 
> Instalado de gem install sinatra-contrib
sh-3.2# gem install sinatra-contrib
Fetching: backports-3.11.4.gem (100%)
Successfully installed backports-3.11.4
Fetching: multi_json-1.13.1.gem (100%)
Successfully installed multi_json-1.13.1
Fetching: sinatra-contrib-2.0.4.gem (100%)
Successfully installed sinatra-contrib-2.0.4
Parsing documentation for backports-3.11.4
Installing ri documentation for backports-3.11.4
Parsing documentation for multi_json-1.13.1
Installing ri documentation for multi_json-1.13.1
Parsing documentation for sinatra-contrib-2.0.4
Installing ri documentation for sinatra-contrib-2.0.4
Done installing documentation for backports, multi_json, sinatra-contrib after 3 seconds
3 gems installed
> teste de POST e GET
> POST pelo curl > curl -XPOST http://localhost:4567/usuario
> Print da tela para mostrar o inspect com retorno json (Content-Typ do
    > Response header)
> No teste com curl (posso suprimir o GET)
> Se inserir -i curl hppt://localhost:4567/vlansj retorna:
HTTP/1.1 200 OK
Content-Type: application/json
X-Content-Type-Options: nosniff
Content-Length: 58
> Isso para vlans[0]
> Sendo: (do term de chamada do Sinatra)
vlans.class: Array
vlans[0].class: Hash  
> Ver referencia do postman, citado no curso 
> Complementei com metodos de put e delete
> Passagem de parametro   
get '/usuario/:id_usuario' do 
    puts params[:id_usuario]
end
> Esgotamos a parte de chamadas de código Ruby e execução de serviço  

> Tópico Interface Web / Templates e visualizações do Sinatra 
> Componentes / MVC (camada de exposição do que tem no banco de dados, 
    > camada de view e integração / 
    > Já vimos o controller 
> Passando para o V do MVC
> Exemplo na implementacao /usuario/new em app.rb 
> Por padrao o Sinatra vai procurar um dir chamado views 
<html>
    <body>
        <h1>Cadastro de Usuario</h1>
        <form method="POST" action="/usuario">
        # Quebrando aqui para explicar o verbo POST 
        # já chamando o que tem na escuta do Sinatra
            Nome:<br>
            <input type="text" name="user" id="user"/><br> 
            email:<br>
            <input type="text" name="email" id="email"/><br> 
            <input type="submit" value="Cadastrar"/>
        </form> 
    </body>
</html> 

> Ver várias implementacoes documentadas em app.rb
> Tópico de Escopo de variáveis, melhor explicado em 
    > https://www.sitepoint.com/understanding-scope-in-ruby/
    > Já está no bookmark 
> Diferenças dos acessos de local, @instancias e @@classes, o que cada uma 
    > precisa (de onde) para acessar 
> Retorno da lista (no erb) > implementado em usuario_list.erb
<html>
    <body>
        <h1>Usuarios Cadastrados</h1>
        <% puts 'teste'%>
        <%= "olá" %>   Com igual roda e dá retorno em "tela"
        > Tudo que estiver entre <%  %> é executado como código Ruby
> Técnica chamada binding, retorno
> Acrescento <p> para quebrar a linha no exemplo do olá 
> Citando as aplicações práticas:
    > para de controlar IP por planilha e criar uma persistencia em banco
    > provisionamento e desprovisionamento de maquina 
    > Fechamos assim a sintaxe do erb 
> Sintaxe do haml 
    > é parecida, mas sem a escrita do HTML 
    Ex. erb <strong><%= item.title %><strong>
        haml %strong= item.title
    Fonte: haml.info/tutorial.html
> Usando templates do Bootstrap (mostrou uma opção de uso do bower.io)

> Mais exemplos e utilitários de padronização de telas com <%= yield %>
    > Arquivos iniciais salvos com _old

> Posso usar os CSS locais que ficam por padrão na pasta /public **Pasta mesma hierarquia da /views
:P fazer um teste com os CSSs que baixei do site NPRO
> Referenciar no erb (layout.erb no caso) sem /public/<vai expor a partir daqui> 
    > posso criar as pastas /images /css /js ... 
    > no caso criou um CSS e criou uma nova linha abaixo do CSS (Bootstrap)
        > <link rel="stylesheet" href="/css/style.css">
        > Conteúdo do CSS 
            body {
                margin: 0; 
            }
        >Salvo como style.css 
> :P, se o Sinatra é para testes (localhost com :4567) como publico em produção??
> ** Dica faço inspect (em Network) na página para ver se criou o css que usei 
    > Lembrando que depois que abrir o inspect tem que rodar novamente (refresh)
> ** Dica, quando for usar CSS da comunidade dar preferencia por usar as versões XX.min., 
    > ficam sem espaço (versão reduzida)
> ** Referencia de livro: Sinatra Book <https://sinatra-org-book.herokuapp.com/> 
    > Fiz download




=end
