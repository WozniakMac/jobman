# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/jobs_list'

describe JobsList do
  subject(:jobs_list) { described_class.new(jobs_list_hash) }

  describe '#next?' do
    context 'when jobs list is empty' do
      let(:jobs_list_hash) { {} }

      it 'returns false' do
        expect(jobs_list.next?).to be false
      end
    end

    context 'when jobs list is not empty' do
      let(:jobs_list_hash) { { 'a' => nil } }

      it 'returns true' do
        expect(jobs_list.next?).to be true
      end
    end
  end

  describe '#next' do
    context 'when jobs list is empty' do
      let(:jobs_list_hash) { {} }

      it 'returns nil' do
        expect(jobs_list.next).to be nil
      end
    end

    context 'when jobs list is not empty' do
      let(:jobs_list_hash) { { 'a' => nil } }

      it 'returns true' do
        expect(jobs_list.next).to eq 'a'
      end
    end
  end

  describe '#dependency' do
    context 'when jobs list is empty' do
      let(:jobs_list_hash) { {} }

      it 'returns nil' do
        expect(jobs_list.dependency('a')).to be nil
      end
    end

    context 'when jobs list is not empty' do
      let(:jobs_list_hash) { { 'a' => 'b' } }

      it 'returns dependency' do
        expect(jobs_list.dependency('a')).to eq 'b'
      end
    end
  end

  describe '#delete' do
    context 'when deleting job does not exist' do
      let(:jobs_list_hash) { {} }

      it 'returns nil' do
        expect(jobs_list.delete('a')).to be nil
      end
    end

    context 'when jobs list is not empty' do
      let(:jobs_list_hash) { { 'a' => 'b' } }

      it 'delete job' do
        jobs_list.delete('a')
        expect(jobs_list.next?).to be false
      end
    end
  end

  describe '#contain?' do
    context 'when jobs list is empty' do
      let(:jobs_list_hash) { {} }

      it 'returns false' do
        expect(jobs_list.contain?('a')).to be false
      end
    end

    context 'when jobs list is not empty' do
      let(:jobs_list_hash) { { 'a' => nil } }

      it 'returns true' do
        expect(jobs_list.contain?('a')).to be true
      end
    end
  end
end
