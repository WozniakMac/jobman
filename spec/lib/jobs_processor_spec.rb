# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/jobs_processor'

describe JobsProcessor do
  describe '.process' do
    context 'when job list is empty' do
      it 'returns empty list' do
        expect(described_class.process('')).to eq('')
      end
    end

    context 'when we pass jobs list without dependeicies' do
      it 'returns this same list' do
        expect(described_class.process('asdf')).to eq('asdf')
      end
    end
  end
end
