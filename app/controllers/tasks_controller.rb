class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    # on fait ce task.new car le for form de new.html a besoin d'un task comme parametre pour
    # savoir sil nous dirige vers create or update. donc on lui passe ce task new pour quil cmoprenne qu'on veut
    # faire une nouvelle task. Mais au fait pour vraiment creer la task on le fait dans l'action
    # create on prenant comme parametres les params du for form (apres les avoir passé
    # par notre methode de securité qu'enleve les possibles parametres parasites qune
    # personne malintentionnée ait pu passer)
    @task = Task.new
  end

  def create
    # Task.create(parametres) est egal à faire => my_task = Task.new(parametres) puis my_task.save
    Task.create(task_params)
    redirect_to root_path
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  private

  def task_params
      # *Strong params*: You need to *whitelist* what can be updated by the user
      # Never trust user data!
      params.require(:task).permit(:name, :done)
  end


end
