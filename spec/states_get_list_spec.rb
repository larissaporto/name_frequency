require 'spec_helper'

describe Api do
  describe '.list_states' do
    it 'should get states list through API' do
      states_list = File.read('spec/support/states_list.json')
      response = double('response', status: 200, body: states_list)
      url = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados'

      allow(Faraday).to receive(:get).with(url).and_return(response)

      result = Api.new.list_states

      expect(result[0][:id]).to eq(11)
    end
  end

  describe '.list_uf_rankings' do
    it 'should get state ranking through API' do
      choice = 11
      states_list = File.read('spec/support/uf_rankings.json')
      response = double('response', status: 200, body: states_list)
      url = 'https://servicodados.ibge.gov.br/' \
          "api/v2/censos/nomes/ranking?localidade=#{choice}"

      allow(Faraday).to receive(:get).with(url).and_return(response)

      result = Api.new.list_uf_rankings(choice)
      expect(result.first[:res][0][:nome]).to eq('MARIA')
    end
  end

  describe '.list_uf_feminine' do
    it 'should get states feminine ranking through API' do
      choice = 11
      states_list = File.read('spec/support/uf_rank_fem.json')
      response = double('response', status: 200, body: states_list)
      url = 'https://servicodados.ibge.gov.br/' \
          "api/v2/censos/nomes/ranking?localidade=#{choice}&&sexo=F"

      allow(Faraday).to receive(:get).with(url).and_return(response)

      result = Api.new.list_uf_feminine(choice)

      expect(result[0][:res][0][:nome]).to eq('MARIA')
    end
  end
end
