defmodule Backend.PostFactory do
  alias Backend.Repo
  alias Backend.Posts.Post

  # Factories

  def build(:post) do
    %Post{
      title: Faker.Superhero.En.name(),
      body: Faker.Lorem.paragraph()
    }
  end

  # Convenience API

  def build(factory_name, attributes) do
    factory_name |> build() |> struct!(attributes)
  end

  def insert!(factory_name, attributes \\ []) do
    factory_name |> build(attributes) |> Repo.insert!()
  end
end
