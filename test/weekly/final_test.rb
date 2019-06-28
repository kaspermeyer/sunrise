require "test_helper"

class FinalTest < Sunrise::TestCase
  include Sunrise::Helper

  setup do
    skip "We're not there yet!"
  end

  test "complete set of language features" do
    expected_output = <<~HTML
      <button class="btn btn-primary" data-action="click->modal#open">
        Open modal
      </button>

      <div class="modal fade" data-target="modal.modal" data-modal-form-url="http://localhost:3000/users">
        <h5 class="modal-title">Edit user</h5>
        <div class="modal-content">
          <form>
            <input type="text" name="fullname">
            <input type="hidden" name="bio" id="trix">
            <trix-editor input="trix"></trix-editor>
          </form>
          <blog-post v-for="post in posts" v-bind:key="post.id"></blog-post>
        </div>
        <div class="modal-footer">
          <button class="btn btn-secondary" data-action="click->modal#close">Close</button>
          <button class="btn btn-primary" data-action="click->modal#save">Save</button>
        </div>
      </div>
    HTML

    output = html do
      button 'Open modal', class: 'btn btn-primary', data: {action: 'click->modal#open'}

      div class: 'modal fade', data: {target: 'modal.modal', modal: {form_url: users_path}} do
        h5 'Edit user', class: 'modal-title'
        div class: 'modal-content' do
          form do
            input type: 'text', name: 'fullname'
            input type: 'hidden', name: 'bio', id: 'trix'
            tag :trix_editor, input: 'trix'
          end
          tag :blog_post, 'v-for' => 'comment in comments', 'v-bind:key' => 'comment.id'
        end
        div class: 'modal-footer' do
          button 'Close', class: ['btn', 'btn-secondary'], data: {action: 'click->modal#close'}
          button 'Save', class: ['btn', 'btn-primary'], data: {action: 'click->modal#save'}
        end
      end
    end

    assert_equal squish_html_string(expected_output), output
  end

  def user_path
    'http://localhost:3000/users'
  end
end
