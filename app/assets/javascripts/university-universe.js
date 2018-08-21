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

 class Post {
    constructor(id, createdAt, updatedAt, postType, user, content, course_id) {
        this.id = id;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.postType = postType;
        this.user = user;
        this.content = content;
        this.course_id = course_id;
        // this.courseNumber = courseNumber;
        // this.courseName = courseName;
        // this.university = university;
    }

    changePost() {
        $(".post-created").text(`Created: ${this.createdAt}`);
        $(".post-updated").text(`Last Updated: ${this.updatedAt}`);
        $(".post-type").text(`Post Type: ${this.postType}`);
        $(".post-user-name").text(`Written by: ${this.user}`);
        $(".post-content").text(`${this.content}`);
    }

    addNewPost(selector) {
        $(selector).append(`${this.createdAt}<br>`);
        $(selector).append(`${this.postType}<br>`);
        $(selector).append(`Written by: ${this.user}<br></br>`);
        $(selector).append(`${this.content}<br></br>`);
        $(selector).append(`<a href="/courses/${this.course_id}/posts/${this.id}">See Post Details</a><br></br>`);
        $(selector).append(`<a href="/courses/${this.course_id}/posts/${this.id}/edit">Edit Post</a><br>`);
    }
 }


let newCourse;

$(function() {
   
    $(".centered").on('click', ".uni-courses", function() {
        $.get("/universities/" + $(this).attr("id") + "/courses", function(data) {
            event.preventDefault();
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

    $(".js-next-course").on("click", function(event) {
        event.preventDefault();
        let courseId = parseInt($(".js-next-course").attr("data-courseId"));
        let numPosts = parseInt($(".js-next-course").attr("data-numPosts"));
        let nextId = ((parseInt($(".js-next-course").attr("data-id"))) % numPosts) + 1;
        $.get(`/courses/${courseId}/posts/${nextId}.json`, function(data) {
            nextPost = new Post(data.id, data.created, data.last_updated, data.post_type, data.user.name, data.content, data.course.id);
            nextPost.changePost();
            $(".js-next-course").attr("data-id", data.id);
        });
    });

    $(".js-prev-course").on("click", function(event) {
        event.preventDefault();
        let courseId = parseInt($(".js-next-course").attr("data-courseId"));
        let numPosts = parseInt($(".js-next-course").attr("data-numPosts"));
        let currentId = parseInt($(".js-next-course").attr("data-id"));
        let prevId = (((currentId - 1) + (numPosts - 1)) % numPosts) + 1;
        $.get(`/courses/${courseId}/posts/${prevId}.json`, function(data) {
            prevPost = new Post(data.id, data.created, data.last_updated, data.post_type, data.user.name, data.content, data.course.id);
            prevPost.changePost();
            $(".js-next-course").attr("data-id", data.id);
        });
    });

    $("#new-post").on("submit", function(event) {
        event.preventDefault();
        $.ajax({
            type: "POST",
            url: $(this).attr('action'),
            data: $(this).serialize(),
            dataType: "JSON"
        }).done(function(data) {
            newPost = new Post(data.id, data.created, data.last_updated, data.post_type, data.user.name, data.content, data.course.id);
            let newDiv = $("<div>", {"id": `${data.id}`, "class": "post"});
            $(".post-list").prepend(newDiv);
            newPost.addNewPost(`.post#${data.id}`);
        }).fail(function(data) {
            $("#error_explanation").append("<h3>Errors:</h3>" +
            "<ul>" +
                $.each(data.responseJSON.content, function() {
                    `<li>${this}</li>`
                }) +
            "</ul>")
        }); 
    }); 
});

