# frozen_string_literal: true

class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[show edit update destroy]

  def index
    @tickets = policy_scope(Ticket)
    authorize @tickets, policy_class: TicketPolicy
  end

  def show; end

  def new
    @ticket = Ticket.new
    authorize @ticket, policy_class: TicketPolicy
  end

  def edit; end

  def create
    @ticket = current_user.tickets.build(ticket_params)
    authorize @ticket, policy_class: TicketPolicy

    if @ticket.save
      flash[:notice] = 'Ticket was successfully created.'
      render :show
    else
      flash[:alert] = 'Ticket was not created.'
      render :new
    end
  end

  def update
    if @ticket.update(edit_ticket_params)
      flash[:notice] = 'Ticket was successfully updated.'
      render :show
    else
      flash[:alert] = 'Ticket was not updated.'
      render :edit
    end
  end

  def destroy
    if @ticket.destroy
      flash[:notice] = 'Ticket was successfully destroyed.'
      render :index
    else
      flash[:alert] = 'Ticket was not destroyed.'
      render :show
    end
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
    authorize @ticket, policy_class: TicketPolicy
  end

  def ticket_params
    params.require(:ticket).permit(:title, :type, :status, :project_id, :description, :deadline, :screen_shot, :assigned_to_id)
  end

  def edit_ticket_params
    if @ticket.Bug?
      params.require(:bug).permit(:title, :type, :status, :project_id, :description, :deadline, :screen_shot, :assigned_to_id)
    else
      params.require(:feature).permit(:title, :type, :status, :project_id, :description, :deadline, :screen_shot, :assigned_to_id)
    end
  end
end
