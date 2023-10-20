namespace :invoices do
  desc "Process invoices"
  task process: :environment do
    current_date = DateTime.now
    Customer.where("day <= ?", current_date.day).each do |customer|
      if customer.invoices.where(event_date: current_date.beginning_of_month..current_date.end_of_month).size == 0
        success = random_boolean
        if success
          Invoice.create(
            customer_id: customer.id, event_date: Date.today,
            logs: nil, success: success,
            invoice_type_id: customer.invoice_type.id,
          )
        else
          log_error = "Erro ao processar pagamento"
          Invoice.create(
            customer_id: customer.id, event_date: Date.today,
            logs: log_error, success: success,
            invoice_type_id: customer.invoice_type.id,
          )
        end
      end
    end
  end
  
  desc "Reprocess invoices"
  task reprocess: :environment do
    Customer.all.each do |customer|
      customer.invoices.where(success: false).each do |invoice|
        success = random_boolean
        invoice.success = success
        if success
          invoice.logs = nil
        else
          log_error = "Erro ao reprocessar pagamento"
          invoice.logs = log_error
        end
        invoice.save
      end
    end
  end
  
  def random_boolean
    random_number = rand
    threshold = 0.95
    return random_number < threshold
  end
end
