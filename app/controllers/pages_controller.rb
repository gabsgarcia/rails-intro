# =============================================================================
# ARQUIVO: app/controllers/pages_controller.rb
# FUNÇÃO: Controller das páginas estáticas do app.
#
# CONVENÇÃO DE NOMES (fundamental!):
#   Controller: PagesController  →  arquivo: app/controllers/pages_controller.rb
#   Action:     def about        →  view:    app/views/pages/about.html.erb
#                                                        ↑      ↑
#                                                  pasta com   arquivo com
#                                                  nome do     nome da action
#                                                  controller
#
# MANTRA DA AULA:
#   Route → Controller#Action → View  (sempre nessa ordem!)
# =============================================================================

class PagesController < ApplicationController
  # Herda de ApplicationController → que herda de ActionController::Base
  # Isso nos dá acesso a: params, render, redirect_to, e muito mais!

  # ---------------------------------------------------------------------------
  # ACTION: about
  # Rota:   GET /sobre  (routes.rb → get "sobre", to: "pages#about", as: :about)
  # View:   app/views/pages/about.html.erb
  #
  # Action vazia = Rails renderiza a view automaticamente!
  # "Convention over configuration": se existe about.html.erb, ele é usado.
  # ---------------------------------------------------------------------------
  def about
    @members = ["thanh", "dimitri", "germain", "damien", "julien"]
    # ↑ variável de instância (com @) → visível na view about.html.erb
    # ↑ variável local (sem @)        → invisível na view, só existe aqui no controller
  end

  # ---------------------------------------------------------------------------
  # ACTION: profile
  # Rota:   GET /profile  (routes.rb → get "profile", to: "pages#profile")
  # View:   app/views/pages/profile.html.erb
  #
  # Action vazia = Rails renderiza a view automaticamente.
  # Adicione @variáveis aqui quando a view precisar de dados dinâmicos.
  # ---------------------------------------------------------------------------
  def profile
  end

  # ---------------------------------------------------------------------------
  # ACTION: new
  # Rota:   GET /new  (routes.rb → get "new", to: "pages#new")
  # View:   app/views/pages/new.html.erb
  #
  # ---------------------------------------------------------------------------
  def new
  end

  # ---------------------------------------------------------------------------
  # ACTION: home
  # Rota:   GET /  (root — página inicial, http://localhost:3000/)
  # View:   app/views/pages/home.html.erb
  #
  # Definida no routes.rb como: root to: "pages#home"
  # É a primeira coisa que o usuário vê ao entrar no app.
  # ---------------------------------------------------------------------------
  def home
  end
end

# =============================================================================
# RESUMO DO FLUXO COMPLETO:
#
#  1. Browser faz:  GET /sobre
#  2. routes.rb:    get "sobre", to: "pages#about"  → PagesController#about
#  3. Controller:   def about roda (prepara @variáveis se necessário)
#  4. Rails:        renderiza app/views/pages/about.html.erb automaticamente
#  5. View ERB:     usa as @variáveis do controller para montar o HTML
#  6. Browser:      recebe o HTML e exibe na tela
# ============================================================================
