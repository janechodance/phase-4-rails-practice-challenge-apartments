class ApartmentsController < ApplicationController
   def create
    apartment= Apartment.create(apartment_params)
    if apartment.valid?
    render json: apartment, status: :created
else
    render json: { error: apartment.errors.full_messagese }, status: :unprocessable_entity
  end
   end
   def index
    apartments = Apartment.all
    render json: apartments
   end
   def show
    apartment = Apartment.find(params[:id])
    if apartment
        render json: apartment
    else
        render json: {error: "Apartment not found"}, status: :not_found
    end    
   end
   def update
    apartment = Apartment.find(params[:id])
    if apartment
        apartment.update(apartment_params)
        render json: apartment
    else
        render json: {error: "Apartment not found"}, status: :not_found
    end  
   end
   def destroy
    apartment = Apartment.find(params[:id])
    if apartment
        apartment.destroy
        head :no_content
    else
        render json: {error: "Apartment not found"}, status: :not_found
    end  
   end
   private
   def apartment_params
    params.permit(:number)
   end
end