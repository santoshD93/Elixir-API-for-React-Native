# Seeds for creating sample posts for development. You can run it as:
#
#     mix run priv/repo/seeds.exs
#

import Backend.PostFactory

for _n <- 1..10, do: insert!(:post)
for _n <- 1..5, do: insert!(:post, status: :published, published_at: DateTime.utc_now)
