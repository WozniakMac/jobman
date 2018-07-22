# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/jobs_processor'

describe JobsProcessor do
  subject(:jobs_processor) { described_class.new }

  describe '.process' do
    context 'when job list is empty' do
      it 'returns empty list' do
        expect(jobs_processor.process({})).to eq('')
      end
    end

    context 'when we pass jobs list without dependeicies' do
      let(:jobs_list) do
        {
          'a' => nil,
          's' => nil,
          'd' => nil,
          'f' => nil
        }
      end

      it 'returns this same list' do
        expect(jobs_processor.process(jobs_list)).to eq('asdf')
      end
    end

    context 'when we pass jobs with one dependency' do
      let(:jobs_list) do
        {
          'a' => nil,
          'b' => 'c',
          'c' => nil
        }
      end

      it 'returns this same list' do
        expect(jobs_processor.process(jobs_list)).to eq('acb')
      end
    end
  end
end
