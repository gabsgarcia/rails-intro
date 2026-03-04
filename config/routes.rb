# =============================================================================
# ARQUIVO: config/routes.rb
# FUNÇÃO: O GPS do Rails. Toda URL que o browser pede passa por aqui primeiro.
#
# FLUXO MVC:
#   Browser → ROUTES → Controller#Action → View → HTML de volta pro browser
#
# SINTAXE GERAL:
#   verbo "caminho", to: "controller#action", as: :nome_do_helper
#   get   "sobre",   to: "pages#about",       as: :about
#                                                  ↑
#                                     Gera o helper about_path
#                                     Usado nas views: link_to "texto", about_path
#
# VERIFICAR TODAS AS ROTAS:
#   rails routes                             ← no terminal
#   http://localhost:3000/rails/info/routes  ← no browser (só em development)
# =============================================================================

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # ---------------------------------------------------------------------------
  # Rota de saúde gerada pelo Rails — não mexer!
  # GET /up → retorna 200 se o app estiver OK, 500 se quebrado
  # Usada por load balancers e monitores de uptime
  # ---------------------------------------------------------------------------
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # ---------------------------------------------------------------------------
  # ROOT — página inicial: http://localhost:3000/
  #
  # Sintaxe especial: root to: "controller#action"
  # Equivale a:       get "/", to: "pages#home"
  # Só pode existir UMA rota root por app!
  #
  # As linhas comentadas abaixo mostram como a rota root pode apontar para
  # qualquer action — útil para entender que root é só uma rota comum especial
  # ---------------------------------------------------------------------------
  # root "posts#index"
  # root to: "pages#about"
  root to: "pages#home"

  # ---------------------------------------------------------------------------
  # PÁGINAS ESTÁTICAS — controller: pages
  #
  # Padrão: verb "path", to: "controller#action"
  #
  # O "as:" é opcional mas gera um path helper para usar nas views:
  #   as: :about   →  about_path   →  <%= link_to "Sobre", about_path %>
  #
  # Sem "as:", o helper é gerado automaticamente pelo caminho (sobre_path, profile_path...)
  # ---------------------------------------------------------------------------
  get "sobre", to: "pages#about",   as: :about  # helper: about_path
  get "profile", to: "pages#profile"              # helper: profile_path
  get "pages/new", to: "pages#new"                  # helper: new_path

  # ---------------------------------------------------------------------------
  # ⚠️  CONFLITO AQUI! Dois "get 'new'" apontam para controllers diferentes.
  #
  # O Rails percorre as rotas DE CIMA PARA BAIXO e usa a PRIMEIRA que casar.
  # Como "get 'new' → pages#new" vem antes, esta linha abaixo NUNCA será chamada!
  #
  # SOLUÇÃO: usar caminhos únicos, ex: "books/new" em vez de "new"
  # ---------------------------------------------------------------------------
  get "books/new", to: "books#new"    # ⚠️  nunca será chamada! conflito com pages#new
  get "books", to: "books#index"  # helper: books_path → lista os livros (BooksController#index)
end