class TodosController < ApplicationController
  
  def new
    #@todo - instance variable visible on view and controller
    @todo = Todo.new
  end
  
  def create
    @todo = Todo.new(todo_params)
    if @todo.save      
      # save post
         flash[:notice] = "Todo was created successfully created"
         redirect_to todos_path(@todo)
    else
      #if save is not ok: because name or description are empty- display again 
      render 'new'       
    end
    
  end
  
  def show    
         
    #@todo = Todo.find(params[:id]) 
    #err
    #ActiveRecord::RecordNotFound in TodosController#show
    #Couldn't find Todo without an ID   
    
    # why only format is working?
    @todo = Todo.find(params[:format])
  end
  
  #def edit 
    #@todo = Todo.find(params[:id])
  #end 
  
  
  
  private
    def todo_params 
      params.require(:todo).permit(:id, :name, :description)
      #params.require(:todo).permit!      
      # params.permit(:id)
    end
  
end