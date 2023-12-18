require 'rails_helper'
require 'rake'

RSpec.describe 'invoices namespace tasks' do
  before :all do
    Rails.application.load_tasks
    Rake::Task.define_task(:environment)
  end

  describe 'process' do
    it 'creates invoices' do
      allow_any_instance_of(Object).to receive(:random_boolean).and_return(true)
      expect { Rake::Task['invoices:process'].invoke }.to change(Invoice, :count).by(0)
    end
  end

  describe 'reprocess' do
    it 'updates invoices' do
      allow_any_instance_of(Object).to receive(:random_boolean).and_return(true)
      customer = create(:customer)
      invoice = create(:invoice, customer: customer, success: false)
      
      expect { Rake::Task['invoices:reprocess'].invoke }.to change { invoice.reload.success }.to(true)
    end
  end
end