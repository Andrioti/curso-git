require 'thor'
class Cli < Thor
    desc "cópia FILE SERVER_FROM SERVER_TO", "faz cópia de arquivos entre servidoes"
    def copy_files(file, server_from, server_to)
        puts "copiando arquivos..."
        puts file
        puts server_from
        puts server_to
    end

    # vou acrescebtando novos defs... 
end

Cli.start(ARGV)

# ganho help da desc
# não preciso de if para entrar nas rotinas de ARGV
# Classe Cli que herda a Thor expoe seus métodos  

