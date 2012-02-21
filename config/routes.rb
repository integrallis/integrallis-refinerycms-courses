Refinery::Application.routes.draw do
  resources :courses, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :courses, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
  resources :parts, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :parts, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
  resources :course_parts, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :course_parts, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
  resources :part_prerequisites, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :part_prerequisites, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
  resources :venues, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :venues, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
  resources :attendees, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :attendees, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
  resources :course_events, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :course_events, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
