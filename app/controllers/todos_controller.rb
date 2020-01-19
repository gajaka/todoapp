class TodosController < ApplicationController
	before_action :set_todo, only: [:show, :edit, :update, :destroy] 

def new
	@todo=Todo.new	
end

def create
	@todo= Todo.new(todo_params)
	if @todo.save
	  flash[:notice]="Todo is created successfully!"
	  redirect_to todo_path(@todo)
	else 
	  render 'new'
	end
end


def show 
end

def edit
end

def update
	if @todo.update(todo_params)
          flash[:notice]="Todo is updated  successfully!"
          redirect_to todo_path(@todo)
        else
          render 'edit'
        end
end

def destroy
	@todo.destroy
	flash[:notice]="Todo was deleted successfully."
	redirect_to todos_path
end

def index
	@todos=Todo.all	
end

private

def set_todo
@todo = Todo.find(params[:id])
end



def todo_params
	params.require(:todo).permit(:name, :description)
end

end
