class FoliosController < ApplicationController
    def index
        @folio_items = Folio.all
    end
    def new
        @folio_item = Folio.new
    end
    def create
        @folio = Blog.new(folio_params)
    
        respond_to do |format|
          if @folio.save
            format.html { redirect_to folios_path, notice: "Folio was successfully created." }
            format.json { render :show, status: :created, location: @folio }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @folio.errors, status: :unprocessable_entity }
          end
        end
    end

    private
    # Only allow a list of trusted parameters through.
    def folio_params
        params.require(:folio).permit(:title, :body)
      end
end
