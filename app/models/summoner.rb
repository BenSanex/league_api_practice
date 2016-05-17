class Summoner < ActiveRecord::Base


	def self.get_id(summoner_name)
		uri = URI('https://na.api.pvp.net/api/lol/na/v1.4/summoner/by-name/' + summoner_name + '?api_key=' + RIOT_API_KEY)

		raw_json = Net::HTTP.get(uri)

		parsed_data = JSON.parse(raw_json, symbolize_names: true)

		summoner_id = parsed_data.values[0][:id].to_s
		return summoner_id
	end

	def ranked_stats
		id = self.summoner_id.to_s
		uri = URI('https://na.api.pvp.net/api/lol/na/v1.3/stats/by-summoner/' + id + '/ranked?api_key=' + RIOT_API_KEY)

		raw_json = Net::HTTP.get(uri)

		parsed_data = JSON.parse(raw_json, symbolize_name: true)
		return parsed_data
	end

end
