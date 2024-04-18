# frozen_string_literal: true

# spec/controllers/tasks_controller_spec.rb
require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  let(:user) { create(:user) }
  let(:task) { create(:task, user:) }
  render_views

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'assigns a new task to @task' do
      get :new
      expect(assigns(:task)).to be_a_new(Task)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      let(:valid_params) { { task: attributes_for(:task, user_id: user.id) } }

      it 'creates a new task' do
        expect do
          post :create, params: valid_params
        end.to change(Task, :count).by(1)
      end

      it 'redirects to the tasks index page' do
        post :create, params: valid_params
        expect(response).to redirect_to(tasks_path)
      end
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested task to @task' do
      get :edit, params: { id: task.id }
      expect(assigns(:task)).to eq(task)
      expect(response).to render_template(:edit)
    end
  end

  describe 'PATCH #update' do
    context 'when user is authorized' do
      it 'updates the task' do
        patch :update, params: { id: task.id, task: { title: 'New Title', user_id: user } }
        task.reload
        expect(task.title).to eq('New Title')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the task' do
      delete :destroy, params: { id: task.id }
      expect(Task.exists?(task.id)).to be_falsey
    end
  end
end
