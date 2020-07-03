# frozen_string_literal: true

Rails.application.routes.draw do
  root controller: :expos, action: :index
  get 'local_state', to: 'expos#local_state'
  get 'loaders', to: 'expos#loaders'
  get 'todos', to: 'expos#todos'
  get 'data_table', to: 'expos#data_table'
end
