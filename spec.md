# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project

- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes) 
        University has_many Courses. 

- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
        Course belongs_to University

- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
        User has_many Courses through Posts. 
        Course has_many Users through Posts.

- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
        Posts have content, and a post_type(current student, review, other).

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
        Validations included for Course, Post, University, and User.

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
        Posts can be filtered by post_type. 
        Class method name: Post.filter
        URL: /courses/:course_id/posts

- [x] Include signup (how e.g. Devise)
        New user can create account with name, email, and password. Password encrypted with bcrypt/has_secure_password.

- [x] Include login (how e.g. Devise)
        User logs in with email and password. Controlled by SessionsController.

- [x] Include logout (how e.g. Devise)
        destroy method in SessionsController.

- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
        Facebook OmniAuth implemented.

- [x] Include nested resource show or index (URL e.g. users/2/recipes)
        URL: /courses/1/posts

- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
         URL: /courses/1/posts/new

- [x] Include form display of validation errors (form URL e.g. /recipes/new)
        /universities/new, /universities/1/edit,
        /universities/1/courses/new, /courses/1/edit
        /courses/1/posts/new, /courses/1/posts/1/edit

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
