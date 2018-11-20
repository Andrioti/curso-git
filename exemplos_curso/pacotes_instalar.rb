#preciso de nome e versão para instalação

#implementacao do JSON
require 'json'

package_wget = {name: "wget", version: "0.1.8", description: "wget command"}  
package_docker = {name: "docker", version: "17.0.3", description: "docker daemon"}
package_curl = {name: "curl", version: "0.0.1"}
package_curl2 = '{"name": "curl2", "version": "0.0.2"}'

pacotes = [ package_wget,package_docker,package_curl,package_curl2 ]
#convencao sempre que uma variavel estiver no plural trata-se de uma lista. 

#puts package_to_install.inspect

#puts package_to_install[0].inspect 
#puts package_to_install[0][:version]
#puts package_to_install[0][:version].class

# {:name=>"docker", :version=>"17.0.3", :description=>"docker daemon"} sintaxe padrao de apresentação, 
# nas versões anteriores e atribuicao de valores era assim 

#Tópico each || dentro defino uma variável de referencia para cada iteracao (no caso pacote)

pacotes.each do |pacote|  #se omitir ele só vai executar x vezes sem identificacao 
    #puts "Instalando o pacote #{pacote[:name]} na versao: #{pacote[:version]} "
    #puts "::"
end 

#puts package_curl2
#curl_to_json = JSON.parse('{"hello": "goodbye"}')

curl_to_json = JSON.parse(package_curl2)

puts curl_to_json[:name]


#puts package_curl2

