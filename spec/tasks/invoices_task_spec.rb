require 'rails_helper'
require 'rake'

RSpec.describe 'invoices namespace tasks' do
  before :all do
    Rails.application.load_tasks
    Rake::Task.define_task(:environment)
  end

  describe 'invoice_process' do
    it 'creates invoices' do
      allow_any_instance_of(Object).to receive(:random_boolean).and_return(true)
      expect { Rake::Task['invoices:invoice_process'].invoke }.to change(Invoice, :count).by(13)
    end
  end

  describe 'invoice_reprocess' do
    it 'updates invoices' do
      allow_any_instance_of(Object).to receive(:random_boolean).and_return(true)
      customer = create(:customer)
      invoice = create(:invoice, customer: customer, success: false)
      
      expect { Rake::Task['invoices:invoice_reprocess'].invoke }.to change { invoice.reload.success }.to(true)
    end
  end
end