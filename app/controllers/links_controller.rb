class LinksController < ApplicationController
  before_action :set_link, only: :destroy

  # GET /params[:short_url]
  def show
    @host = request.host
    if params[:short_url]
      @link = Link.find_by(short_url: params[:short_url])
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
    @link = Link.new(link_params)
    if @link.save
      redirect_to @link, notice: 'Link was successfully created.'
    else
      render :new
    end
  end

  # DELETE /links/1
  def destroy
    @link.destroy
    redirect_to root_url, notice: 'Link was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def link_params
      chars = ['0'..'9', 'A'..'Z', 'a'..'z'].map { |range| range.to_a }.flatten
      params.require(:link).permit(:original_url, :expiration_date).merge!(short_url: 6.times.map { chars.sample }.join)
    end
end
