class TodosController < ApplicationController
  before_action :set_todo, only: [:edit, :show, :destroy]
    
  def new
    #@todo - instance variable visible on view and controller
    @todo = Todo.new
  end
  
  def create
    @todo = Todo.new(todo_params)
    if @todo.save      
      # save post
         flash[:notice] = "Todo was successfully created"
         redirect_to todos_path(@todo) 
         # redirect_to @post 
    else
       render 'new'           
    end
    
  end
  
  def show             
    #@todo = Todo.find(params[:id]) 
    #err
    #ActiveRecord::RecordNotFound in TodosController#show
    #Couldn't find Todo without an ID   
    
    # why only format is working?
    #@todo = Todo.find(params[:format])
  end
  
  def edit 
    #@todo = Todo.find(params[:format])
  end 

  def update
    @todo = Todo.find(params[:todo][:id])
    if (params[:commit] == "Update")           
      if @todo.update(todo_params)
        flash[:notice] = "Todo was successfully updated"
        redirect_to todos_path(@todo)
      else
        render 'edit'
      end
    elsif params[:commit] == "Delete"      
      @todo.destroy 
      flash[:notice] = "Todo was deleted successfully"   
      redirect_to "/todos/index"
    end
  end
  
  def index
      @todos = Todo.all
  end
    
  def destroy
   # @todo = Todo.find(params[:format])
    @todo.destroy
    flash[:notice] = "Todo was deleted successfully"    
    redirect_back(fallback_location: root_path)
  end
  
  def delete
     @todo = Todo.find(params[:format])
     @todo.destroy
     flash[:notice] = "Todo was deleted successfully"
     #redirect_to todos_path
     redirect_back(fallback_location: root_path)
   end
  
  private
    
    def set_todo
     @todo = Todo.find(params[:format])
    end
    
    def todo_params 
      params.require(:todo).permit(:name, :description)
      #params.require(:todo).permit!      
      # params.permit(:id)
    end
  
end