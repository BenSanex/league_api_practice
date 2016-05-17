get '/' do
	erb :username
end

post '/username' do
	p params[:summoner_name]
	summoner_id = Summoner.get_id(params[:summoner_name])
	@summoner = Summoner.new(summoner_name: params[:summoner_name], summoner_id: summoner_id)

	erb :user_profile
end
