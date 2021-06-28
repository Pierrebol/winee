class WineboxesController < ApplicationController
def create
  if Winebox.find_by(wine_id: params[:winebox][:wine_id], user_id: current_user).nil?
    @winebox = Winebox.new(winebox_params)
	@winebox.user = current_user
    if @winebox.save!
      redirect_to my_cellar_path, notice: "#{@winebox.quantity_of_wine} bouteilles de \"#{@winebox.wine.name}\" ajoutées"
    else
      redirect_to my_cellar_path
	end
  else
  	@winebox = (Winebox.find_by(wine_id: params[:winebox][:wine_id], user_id: current_user))
    @winebox.quantity_of_wine += (params[:winebox][:quantity_of_wine].to_i)
    @winebox.save!
    redirect_to my_cellar_path(@winebox), notice: "Le nombre de bouteilles de \"#{@winebox.wine.name}\" a été mis à jour"
  end
end

  private

  def winebox_params
    params.require(:winebox).permit(:wine_id, :quantity_of_wine)
  end  
end
