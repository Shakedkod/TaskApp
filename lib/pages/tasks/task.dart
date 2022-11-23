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

    String getTitle()
    {
        return title;
    }

    String getDescription()
    {
        return description;
    }

    DateTime getDate()
    {
        return date;
    }

    DateTime getDeadline()
    {
        return deadline;
    }

    bool getIsDone()
    {
        return isDone;
    }

    void setIsDone(bool isDone)
    {
        this.isDone = isDone;
    }

    void toggleIsDone()
    {
        isDone = !isDone;
    }

    @override
    String toString()
    {
        return 'Task{title: $title, description: $description, date: $date, deadline: $deadline, isDone: $isDone}';
    }

    @override
    bool operator ==(Object other)
    {
        if (identical(this, other)) return true;

        return other is Task &&
            other.title == title &&
            other.description == description &&
            other.date == date &&
            other.deadline == deadline &&
            other.isDone == isDone;
    }

    @override
    int get hashCode
    {
        return title.hashCode ^
            description.hashCode ^
            date.hashCode ^
            deadline.hashCode ^
            isDone.hashCode;
    }

    Task copyWith({
        String? title,
        String? description,
        DateTime? date,
        DateTime? deadline,
        bool? isDone,
    })
    {
        return Task(
            title: title ?? this.title,
            description: description ?? this.description,
            date: date ?? this.date,
            deadline: deadline ?? this.deadline,
        );
    }

    Map<String, dynamic> toMap()
    {
        return {
            'title': title,
            'description': description,
            'date': date.millisecondsSinceEpoch,
            'deadline': deadline.millisecondsSinceEpoch,
            'isDone': isDone,
        };
    }

    factory Task.fromMap(Map<String, dynamic> map)
    {
        return Task(
            title: map['title'],
            description: map['description'],
            date: DateTime.fromMillisecondsSinceEpoch(map['date']),
            deadline: DateTime.fromMillisecondsSinceEpoch(map['deadline']),
        );
    }
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

    String getSubject()
    {
        return subject;
    }

    String getTeacher()
    {
        return teacher;
    }

    bool getInPersonHandIn()
    {
        return inPersonHandIn;
    }

    @override
    String toString()
    {
        return 'SchoolTask{subject: $subject, teacher: $teacher, inPersonHandIn: $inPersonHandIn, title: $title, description: $description, date: $date, deadline: $deadline, isDone: $isDone}';
    }

    @override
    bool operator ==(Object other)
    {
        if (identical(this, other)) return true;

        return other is SchoolTask &&
            other.subject == subject &&
            other.teacher == teacher &&
            other.inPersonHandIn == inPersonHandIn &&
            other.title == title &&
            other.description == description &&
            other.date == date &&
            other.deadline == deadline &&
            other.isDone == isDone;
    }

    @override
    int get hashCode
    {
        return subject.hashCode ^
            teacher.hashCode ^
            inPersonHandIn.hashCode ^
            title.hashCode ^
            description.hashCode ^
            date.hashCode ^
            deadline.hashCode ^
            isDone.hashCode;
    }

    @override
    SchoolTask copyWith({
        String? subject,
        String? teacher,
        bool? inPersonHandIn,
        String? title,
        String? description,
        DateTime? date,
        DateTime? deadline,
        bool? isDone,
    })
    {
        return SchoolTask(
            subject: subject ?? this.subject,
            teacher: teacher ?? this.teacher,
            inPersonHandIn: inPersonHandIn ?? this.inPersonHandIn,
            title: title ?? this.title,
            description: description ?? this.description,
            date: date ?? this.date,
            deadline: deadline ?? this.deadline,
        );
    }

    @override
    Map<String, dynamic> toMap()
    {
        return {
            'subject': subject,
            'teacher': teacher,
            'inPersonHandIn': inPersonHandIn,
            'title': title,
            'description': description,
            'date': date.millisecondsSinceEpoch,
            'deadline': deadline.millisecondsSinceEpoch,
            'isDone': isDone,
        };
    }

    factory SchoolTask.fromMap(Map<String, dynamic> map)
    {
        return SchoolTask(
            subject: map['subject'],
            teacher: map['teacher'],
            inPersonHandIn: map['inPersonHandIn'],
            title: map['title'],
            description: map['description'],
            date: DateTime.fromMillisecondsSinceEpoch(map['date']),
            deadline: DateTime.fromMillisecondsSinceEpoch(map['deadline']),
        );
    }
}

