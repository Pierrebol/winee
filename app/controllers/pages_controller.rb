class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @wines = Wine.where("category != 'Spiritueux'")
    @spirits = Wine.where("category = 'Spiritueux'")
  end
end
