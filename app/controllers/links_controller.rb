class LinksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_link, only: :destroy

  # GET /params[:short_url]
  def show
    @host = request.host
    if params[:short_url]
      @link = Link.find_by(short_url: params[:short_url])
      return if available(@link)
      if redirect_to @link.original_url
        @link.cliks += 1
        @link.save
      end
    else
      @link = Link.find(params[:id])
    end
  end

  # GET /links/new
  def new
    @link = Link.new
  end

  # POST /links
  def create
    @link = current_user.links.new(link_params)
    if @link.save
      redirect_to @link, notice: 'Link was successfully created.'
    else
      redirect_to action: :new
    end
  end

  # DELETE /links/1
  def destroy
    @link.destroy
    redirect_to root_url, notice: 'Link was successfully destroyed.'
  end

  private

  def set_link
    @link = Link.find(params[:id])
  end


  def link_params
    chars = ['0'..'9', 'A'..'Z', 'a'..'z'].map { |range| range.to_a }.flatten
    params
      .require(:link)
      .permit(:original_url, :expiration_date, :available_through)
      .merge!(short_url: 6.times.map { chars.sample }.join)
  end

  def available(link)
    Rails.logger.info(Time.now.in_time_zone)
    Rails.logger.info(link.created_at.in_time_zone + link.available_through)

    Time.now.in_time_zone < link.created_at.in_time_zone + link.available_through
  end
end
