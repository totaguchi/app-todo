defmodule PhxVue.ApiTest do
  use PhxVue.DataCase

  alias PhxVue.Api

  describe "todo" do
    alias PhxVue.Api.Post

    @valid_attrs %{date: "some date", details: "some details", end: "some end", start: "some start", title: "some title"}
    @update_attrs %{date: "some updated date", details: "some updated details", end: "some updated end", start: "some updated start", title: "some updated title"}
    @invalid_attrs %{date: nil, details: nil, end: nil, start: nil, title: nil}

    def post_fixture(attrs \\ %{}) do
      {:ok, post} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Api.create_post()

      post
    end

    test "list_todo/0 returns all todo" do
      post = post_fixture()
      assert Api.list_todo() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Api.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      assert {:ok, %Post{} = post} = Api.create_post(@valid_attrs)
      assert post.date == "some date"
      assert post.details == "some details"
      assert post.end == "some end"
      assert post.start == "some start"
      assert post.title == "some title"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Api.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      assert {:ok, %Post{} = post} = Api.update_post(post, @update_attrs)
      assert post.date == "some updated date"
      assert post.details == "some updated details"
      assert post.end == "some updated end"
      assert post.start == "some updated start"
      assert post.title == "some updated title"
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Api.update_post(post, @invalid_attrs)
      assert post == Api.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Api.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Api.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Api.change_post(post)
    end
  end
end
