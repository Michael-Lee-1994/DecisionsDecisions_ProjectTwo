class AddressesController < ApplicationController
    def new
        id = params[:address_id]
        if id && @address = Address.find_by_id(id)
            @address = @user.address.build
        else
            @address = current_user.address.build
        end
    end
    
    def create
        @address = current_user.address.build(address_params)
    end
end
