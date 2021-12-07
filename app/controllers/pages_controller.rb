class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @challenges = Challenge.all
  end

  def achievement
  end

  def friends
  end
end
