#raise Exception, 'Ocorreu um erro ao ler o diretorio'
#Isso aqui já mata a execução.

# ArgumentError passo em um IF validando o recebimento de parametro
# ver na doc a arvore de excecao 
#este Exception classifica a Excessão, define quem lança
#caracterizado como RuntimeError (sem a declaração de tipo)

#raise dispensa mandar um puts + ExitCode 1 
=begin
    
rescue => exception
    
=end

=begin
def ler_diretorio(diretorio)
    if diretorio != "/tmp"
        raise Exception, "diretorio informado não autorizado"
    end
end
=end

puts Dir.entries("/tmp")

=begin
Dir.entries("/tmp").each do |arquivo| 
    puts arquivo.class 
    puts arquivo
end
=end