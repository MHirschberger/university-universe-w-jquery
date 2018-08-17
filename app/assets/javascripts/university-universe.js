//GET request to display courses on university index page

// window.onload = function() {
//     if(!window.location.hash) {
//         window.location.reload();
//         window.location = window.location + '#loaded';
//     }
// }

class Course {
    constructor(id, courseNumber, name, department, professor, university) {
        this.id = id;
        this.courseNumber = courseNumber;
        this.name = name;
        this.department = department;
        this.professor = professor;
        this.university = university;
    }

    appendCourse(selector) {
        selector.append('<tr>' +
            `<td><a href="/courses/${this.id}/posts">${this.name}</a></td>` +
            `<td><a href="/courses/${this.id}/posts">${this.courseNumber}</a></td>` +
            `<td> ${this.department} </td>` +
            `<td> ${this.professor} </td>` +
        '</tr>');
    }

 }
let newCourse;

$(function() {
   
    $("td").find(".uni-courses").on('click', function() {
        $.get("/universities/" + $(this).attr("id") + "/courses", function(data) {
            console.log(data);
            $(".coursetable").html("");
            $(".coursetable").append('<h1>Course Index</h1><br>' + '<h2>' + data[0].university.name + '</h2>' + 
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
                newCourse = new Course(this.id, this.course_number, this.name, this.department, this.professor, this.university.name);
                newCourse.appendCourse($(".coursetable table"));
            });
        });
    });

    $(".js-next-course").on("click", function() {
        var nextId = parseInt($(".js-next-course").attr("data-id")) + 1
        $.get("/courses/" + nextId + "/posts", function(data) {
            $(".course-number").text(data["name"]);
            $(".course-name").text(data["price"]);
            $(".productInventory").text(data["inventory"]);
            $(".productDescription").text(data["description"]);
            $(".js-next").attr("data-id", data["id"]);
        });
    });
});
