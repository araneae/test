class AutocompleteController < ApplicationController

  def addresses
    term=params[:query]
    if term
       like=term.concat("%")
       addresses=Address.where("address like ?", like)
       list = addresses.map {|item| Hash[id: item.id, name: item.address]}
    end
    render json: list
  end
end
