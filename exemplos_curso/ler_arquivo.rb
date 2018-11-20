=begin
File 
Exceptions 
Se estou abrindo um script de outro desenvolvedor, bibliotecas... posso não ter acesso ao 
código da excessao que estou tomando 
Ideal é devolver uma mensagem customizada 
Ex: 404 para http (arquivo não encontrado)

begin
    #vou pegar tudo que está até o end e tratar
    File.open("./resolv.con")  # aqui funciona também só "resolv.conf"
rescue Errno::ENOENT => e
    =begin 
        enviar_email(:erro)
    rescue Exception
        puts "ocorreu um erro"
    =end
    #tudo que acontecer dentro do begin trago aqui Try/Catch 
    puts e.backtrace
    puts "erro ao ler arquivo. arquivo nao existe" #melhor que ver a stack trace
rescue NameError
    puts "variavel ou metodo nao existe"
rescue Exception
    puts "ocorreu um erro qualquer"
end


Exception sempre o ExitCode = 1 

Exemplo no meu código posso mandar (lançar) uma exception para quem chamou a minha rotina
tratar

Tem categoria para facilitar o tratamento
Todos sao "filhos" da Exception 


=end 

#require './def_digital_ocean_cloud'

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
