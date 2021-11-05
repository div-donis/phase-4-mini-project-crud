class SpicesController < ApplicationController
    # POST /spices
  def create
    spice = Spice.create(spice_params)
    render json: spice, status: :created
  end

  # GET /spices
  def index
    spices = Spice.all
    render json: spices
  end

  # PATCH /spices/:id
  def update
    spice = find_spice
    spice.update(spice_params)
    render json: spice
  rescue ActiveRecord::RecordNotFound
    render_not_found_response
  end 

   # DELETE /spices/:id
   def destroy
    spice = find_spice
    if spice
      spice.destroy
      head :no_content
    else
      render_not_found_response
    end
  end 

  private

  def find_spice
    Spice.find(params[:id])
  end 

  def render_not_found_response
    render json: { error: "Spice not found" }, status: :not_found
  end 

  def spice_params
    params.permit(:title, :image, :description, :notes, :rating)
  end

end
