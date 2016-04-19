class ClientsController < ApplicationController
   
   def index
       @clients = Client.all.reverse
   end
   
   def new
       @new_client = Client.new
   end
   
   def create
       @new_client = Client.create(client_params)
       if @new_client.save
           redirect_to root_path
       else
           render :new
       end
   end
   
   private
   def client_params
       params.require(:client).permit(:name, :age)
   end
    
end