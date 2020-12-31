# == Schema Information
#
# Table name: translated_names
#
#  id            :integer          not null, primary key
#  resource_type :string
#  resource_id   :integer
#  language_id   :integer
#  name          :string
#  language_name :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TranslatedName do
  context 'with associations' do
    it { is_expected.to belong_to :language }
    it { is_expected.to belong_to :resource }
  end

  context '#methods' do
    it { expect(described_class).to respond_to(:filter_by_language_or_default) }
  end

  context 'with columns and indexes' do
    columns = {
      resource_type: :string,
      resource_id: :integer,
      language_id: :integer,
      name: :string,
      language_name: :string,
      language_priority: :integer
    }

    indexes = [
      ['language_id'],
      ['resource_type', 'resource_id']
    ]

    it_behaves_like 'modal with column', columns
    it_behaves_like 'modal have indexes on column', indexes
  end
end
