class HomeController < ApplicationController

  def index
    gon.assets = {
      :logo => get_asset_path('preplogo@2x.png'),
      # Colored logos
      :esriLogo => get_asset_path('logos/esri@2x.png'),
      :nasaLogo => get_asset_path('logos/nasa@2x.png'),
      :universityWashingtonLogo => get_asset_path('logos/university-washington@2x.png'),
      :wriLogo => get_asset_path('logos/wri@2x.png'),
      # White logos
      :lightEsriLogo => get_asset_path('logos/esri-light@2x.png'),
      :lightNasaLogo => get_asset_path('logos/nasa-light@2x.png'),
      :lightDescartesLogo => get_asset_path('logos/descartes-light@2x.png'),
      :lightUniversityWashingtonLogo => get_asset_path('logos/university-washington-light@2x.png'),
      :lightWriLogo => get_asset_path('logos/wri-light@2x.png'),
      :lightVizzualityLogo => get_asset_path('logos/vizzuality-light@2x'),
      # Homepage
      :homeAccessible => get_asset_path('home-accessible@2x.jpg'),
      :homeUnderstanding => get_asset_path('home-understanding@2x.jpg')
    }
  end

  private

    def get_asset_path(name)
      ActionController::Base.helpers.asset_path(name)
    end

end
