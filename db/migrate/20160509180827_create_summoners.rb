class CreateSummoners < ActiveRecord::Migration
  def change
  	create_table :summoners do |tea|
  		tea.string	:summoner_name
  		tea.integer	:summoner_id

  		tea.timestamps
  	end
  end
end
