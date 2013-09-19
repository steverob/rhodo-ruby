require 'rho/rhocontroller'
require 'helpers/browser_helper'

class TodoController < Rho::RhoController
  include BrowserHelper

  # GET /Todo
  def index
    @completed = Todo.completed
    @incomplete = Todo.incomplete
    @newTodo = Todo.new
    render :back => '/app'

  end

  # GET /Todo/{1}
  def show
    @todo = Todo.find(@params['id'])
    if @todo
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  def mark_as_complete
    @todo = Todo.find(@params['id'])
    @todo.completed = true
    @todo.save
    redirect :action => :index
  end

  def mark_as_incomplete
    @todo = Todo.find(@params['id'])
    @todo.completed = false
    @todo.save
    redirect :action => :index
  end

  # GET /Todo/new
  def new
    @todo = Todo.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Todo/{1}/edit
  def edit
    @todo = Todo.find(@params['id'])
    if @todo
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Todo/create
  def create
    @todo = Todo.create(@params['todo'])
    redirect :action => :index
  end

  # POST /Todo/{1}/update
  def update
    @todo = Todo.find(@params['id'])
    @todo.update_attributes(@params['todo']) if @todo
    redirect :action => :index
  end

  # POST /Todo/{1}/delete
  def delete
    @todo = Todo.find(@params['id'])
    @todo.destroy if @todo
    redirect :action => :index  
  end
end
