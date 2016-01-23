require 'rails_helper'

RSpec.describe 'routes', type: :routing do

  describe 'ListsController' do
    it('index'){ expect(get: '/lists').to route_to('lists#index', format: :json) }
    it('show'){ expect(get: '/lists/1').to route_to('lists#show', id: '1', format: :json) }
    it('create'){ expect(post: '/lists').to route_to('lists#create', format: :json) }
    it('update'){ expect(patch: '/lists/1').to route_to('lists#update', id: '1', format: :json) }
    it('destroy'){ expect(delete: '/lists/1').to route_to('lists#destroy', id: '1', format: :json) }
  end

  describe 'ListItemsController' do
    it('index'){ expect(get: '/lists/1/items').to route_to('list_items#index', list_id: '1', format: :json) }
    it('show'){ expect(get: '/lists/1/items/2').to route_to('list_items#show', list_id: '1', id: '2', format: :json) }
    it('create'){ expect(post: '/lists/1/items').to route_to('list_items#create', list_id: '1', format: :json) }
    it('update'){ expect(patch: '/lists/1/items/2').to route_to('list_items#update', list_id: '1', id: '2', format: :json) }
    it('destroy'){ expect(delete: '/lists/1/items/2').to route_to('list_items#destroy', list_id: '1', id: '2', format: :json) }
  end

end
