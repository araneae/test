class TypeSetsController < ApplicationController
  def index
  	@type_sets = TypeSet.all
  end

  def new
    @type_set = TypeSet.new
  end

  def create
  	type_set = TypeSet.new params[:type_set]

    if type_set.save
       redirect_to type_sets_path, :notice => "Type was successfully created."
    else
    	redirect_to :back, :notice => "There was an error creating the type."
    end
  end

  def edit
    @type_set = TypeSet.find params[:id]
  end

  def update
    type_set = TypeSet.find params[:id]

    if type_set.update_attributes(params[:type_set])
        redirect_to type_sets_path, :notice => "The type has successfully been updated."
    else
        redirect_to :back, :notice => "There was an error while updating the type."
    end
  end

  def show
    @type_set = TypeSet.find params[:id]
  end

end