class HomeTask extends Task
{
    final String category;

    HomeTask({
        required this.category,
        required String title,
        required String description,
        required DateTime date,
        required DateTime deadline
    }) : super(
        title: title,
        description: description,
        date: date,
        deadline: deadline
    );

    String getCategory()
    {
        return category;
    }

    @override
    String toString()
    {
        return 'HomeTask{category: $category, title: $title, description: $description, date: $date, deadline: $deadline, isDone: $isDone}';
    }

    @override
    bool operator ==(Object other)
    {
        if (identical(this, other)) return true;

        return other is HomeTask &&
            other.category == category &&
            other.title == title &&
            other.description == description &&
            other.date == date &&
            other.deadline == deadline &&
            other.isDone == isDone;
    }

    @override
    int get hashCode
    {
        return category.hashCode ^
            title.hashCode ^
            description.hashCode ^
            date.hashCode ^
            deadline.hashCode ^
            isDone.hashCode;
    }

    @override
    HomeTask copyWith({
        String? category,
        String? title,
        String? description,
        DateTime? date,
        DateTime? deadline,
        bool? isDone,
    })
    {
        return HomeTask(
            category: category ?? this.category,
            title: title ?? this.title,
            description: description ?? this.description,
            date: date ?? this.date,
            deadline: deadline ?? this.deadline,
        );
    }

    @override
    Map<String, dynamic> toMap()
    {
        return {
            'category': category,
            'title': title,
            'description': description,
            'date': date.millisecondsSinceEpoch,
            'deadline': deadline.millisecondsSinceEpoch,
            'isDone': isDone,
        };
    }

    factory HomeTask.fromMap(Map<String, dynamic> map)
    {
        return HomeTask(
            category: map['category'],
            title: map['title'],
            description: map['description'],
            date: DateTime.fromMillisecondsSinceEpoch(map['date']),
            deadline: DateTime.fromMillisecondsSinceEpoch(map['deadline']),
        );
    }
}

class ProgramingTask extends Task
{
    final String language;
    final String taskType;

    ProgramingTask({
        required this.language,
        required this.taskType,
        required String title,
        required String description,
        required DateTime date,
        required DateTime deadline
    }) : super(
        title: title,
        description: description,
        date: date,
        deadline: deadline
    );

    String getLanguage()
    {
        return language;
    }

    String getTaskType()
    {
        return taskType;
    }

    @override
    String toString()
    {
        return 'ProgramingTask{language: $language, taskType: $taskType, title: $title, description: $description, date: $date, deadline: $deadline, isDone: $isDone}';
    }

    @override
    bool operator ==(Object other)
    {
        if (identical(this, other)) return true;

        return other is ProgramingTask &&
            other.language == language &&
            other.taskType == taskType &&
            other.title == title &&
            other.description == description &&
            other.date == date &&
            other.deadline == deadline &&
            other.isDone == isDone;
    }

    @override
    int get hashCode
    {
        return language.hashCode ^
            taskType.hashCode ^
            title.hashCode ^
            description.hashCode ^
            date.hashCode ^
            deadline.hashCode ^
            isDone.hashCode;
    }

    @override
    ProgramingTask copyWith({
        String? language,
        String? taskType,
        String? title,
        String? description,
        DateTime? date,
        DateTime? deadline,
        bool? isDone,
    })
    {
        return ProgramingTask(
            language: language ?? this.language,
            taskType: taskType ?? this.taskType,
            title: title ?? this.title,
            description: description ?? this.description,
            date: date ?? this.date,
            deadline: deadline ?? this.deadline,
        );
    }

    @override
    Map<String, dynamic> toMap()
    {
        return {
            'language': language,
            'taskType': taskType,
            'title': title,
            'description': description,
            'date': date.millisecondsSinceEpoch,
            'deadline': deadline.millisecondsSinceEpoch,
            'isDone': isDone,
        };
    }

    factory ProgramingTask.fromMap(Map<String, dynamic> map)
    {
        return ProgramingTask(
            language: map['language'],
            taskType: map['taskType'],
            title: map['title'],
            description: map['description'],
            date: DateTime.fromMillisecondsSinceEpoch(map['date']),
            deadline: DateTime.fromMillisecondsSinceEpoch(map['deadline']),
        );
    }
}