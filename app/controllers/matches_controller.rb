class MatchesController < ApplicationController

  def filter_matches # for player and tournament
    player = Player.find_by_name(params[:player_name])
    tournament = Tournament.find_by_name(params[:tournament_name])

    unless player || tournament
      render json: { success: false, error: 'Invalid player name and tournament name' }
      return
    end
    unless player
      render json: { success: true, matches: tournament.matches.as_json(include: %i[group venue]) }
      return
    end
    tournament_id = tournament ? tournament.id : nil
    render json: { success: true, matches: player.filter_matches(tournament_id) }
  end
end
