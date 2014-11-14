require 'rails_helper'

RSpec.describe Task, type: :model do
  describe '#intialize' do
    let!(:task) { FactoryGirl.create(:task) }
    it { expect(task.state_name).to eq(:new) }
  end

  describe '#assign' do
    context 'when state is new' do
      let!(:task)           { FactoryGirl.create(:task) }

      before { task.assign }

      it { expect(task.state_name).to eq(:assigned) }
    end

    context 'when state is queue' do
      let!(:task)  { FactoryGirl.create(:queue_task) }

      before { task.assign }

      it { expect(task.state_name).to eq(:assigned) }
    end

    context 'when state is assigned' do
      let!(:task)  { FactoryGirl.create(:assigned_task) }

      before { task.assign }

      it { expect(task.state_name).to eq(:assigned) }
    end

    context 'when state is performed' do
      let!(:task) { FactoryGirl.create(:performed_task) }

      before { task.assign }

      it { expect(task.state_name).to eq(:performed) }
    end

    context 'when state is closed' do
      let!(:task)    { FactoryGirl.create(:closed_task) }

      before { task.assign }

      it { expect(task.state_name).to eq(:closed) }
    end

  end
end
