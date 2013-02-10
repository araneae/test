class TypeElementsController < ApplicationController
	def new
		@type_set = TypeSet.find params[:type_set_id]
		@type_element = @type_set.type_elements.build
	end

	def create
		type_set = TypeSet.find params[:type_set_id]
        type_element = type_set.type_elements.new params[:type_element]

        if type_element.save
	       redirect_to type_set_path(type_set), :notice => "Type elemenet was successfully created."
	    else
	        redirect_to :back, :notice => "There was an error creating the element."
	    end
	end

	def edit
		@type_element = TypeElement.find params[:id]
		@type_set = @type_element.type_set
	end

	def update
       	type_element = TypeElement.find params[:id]
       	type_set = type_element.type_set

	    if type_element.update_attributes(params[:type_element])
	        redirect_to type_set_path(type_set), :notice => "The element has successfully been updated."
	    else
	        redirect_to :back, :notice => "There was an error while updating the element."
	    end
	end

	def destroy
	    TypeElement.destroy params[:id]
	    redirect_to :back, :notice => "Element has been deleted"
  	end
end
