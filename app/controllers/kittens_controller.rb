class KittensController < ApplicationController
  include KittensHelper

  def index
    @kittens = Kitten.all
    respond_to do |format|
      format.html

    end
  end

  def show
    @kitten = Kitten.find(params[:id])
    respond_to do |format|
      format.html
      format.xml { render :xml => @kitten}
      format.json { render :json => @kitten}
    end
  end

  def new # GET FOR NEW
    @kitten = Kitten.new
  end

  def create # POST FOR NEW
    @kitten = Kitten.new(kitten_params)
    @kitten.save
    flash.notice = "Kitten '#{@kitten.name}' created!"
    redirect_to kitten_path(@kitten)
  end

  def edit # GET FOR EDIT
    @kitten = Kitten.find(params[:id])
  end

  def update # POST FOR EDIT
    @kitten = Kitten.find(params[:id])
    @kitten.update(kitten_params)
    flash.notice = "Kitten '#{@kitten.name}' updated!"
    redirect_to kitten_path(@kitten)
    # redirect somewhere
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy
    flash.notice = "Kitten '#{@kitten.name}' deleted!"
    redirect_to kittens_path
  end

end
