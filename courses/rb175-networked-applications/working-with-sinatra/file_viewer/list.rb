# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'

get '/' do
  @names = Dir.glob('public/*').map { |file| File.basename(file) }.sort

  @names.reverse! if params[:sort] == 'desc'

  erb :list
end

