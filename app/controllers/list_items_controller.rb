class ListItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_list
  before_action :authorize_list
  before_action :set_item, only: [:show, :update, :destroy]
  before_action :authorize_item, only: [:show, :update, :destroy]

  def index
    items = @list.items
    render json: items, root: 'items', adapter: :json
  end

  def show
    render json: @item
  end

  def create
    item = @list.items.new(item_params)
    if item.save
      render json: item, status: :created
    else
      render json: { errors: [item.errors.messages] }, status: :unprocessable_entity
    end
  end

  def update
    # TODO: will return OK when item_params == {}. Need to fix somehow
    if @item.update(item_params)
      render json: @item
    else
      render json: {errors: [@item.errors.messages]}, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    head :no_content
  end

  private

    def item_params
      params.require(:item).permit(:body)
    end

    def set_list
      @list ||= current_user.lists.find(params[:list_id])
    end

    def authorize_list
      authorize! :manage, @list
    end

    def set_item
      @item = @list.items.find(params[:id])
    end

    def authorize_item
      authorize! :manage, @item
    end
end
