require 'rails_helper'

describe 'Static pages', type: :request do

  let(:base_title) { 'Ruby on Rails Tutorial Sample App' }

  subject { page }

  shared_examples 'all static pages' do
    it { should have_http_status(:success) }
    it { should have_content(heading) }
    it { should have_title(full_title(page_title)) } # (support/uti)
  end

  describe 'Home page' do
    before { visit root_path }
    let(:heading)    { 'Sample App' }
    let(:page_title) { '' }
    it_behaves_like 'all static pages'
    it { should_not have_title('Home') }
    it { should have_selector('h1', text: 'Sample App') }
  end

  describe 'Help page' do
    before { visit help_path }
    let(:heading)    { 'Help' }
    let(:page_title) { 'Help' }
    it_behaves_like 'all static pages'
  end

  describe 'About page' do
    before { visit about_path }
    let(:heading)    { 'About' }
    let(:page_title) { 'About' }
    it_behaves_like 'all static pages'
  end

  describe 'Contact page' do
    before { visit contact_path }
    let(:heading)    { 'Contact' }
    let(:page_title) { 'Contact' }
    it_behaves_like 'all static pages'
  end

end