# This file contains subroutines used among the other scripts.
# It is not meant to be run standalone.

require 'io/console'
require 'date'
require 'time'
require 'yaml'

##################
# git helpers
##################

def git_remote_repo_name
  foo = `git config --get remote.origin.url`
  foo.chomp.split('/')[-1]
end

# name of the currently checked-out branch
def git_current_branch
  `git rev-parse --abbrev-ref HEAD`.rstrip
end

# ticket ID, extracted from the name of the currently checked-out branch
# returns nil if not that kind of a branch
def git_current_ticket_or_nil
  branch = git_current_branch
  ticket = branch.scan(/[A-Z]+[-_]\d+/i)
  return nil if ticket.nil? || ticket.empty?
  ticket[0].sub('_', '-')
end

# ticket ID, extracted from the name of the currently checked-out branch
def git_current_ticket
  ticket = git_current_ticket_or_nil
  abort("can't determine ticket") if ticket.nil?
  ticket
end

# merge from parent to branch
def git_pull_and_merge(parent, branch)
  `git checkout #{parent}`
  `git pull -p`
  `git checkout #{branch}`
  `git pull -p`
  `git merge #{parent}`
  puts "... merged from #{parent} to #{branch}"
end

# push current branch (and create upstream if required)
def git_push_current_branch
  current_branch = git_current_branch
  `git push --set-upstream origin #{current_branch}`
  puts "... pushed branch #{current_branch}"
end

##################
# branch parent assignments
##################

# determine whether branch is a "root", i.e. if we want to
# stop upwards recursion when we encounter it
def root_branch?(branch)
  branch == 'saas' || branch == 'develop' || branch.start_with?('release/') || branch.start_with?('feature/')
end

# for a branch, get the name of the file where we store its metadata
def get_description_file(branch)
  home = ENV['HOME']
  branch_clean = branch.tr(' ', '_').tr('/', '_')
  "#{home}/.gitsupport/#{branch_clean}"
end

def get_branch_info(branch)
  file = get_description_file(branch)
  unless File.exist?(file)
    return {}
  end

  text = IO.read(file)
  unless text.start_with?('---')
    # handle old file with just parent, before upgrade to YAML
    return { 'parent' => text.rstrip }
  end

  begin
    return YAML.load(text)
  rescue
    puts "unable to parse file #{file}"
  end

  {}
end

def save_branch_info(branch, info)
  description_file = get_description_file(branch)
  info['updated'] = Time.now.strftime('%Y-%m-%d')
  File.open(description_file, 'w') do |file|
    file.write info.to_yaml
  end
end


# parent of the specified branch
# (returns nil if we can't look it up)
def get_parent_branch(branch)
  info = get_branch_info(branch)
  parent = info['parent']

  if branch!='develop' && branch!='master' && parent.nil?
    puts "found branch #{branch} with UNKNOWN PARENT"
  end

  parent
end

# for a branch, assign its parent
def set_parent_branch(branch, parent)
  info = get_branch_info(branch)
  info['parent'] = parent
  info['parent_build'] = nil
  save_branch_info(branch, info)
end

# last parent build merged into specified branch
# (returns nil if we can't look it up)
def get_parent_build(branch)
  info = get_branch_info(branch)
  info['parent_build']
end

def set_parent_build(branch, build)
  info = get_branch_info(branch)
  info['parent_build'] = build
  save_branch_info(branch, info)
end

def get_merge_ticket(branch)
  info = get_branch_info(branch)
  info['merge_ticket']
end

def set_merge_ticket(branch, build)
  info = get_branch_info(branch)
  info['merge_ticket'] = build
  save_branch_info(branch, info)
end

def get_pr_message(branch)
  info = get_branch_info(branch)
  info['pr_message']
end

def set_pr_message(branch, message)
  info = get_branch_info(branch)
  info['pr_message'] = message
  save_branch_info(branch, info)
end


# gets current branch and either single parent or all
# parents.
def get_ancestors(recursive)
  current_branch = git_current_branch
  list = [current_branch]

  branch = current_branch
  until root_branch?(branch)

    parent_branch = get_parent_branch(branch)
    break if parent_branch.nil?

    list.unshift(parent_branch)
    branch = parent_branch

    break unless recursive
  end

  list
end

# parent of the currently checked-out branch
def lookup_parent_branch
  current_branch = git_current_branch
  get_parent_branch(current_branch)
end

def lookup_merge_ticket
  current_branch = git_current_branch
  get_merge_ticket(current_branch)
end

# for a branch, delete the file where we've assigned its parent
def clear_parent_branch(branch)
  description_file = get_description_file(branch)
  if File.exist?(description_file)
    File.delete(description_file)
    puts "... deleted ok: #{description_file}"
  else
    puts "... not found to delete: #{description_file}"
  end
end

##################
# IO helpers
##################

# prompt and return answer
def ask(*args)
  print(*args)
  gets.strip
end

# prompt for yes-or-no answer with default
def yes_or_no(prompt = 'Continue?', default = true)
  a = ''
  s = default ? '[Y/n]' : '[y/N]'
  d = default ? 'y' : 'n'
  until %w(y n).include? a
    a = ask("#{prompt} #{s} ").downcase
    a = d if a.empty?
  end
  a == 'y'
end

def prompt_for_password
  print 'password? '
  password = STDIN.noecho(&:gets).rstrip
  puts
  password
end

# print a banner announcement
def announce(msg)
  puts
  puts '=============================='
  puts "=== #{msg}"
  puts '=============================='
end


