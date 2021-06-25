class WineboxesController < ApplicationController

	def create
	@winebox = Winebox.new(winebox_params)
	@winebox.user = current_user
	    if @winebox.save!
	      redirect_to my_cellar_path, notice: "#{@winebox.quantity_of_wine} bouteilles de \"#{@winebox.wine.name}\" ajoutées"
	    else
	      redirect_to my_cellar_path
		end
	end



  private

  def winebox_params
    params.require(:winebox).permit(:wine_id, :quantity_of_wine)
  end  

end
