class Task
{
    final String title;
    final String description;
    final DateTime date;
    final DateTime deadline;
    bool isDone = false;

    Task({
        required this.title,
        required this.description,
        required this.date,
        required this.deadline
    });
}

class SchoolTask extends Task
{
    final String subject;
    final String teacher;
    final bool   inPersonHandIn;

    SchoolTask({
        required this.subject,
        required this.teacher,
        required String title,
        required String description,
        required DateTime date,
        required DateTime deadline,
        required this.inPersonHandIn
    }) : super(
        title: title,
        description: description,
        date: date,
        deadline: deadline
    );
}