require 'smarter_csv'


SmarterCSV.process('./vlan.csv').each do |vlan|
    puts vlan[:description]
#puts vlans.class
#puts vlans.inspect
end 

#ver na doc a adaptacao de data mapping 




