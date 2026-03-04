# =============================================================================
# ARQUIVO: app/controllers/books_controller.rb
# FUNÇÃO: Gerencia as ações relacionadas a livros.
#
# Rotas que chegam aqui (config/routes.rb):
#   GET /book/new   → books#new
#   GET /books → books#index
# =============================================================================

class BooksController < ApplicationController
  # ---------------------------------------------------------------------------
  # ACTION: new
  # Rota:   GET books/new
  # View:   app/views/books/new.html.erb
  #
  # Em REST, "new" exibe um FORMULÁRIO para criar um novo recurso.
  # Action vazia = Rails renderiza a view automaticamente.
  # ---------------------------------------------------------------------------
  def new
  end

  # ---------------------------------------------------------------------------
  # ACTION: show
  # View:   app/views/books/show.html.erb
  #
  # ⚠️  Ainda não tem rota! Para funcionar, adicionar em routes.rb:
  #   get "books/:id", to: "books#show", as: :book
  #
  # Em REST, "show" exibe UM recurso específico (identificado pelo :id na URL).
  # Exemplo: GET /books/42  →  mostra o livro com id 42
  #          params[:id]    →  "42"
  # ---------------------------------------------------------------------------
  def show
  end

  # ---------------------------------------------------------------------------
  # ACTION: index
  # Rota:   GET /books
  # View:   app/views/books/index.html.erb
  #
  # Em REST, "index" lista TODOS os recursos.
  #
  # COMO O FILTRO DE BUSCA FUNCIONA:
  #
  # O formulário na view envia: GET /books?member=thanh
  #                                         ↑
  #                                 query string
  #
  # O Rails captura tudo na requisição dentro do hash mágico "params":
  #   GET /books?member=ana   →  params[:member] = "ana"
  #   <input name="member">   →  params[:member] = "valor digitado"
  #   GET /books/:id          →  params[:id]     = "42"
  # ---------------------------------------------------------------------------
  def index
    # Passo 1: define a lista completa
    # (futuramente virá do banco de dados: @books = Book.all)
    @members = [ "thanh", "dimitri", "germain", "damien", "julien" ]
    # ↑ variável de instância (com @) → acessível na view index.html.erb
    # ↑ variável local (sem @)        → NÃO seria acessível na view

    # Passo 2: filtra apenas se o usuário enviou algo na busca
    # params[:member] retorna nil quando o campo está vazio ou não foi enviado
    # nil é "falsy" em Ruby → o if não executa → @members continua com todos
    if params[:member]
      @members = @members.select { |member| member.start_with?(params[:member]) }
      #                    ↑ select: mantém só os elementos onde o bloco retorna true
      #                               ↑ variável local do bloco (cada item do array)
      #                                          ↑ true se o nome começa com o texto buscado
    end

    # RESULTADO NA PRÁTICA:
    # GET /books            →  @members = os 5 membros completos
    # GET /books?member=d   →  @members = ["dimitri", "damien"]
    # GET /books?member=t   →  @members = ["thanh"]
    # GET /books?member=x   →  @members = []  (array vazio, nenhum resultado)
  end
end
