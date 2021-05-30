# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'yaml'

# Can refer to LS's content to see a different implementation

before do
  @file_content = YAML.load_file('data/users.yaml')
end

get '/' do
  @names = names

  erb :home
end

get '/:username' do
  @email = email_of(params[:username])
  @interests = interests_of(params[:username])
  @footer_names = footer_names(params[:username])

  erb :user
end

helpers do
  def no_of_users
    names.size
  end

  def count_interests
    @file_content.values.map do |hsh|
      hsh[:interests]
    end.flatten.size
  end
end

def names
  @file_content.keys
end

def email_of(name)
  @file_content[name.to_sym][:email]
end

def interests_of(name)
  @file_content[name.to_sym][:interests]
end

def footer_names(name)
  (@file_content.keys - [name.to_sym]).map(&:to_s)
end
