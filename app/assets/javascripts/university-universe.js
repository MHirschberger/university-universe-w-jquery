//GET request to display courses on university index page

class Course {
    constructor(id, courseNumber, name, department, professor) {
        this.id = id;
        this.courseNumber = courseNumber;
        this.name = name;
        this.department = department;
        this.professor = professor;
    }

    appendCourse(selector) {
        selector.append('<tr>' +
            `<td> ${this.name} </td>` +
            `<td> ${this.courseNumber} </td>` +
            `<td> ${this.department} </td>` +
            `<td> ${this.professor} </td>` +
        `</tr>`);
    }
 }
 let newCourse;

$(function() {
    $("td").find(".uni-courses").on('click', function() {
        $.get("/universities/" + $(this).attr("id") + "/courses", function(data) {
            console.log(data);
            $(".coursetable").html("");
            $(".coursetable").append('<h2>Courses for: ' + data[0].university.name + '</h2><br>' + 
            '<p>Select course name for more details and to view posts.</p>' +
                '<table border="1">' + 
                    '<tr>' + 
                        '<th>Course Name</th>' +
                        '<th>Course Number</th>' +
                        '<th>Department</th>' +
                        '<th>Professor</th>' +
                    '</tr>' +
                '</table>');
            $.each(data, function() {
                newCourse = new Course(this.id, this.course_number, this.name, this.department, this.professor);
                newCourse.appendCourse($(".coursetable table"));
            });
        });
    });
});
