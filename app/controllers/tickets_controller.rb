# frozen_string_literal: true

class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[show edit update destroy]

  def index
    @tickets = policy_scope(Ticket)
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
      redirect_to ticket_url(@ticket)
      flash[:notice] = 'Ticket was successfully created.'
    else
      redirect_to new_ticket_path
      flash[:alert] = 'Ticket was not created.'
    end
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to ticket_url(@ticket)
      flash[:notice] = 'Ticket was successfully updated.'
    else
      flash[:alert] = 'Ticket was not updated.'
    end
  end

  def destroy
    if @ticket.destroy
      redirect_to tickets_url
      flash[:notice] = 'Ticket was successfully destroyed.'
    else
      flash[:alert] = 'Ticket was not destroyed.'
    end
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
    authorize @ticket, policy_class: TicketPolicy
  end

  def ticket_params
    params.require(:ticket).permit(:title, :type, :status, :project_id, :description, :deadline)
  end
end
