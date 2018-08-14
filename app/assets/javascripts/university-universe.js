//GET request to display courses on university index page

class Course {
    constructor(id, course_number, name, department, professor, university_id) {
        this.id = id;
        this.course_number = course_number;
        this.name = name;
        this.department = department;
        this.professor = professor;
        this.university_id = university_id;
    }

    appendCourseList() {

    }
 }

$(function() {
    $("td").find(".uni-courses").on('click', function() {
        $.get("/universities/" + $(this).attr("id") + "/courses", function(data) {
            console.log(data);
            $(".coursetable").append('<h2>Courses for Selected University</h2><br><p>Select course name for more details.</p>'
            + '<table border="1">' + 
                    '<tr>' + 
                        '<th>Course Name</th>' +
                        '<th>Course Number</th>' +
                        '<th>Department</th>' +
                        '<th>Professor</th>' +
                    '</tr>' +
                    // <% @courses.each do |course| %>
                    // <tr>
                    //     <td><%= link_to course.name, course_posts_path(course) %></td>
                    //     <td><%= link_to course.course_number, course_posts_path(course) %></td>
                    //     <td><%= course.department %></td>
                    //     <td><%= course.professor %></td>
                    // </tr>
                    // <% end %>
                '</table>')
        });
    });
});
