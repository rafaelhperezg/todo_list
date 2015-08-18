class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

# -------------
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
    redirect_to root_path #sinon on sera dirigé vers une page qui s'appelle tasks dans laquelle il ny a rien
  end
# --------------

  def edit
    # if we make a raise here we can see that the link "Modify task" from index.html
    # that sends us here passed a params like this {"controller"=>"tasks", "action"=>"edit", "id"=>"1"}
    # so we cand do params[:id] and not params["task"[:id]]
    @task = Task.find(params[:id])
  end

  def update
    # from edit we get a params[task] that we need to filter with the private method task_params
  @task = Task.find(params[:id]) #This is not good => @task = Task.find(params["task"][:id])
  #                         ifi see the paramsin this stade, the id is a key of params, tasks is another id containing
  #                          the name and the done state
  @task.update(task_params)
  redirect_to root_path
  end

# --------------

  def show
    @task = Task.find(params[:id])  #I receive the params when the user click on the link Show task
  end

# --------------
  def destroy
    @task = Task.find(params[:id])  #I receive the params when the user click on the link delete
    @task.destroy
    redirect_to root_path
  end

  private

  def task_params
      # *Strong params*: You need to *whitelist* what can be updated by the user
      # Never trust user data!
      params.require(:task).permit(:name, :done)
  end


end
