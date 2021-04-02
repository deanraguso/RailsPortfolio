class FoliosController < ApplicationController
  before_action :folio_params, only: [:create ]
  before_action :set_folio_item, only: [:show, :edit, :update, :destroy]
  layout "folio"

    def index
      @folio_items = Folio.all.by_position
    end
    def angular
      @angular_items = Folio.angular
    end

    def show
    end
    def new
      @folio_item = Folio.new
      3.times { @folio_item.technologies.build }
    end
    def create
      @folio = Folio.new(folio_params)
  
      respond_to do |format|
        if @folio.save
          format.html { redirect_to folios_path, notice: "Folio was successfully created." }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    def edit
    end

    def update

        respond_to do |format|
          if @folio_item.update(folio_params)
            format.html { redirect_to folios_path, notice: "folio was successfully updated." }
            format.json { render :show, status: :ok, location: @folio }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @folio.errors, status: :unprocessable_entity }
          end
        end
    end

    def destroy
      @folio_item.destroy
      respond_to do |format|
        format.html {redirect_to folios_url, notice: "Post was removed."}
        format.json {head :no_content}
      end
    end

    private
    # Only allow a list of trusted parameters through.
    def folio_params
      params.require(:folio).permit(:title, 
                                    :subtitle,
                                    :body, 
                                    technologies_attributes: [:name]
                                    )
    end
    def set_folio_item
      @folio_item = Folio.find(params[:id])
    end
end
