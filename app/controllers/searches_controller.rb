class SearchesController < ApplicationController
  def show
    @search = Search.find(params[:id])
    # Installer geocoder
    # Configurer geocoder pour fonctionner avec Mapbox
    # Regarder le cours sur geocoder pour mettre la bonne méthode (geocoded_by) dans le model qui contient l'adresse (experience)
    # Essayer de joindre les utilisateurs et les experiences (.joins)

    @matching_experiences = Experience.near(@search.address, 10).map(&:id)
    @matching_users = User.joins(:experiences)
                       .where(experiences: {
                         id: @matching_experiences,
                         line_of_work: @search.line_of_work,
                         field: @search.field,
                         is_current: true
                       })
                       .where.not(id: current_user.id)
                       .distinct

    # Essayer de faire un .where sur les experiences qui ont la même adresse que la search (utiliser .near)
    # et .where sur les experiences qui ont le même line_of_work que la search
    # et .where sur les experiences qui ont le même field que la search

  end

  def details
    @search = Search.find(params[:search_id])
    @user = User.find(params[:user_id])

    respond_to &:turbo_stream
  end

  def new
    # @experience = current_user.experiences.where(is_current: true)
    # if @experience
    #   return
    # else
    if params[:search][:is_offering] == "false"
      @search = Search.new(is_offering: false)
    else
      @search = Search.new(is_offering: true, line_of_work: current_user.current_experience.line_of_work, field: current_user.current_experience.field, address: current_user.current_experience.address, experience: current_user.current_experience, user: current_user)
    end

    @lines_of_work = Search::LINES_OF_WORK
    @departments = Search::DEPARTMENTS
    @fields = Search::FIELDS
    # end
  end

  def init
    @search = Search.new
  end

  def create
    @search = Search.new(search_params)
    @search.user = current_user
  # else
    if @search.save
      redirect_to dashboard_searches_path
    else
      render 'new', status: :unprocessable_entity
    end
  # end
  end

  def update
    @search = Search.find(params[:id])
    @search.update(search_params)
    redirect_to # à définir
  end

  def destroy
    @search.find(params[:id])
    @search.destroy
    # path à définir
    redirect_to somewhere_path, status: :see_other
  end

  private

  def search_params
    params.require(:search).permit(:user_id, :experience_id, :line_of_work, :field, :address, :is_offering, :quotite_de_travail)
  end

end
