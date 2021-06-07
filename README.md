# Kurabu Test

As future Full Stack Developer at Kurabu, it will be up to you to continue the work and build upon the existing code base. Our platform relies on [Phoenix](https://www.phoenixframework.org) and [React Native](https://reactnative.dev). The goal of this test is to demonstrate your understanding of the basics of these frameworks and how they interact.

## The task

Clone this repository to your machine and setup both projects.

The task is to create an API in the Phoenix backend that will be consumed by the React Native client. 

In the backend, setup a `Post` model and add corresponding API endpoints. In the mobile client, fetch and display the posts from the backend. From the mobile client, you should be able to sort and filter the posts and create a new post.

You can disregard any authentication/authorization concerns. User interface design is not important and we leave it up to you.

When you are done, please submit your solution as pull request.

### Setup

You'll find installation instructions in each project. The installation of all necessary dependencies can take quite some time. Don't worry, there is no time limit on this task.

- [Backend setup](https://github.com/santoshD93/kurabu-test-khubaib/tree/master/backend#readme)
- [Mobile setup](https://github.com/santoshD93/kurabu-test-khubaib/tree/master/mobile#readme)

### Functionality Requirements

Below, we detailed the functional requirements. It is up to you how you implement the features but we care about understanding your thought process and code quality practices. Feel free to add any additional functionality, but don't worry about the user interface.

#### Backend

- Setup a `Post` model with the following attributes:

  - `title` string
  - `body` text
  - `status` Enum with `unpublished` (default) and `published` options
  - `published_at` timestamp (default sorting in descending order)
  - `created_at` and `updated_at` timestamps

- Add API endpoints for all CRUD operations for `Post`.

#### Mobile

- Fetch posts from the backend and display them.
- Add the option to filter the posts by `status`.
- Add the option to sort the posts by `published_at` or `title`.
- Add the functionality to create a new post and sync with the backend.
