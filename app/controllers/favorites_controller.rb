class FavoritesController < ApplicationController

  def create
    # @favorite = Favorite.new(user_1_id: current_user.id, user_2_id: params[:user_2_id])

    # if @favorite.save
    #   redirect_to dashboard_favorites_path, notice: "Profil ajouté au carnet d'adresse !"
    # else
    #   redirect_to dashboard_favorites_path, alert: "Impossible d'ajouter ce profil."
    # end

    @favorite = current_user.favorites.find_by(user_2_id: params[:user_2_id])

    if @favorite
      # Si elle existe, on la supprime
      @favorite.destroy
      redirect_to dashboard_favorites_path, notice: "Profil retiré du carnet d'adresses !"
    else
      # Si elle n'existe pas, on la crée
      @favorite = Favorite.new(user_1_id: current_user.id, user_2_id: params[:user_2_id])
      
      if @favorite.save
        redirect_to dashboard_favorites_path, notice: "Profil ajouté au carnet d'adresses !"
      else
        redirect_to dashboard_favorites_path, alert: "Impossible d'ajouter ce profil."
      end
    end

  end

end
