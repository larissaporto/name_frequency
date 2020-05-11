require 'faraday'
require 'json'

class Api
  def list_states
    url = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados'
    json = get_api(url)

    json
  end

  def get_city(choice)
    url = 'https://servicodados.ibge.gov.br/' \
          "api/v1/localidades/municipios/#{choice}"
    json = get_api(url)

    json[:id]
  end

  def list_city_rankings(choice)
    city = get_city(choice)
    json = list_uf_rankings(city)
    json
  end

  def list_city_masculine(choice)
    city = get_city(choice)
    json = list_uf_masculine(city)
    json
  end

  def list_city_feminine(choice)
    city = get_city(choice)
    json = list_uf_feminine(city)
    json
  end

  def list_uf_rankings(choice)
    url = 'https://servicodados.ibge.gov.br/' \
          "api/v2/censos/nomes/ranking?localidade=#{choice}"
    json = get_api(url)

    json
  end

  def list_uf_masculine(choice)
    url = 'https://servicodados.ibge.gov.br/' \
          "api/v2/censos/nomes/ranking?localidade=#{choice}&&sexo=M"
    json = get_api(url)

    json
  end

  def list_uf_feminine(choice)
    url = 'https://servicodados.ibge.gov.br/' \
          "api/v2/censos/nomes/ranking?localidade=#{choice}&&sexo=F"
    json = get_api(url)

    json
  end

  def get_api(url)
    begin
      response = Faraday.get(url)
    rescue Faraday::ConnectionFailed
      return []
    end

    json = JSON.parse(response.body, symbolize_names: true)
    return [] if response.status == 500

    json
  end
end
