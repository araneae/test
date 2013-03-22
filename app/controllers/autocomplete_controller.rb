class AutocompleteController < ApplicationController

  def addresses
    term=params[:query]
    if term
       like=term[0].concat("%")
       list = Rails.cache.fetch(like) do
          addresses=Address.where("address like ?", like)
          list = addresses.map {|item| Hash[id: item.id, name: item.address]}
      end
    end
    render json: list
  end
end
