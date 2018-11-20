#simulacao de chamadas do kernel 

#Suit case when

#Projeto: 
#simular ls /tmp 
#   "    cat/tmp/conf 
#Como que eu gostaria de usar, ou que alguém usa-se. 
#Ou seja como implementar: Gostaria de usar desse jeito??
#Depois passo para o código 
#

#como não vai ficar só em ls e cat, vou definir métodos 

def ls(param)
    puts Dir.entries(param)
end

def cat(param)
    puts File.open(param).read
end
=begin
if ARGV[0] == 'ls'
    ls(ARGV[1])
elsif ARGV[0] == 'cat'  
    cat(ARGV[1])
end
=end
#Implementacao do Mateus

kernel_function = ARGV[0]
kernel_func_param = ARGV[1]
=begin
if kernel_function == 'ls'
    ls(kernel_func_param)
elsif kernel_function == 'cat'  
    cat(kernel_func_param)
end
=end

#uso de Case when para 02 possibilidade fica parecido, 
# dai para frente ajuda muito, mas é difícil ver usando. 

case kernel_function
when "ls"
    ls(kernel_func_param)
when "cat"
    cat(kernel_func_param)
end







