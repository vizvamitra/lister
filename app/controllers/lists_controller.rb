class ListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_list!, only: [:show, :update, :destroy]

  def index
    @lists = current_user.lists
    render json: @lists, root: 'lists', adapter: :json
  end

  def show
    render json: @list
  end

  def create
    @list = current_user.lists.new(list_params)
    if @list.save
      render json: @list, status: :created
    else
      render json: {errors: [@list.errors.messages]}, status: :unprocessable_entity
    end
  end

  def update
    # TODO: will return OK when list_params == {}. Need to fix somehow
    if @list.update(list_params)
      render json: @list
    else
      render json: {errors: [@list.errors.messages]}, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
    head :no_content
  end

  private

    def list_params
      params.require(:list).permit(:name)
    end

    def set_list!
      @list ||= List.find(params[:id])
      authorize! :manage, @list
    end
end
