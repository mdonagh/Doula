require 'test_helper'

class RegistryTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @registry_type = registry_types(:one)
  end

  test "should get index" do
    get registry_types_url
    assert_response :success
  end

  test "should get new" do
    get new_registry_type_url
    assert_response :success
  end

  test "should create registry_type" do
    assert_difference('RegistryType.count') do
      post registry_types_url, params: { registry_type: { name: @registry_type.name } }
    end

    assert_redirected_to registry_type_url(RegistryType.last)
  end

  test "should show registry_type" do
    get registry_type_url(@registry_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_registry_type_url(@registry_type)
    assert_response :success
  end

  test "should update registry_type" do
    patch registry_type_url(@registry_type), params: { registry_type: { name: @registry_type.name } }
    assert_redirected_to registry_type_url(@registry_type)
  end

  test "should destroy registry_type" do
    assert_difference('RegistryType.count', -1) do
      delete registry_type_url(@registry_type)
    end

    assert_redirected_to registry_types_url
  end
end
