Egat::Application.routes.draw do
  
  resources :transformer_informations do
    member do 
      get 'importance_and_risk_table'
      
    end
    collection do      
      get 'search'
    end
  end

  resources :visual_inspections do
    collection do
      get 'search'
    end
  end

  resources :oil_input do
    collection do
      get 'search'
    end
  end

  resources :electrical_tests do
    collection do
      get 'search'
    end
  end  
  
  resources :transformers do
    resources :bushing_tests
    resources :aging_products
    resources :oil_input
    resources :oil_dgas do 
      collection do
        get :graph
      end
    end
    resources :oil_qualities do
      collection do
        get :oil_contaminations
      end
    end
    resources :oltc_oil_qualities do
      collection do
        get :oltc_oil_contaminations
        get :oltc_dielectric_properties
      end
    end
    resources :oltc_dgas
    resources :furans
    resources :oil_contaminations
    resources :oltc_oil_contaminations
    resources :overall_conditions
    resources :insulating_oils
    resources :visual_inspections do 
      resources :general_conditions
      resources :bushing_conditions
      resources :load_histories
      resources :surge_arresters
      resources :conservator_tanks
      resources :main_tanks
      resources :hot_line_oil_filters
      resources :radiator_cooling_systems
      resources :transformer_control_cabinets
      resources :ngrs
      resources :regulating_pts
      resources :oltc_compartments
      resources :oltc_control_cabinets
      resources :thermo_scans
    end    
    resources :electrical_tests
    resources :power_factors    
  end
  


  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "home#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id(.:format)))'
end
