require 'sinatra'
# Your app
class TODOAPP

  def get_todos
    @@id ||=0
    @@todos ||= {}
  end

  def get_todo(id)
    get_todos()[id]
  end

  def add_todo(todo,date)
    @@id+=1
    get_todos()[@@id]=[todo,date]
  end

  def update_todo(id,title)
    get_todos()[id][0] = title
  end

  def delete_todo(id)
    get_todos().delete(id)
  end

end
  TODOOBJ=TODOAPP.new

  get "/todos/:id" do
    @id = params[:id].to_i
    @todo =TODOOBJ. get_todo(@id)
    erb :todo
  end

  put "/todos/:id" do
    @id = params[:id].to_i
    TODOOBJ.update_todo(@id,params[:title])
     redirect "/todos"
  end

  delete "/todos/:id" do
    @id = params[:id].to_i
    TODOOBJ.delete_todo(@id)
    redirect "/todos"
  end

  get "/todos" do
    @todos =TODOOBJ.get_todos()
    erb :todos
  end

  post "/todos" do
    if params[:title].strip!=""
    TODOOBJ.add_todo(params[:title],params[:date])
  end
  
    redirect "/todos"
  end