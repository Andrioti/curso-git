#puts 'teste'
#str = 'teste'
#puts str.upcase

maquinas_virtuais = "srv01;sr02;srv3"

puts maquinas_virtuais.split(";")
#devolve String em Array 
lista_maquinas_virtuais = maquinas_virtuais.split(";")
puts lista_maquinas_virtuais
puts lista_maquinas_virtuais.inspect
puts lista_maquinas_virtuais.class
    
#criar uma Lista 
vms = ["srv01","srv09","srv99",10,false, true, :on]
puts vms
puts vms.inspect
#devolve o formato de lista como foi definido 

#posição da lista 
#vms = ["srv01","srv09","srv99"]
for i in 0..vms.length
    puts vms[i]
    puts vms[i].class 
end
puts vms.inspect
puts vms.pop
#pop > pop! 

puts vms.include?(true)

puts vms.find_index(false)

srt = 'teste'
teste.reverse
