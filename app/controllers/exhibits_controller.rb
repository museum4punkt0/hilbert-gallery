class ExhibitsController < ApplicationController
  def index
    @exhibits = Exhibit.all
  end

  def show
    @exhibit = Exhibit.find(params[:id])
  end

  def new
    @exhibit = Exhibit.new
  end

  def edit
    @exhibit = Exhibit.find(params[:id])
  end

  def create
    @exhibit = Exhibit.new(exhibit_params)

    if @exhibit.save
      redirect_to @exhibit
    else
      render 'new'
    end
  end

  def update
    @exhibit = Exhibit.find(params[:id])

    if @exhibit.update(exhibit_params)
      redirect_to @exhibit
    else
      render 'edit'
    end
  end

  def destroy
    @exhibit = Exhibit.find(params[:id])
    @exhibit.destroy

    redirect_to root_path
  end

  private
  def exhibit_params
    params.require(:exhibit).permit(:caption, :credits, :year, :city, :region, :country, :notes, :submitter_name, :submitter_email)
  end
end
