# desprovisionamento = commission / decomission

#Exemplo de script
=begin
digital_ocean_url = "https://digitalocean.com/api/v1.0/"
digital_ocean_user = 'marcelo'
digital_ocean_pass = 'sen2DOdrop'

puts "login no cloud"

puts "deletando droplet"
#aqui vai o código de criação do droplet

puts "deletado com sucesso"
#
#Nova linha para comparação

puts "enviando email de provisionamento..." 
# aqui vai o código de envio de email da remocao 

puts "email enviado com sucesso." 
=end   
#Vamos supor que mudaram os logins... versão de API.. dificuldade de manutencao dasérie de 
# scripts criados 
#Vamos então criar métodos de autenticação

require 'logger'

# para onde vai mandar arquivo, stdout...
@logger = Logger.new(STDOUT) (conout)
#@logger_human = Logger.new('app.log')
#@logger = Logger.new('cli.log')
# ligando e desligando os log 
@logger.level = Logger::INFO 
#@logger_human.level = Logger::INFO 

# nível de log warn, info, error 
@logger.info("iniciando definicoes em def_dig....rb")
@logger.warn("[ap1] log_def")  (com objetivo de gerar estats)
#@logger_human.warn("Warn teste iniciando definicoes em def_dig....rb")


def autenticar(url,user,pass)
#Declaracao do método
	@logger.debug "executando via método."
	@logger.debug "Params: url: #{url} Credentials: #{user}" 
	@logger.info "logando no cloud..."
	#code de login
	@logger.info "login com sucesso." 
end

def enviar_email(tipo_email)
	if tipo_email == :autenticacao
		@logger.debug "enviando email de #{tipo_email} ..."
		# aqui code de envio de email de autenticacao 
		@logger.debug "email #{tipo_email} enviado com sucesso." 
	elsif tipo_email == :provisionamento
		@logger.debug "enviando email de #{tipo_email} ..."
		# aqui code de envio de email de provisionamento 
		@logger.debug "email #{tipo_email} enviado com sucesso." 
	else
		@logger.warn "nao foi possivel enviar email aceito (:autenticacao ou :provisionamento) "
		@logger.debug "recebido: #{tipo_email}"
	end
	#aqui vai o código de envio de email da remocao 
end

def provisionar()
	@logger.debug "provisionando... " 
	#aqui vai o código de envio de email da remocao 
	@logger.info "provisionado com sucesso." 
end

def desprovisionar()
	@logger.debug "desprovisionando... " 
	#aqui vai o código de envio de email da remocao 
	@logger.info "desprovisionado com sucesso." 
end
#puts "login no cloud" Substituído pelo Method autenticacao 
#permite a reutilizacao de blocos de código
#neste caso faz sentido com o envio do email (ver passagem de parametro"



