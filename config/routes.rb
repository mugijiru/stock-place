# == Route Map
#
#                                Prefix Verb   URI Pattern                                                                              Controller#Action
#                                  root GET    /                                                                                        home#index
#                                stocks GET    /stocks(.:format)                                                                        stocks#index
#                                       POST   /stocks(.:format)                                                                        stocks#create
#                             new_stock GET    /stocks/new(.:format)                                                                    stocks#new
#                                 stock DELETE /stocks/:id(.:format)                                                                    stocks#destroy
#                     place_evaluations POST   /places/:place_id/evaluations(.:format)                                                  places/evaluations#create
#                  new_place_evaluation GET    /places/:place_id/evaluations/new(.:format)                                              places/evaluations#new
#                 edit_place_evaluation GET    /places/:place_id/evaluations/:id/edit(.:format)                                         places/evaluations#edit
#                      place_evaluation PATCH  /places/:place_id/evaluations/:id(.:format)                                              places/evaluations#update
#                                       PUT    /places/:place_id/evaluations/:id(.:format)                                              places/evaluations#update
#                                       DELETE /places/:place_id/evaluations/:id(.:format)                                              places/evaluations#destroy
#                            edit_place GET    /places/:id/edit(.:format)                                                               places#edit
#                                 place GET    /places/:id(.:format)                                                                    places#show
#                                       PATCH  /places/:id(.:format)                                                                    places#update
#                                       PUT    /places/:id(.:format)                                                                    places#update
#                         api_v1_places GET    /api/v1/places(.:format)                                                                 api/v1/places#index
#                                       POST   /api/v1/places(.:format)                                                                 api/v1/places#create
#              api_v1_place_evaluations POST   /api/v1/place_evaluations(.:format)                                                      api/v1/place_evaluations#create
#         rails_mandrill_inbound_emails POST   /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#create
#         rails_postmark_inbound_emails POST   /rails/action_mailbox/postmark/inbound_emails(.:format)                                  action_mailbox/ingresses/postmark/inbound_emails#create
#            rails_relay_inbound_emails POST   /rails/action_mailbox/relay/inbound_emails(.:format)                                     action_mailbox/ingresses/relay/inbound_emails#create
#         rails_sendgrid_inbound_emails POST   /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                  action_mailbox/ingresses/sendgrid/inbound_emails#create
#          rails_mailgun_inbound_emails POST   /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                              action_mailbox/ingresses/mailgun/inbound_emails#create
#        rails_conductor_inbound_emails GET    /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#index
#                                       POST   /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#create
#     new_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/new(.:format)                             rails/conductor/action_mailbox/inbound_emails#new
#    edit_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id/edit(.:format)                        rails/conductor/action_mailbox/inbound_emails#edit
#         rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#show
#                                       PATCH  /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       PUT    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       DELETE /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#destroy
# rails_conductor_inbound_email_reroute POST   /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                      rails/conductor/action_mailbox/reroutes#create
#                    rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#             rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#                    rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#             update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#                  rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  root 'sessions#new'

  get 'login' => 'sessions#new'
  delete 'logout' => 'sessions#destroy'
  get 'auth/auth0/callback' => 'auth0#callback'
  get 'auth/failure' => 'auth0#failure'

  get 'home' => 'home#index'
  resources :stocks, only: %i[index new create destroy]
  resources :visited_places, only: %i[show edit update] do
    resources :reports, only: %i[new create edit update destroy], controller: 'visited_places/reports'
  end

  namespace :api, { defaults: { format: :json } } do
    namespace :v1 do
      resources :visited_places, only: %i[index create]
      resources :visited_place_reports, only: %i[create]
    end
  end
end
