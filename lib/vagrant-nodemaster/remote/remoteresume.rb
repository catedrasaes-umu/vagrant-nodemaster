require 'optparse'
require 'vagrant-nodemaster/requestcontroller'
module Vagrant
  module NodeMaster
	class ResumeVM < Vagrant.plugin(2, :command)
 	def execute
          options = {}

          opts = OptionParser.new do |opts|
            opts.banner = "Usage: vagrant remote resume <node-name> [vm_name]"
          end
          
          argv = parse_options(opts)
          return if !argv  
          raise Vagrant::Errors::CLIInvalidUsage, :help => opts.help.chomp if (argv.length < 1 || argv.length > 2)
          
          		
	  machines=RequestController.vm_resume(argv[0],argv[1])
          			  	
          		
	  machines.each do |machine|
	  	@env.ui.info("Remote Client \"#{argv[0]}\":Virtual Machine \"#{machine}\" resumed")
	  end          				
										
	  @env.ui.info(" ")
          		         		
          0
        end
        
	end
  end
end
