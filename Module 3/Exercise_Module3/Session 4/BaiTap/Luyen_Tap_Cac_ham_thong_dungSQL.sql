create database QuanLySinhVien;
use QuanLySinhVien;

CREATE TABLE Class
(
    ClassID   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ClassName VARCHAR(60) NOT NULL,
    StartDate DATETIME    NOT NULL,
    Status    BIT
);

CREATE TABLE Student
(
    StudentId   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    StudentName VARCHAR(30) NOT NULL,
    Address     VARCHAR(50),
    Phone       VARCHAR(20),
    Status      BIT,
    ClassId     INT         NOT NULL,
    FOREIGN KEY (ClassId) REFERENCES Class (ClassID)
);

CREATE TABLE Subject
(
    SubId   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    SubName VARCHAR(30) NOT NULL,
    Credit  TINYINT     NOT NULL DEFAULT 1 CHECK ( Credit >= 1 ),
    Status  BIT                  DEFAULT 1
);

CREATE TABLE Mark
(
    MarkId    INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    SubId     INT NOT NULL,
    StudentId INT NOT NULL,
    Mark      FLOAT   DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),
    ExamTimes TINYINT DEFAULT 1,
    UNIQUE (SubId, StudentId),
    FOREIGN KEY (SubId) REFERENCES Subject (SubId),
    FOREIGN KEY (StudentId) REFERENCES Student (StudentId)
);

INSERT INTO Class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO Class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO Class
VALUES (3, 'B3', current_date, 0);

INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO Student (StudentName, Address, Status, ClassId)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO Subject
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
       
INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
       
select * FROM Student;

SELECT * FROM Student WHERE Status = true;

select * from Subject where credit < 10;

select Student.StudentId, Student.StudentName, Class.ClassName from 
Student inner join Class on Student.ClassId = Class.ClassID where Class.ClassName = 'A1';

/*Truy v???n CSDL*/ 
/*1*/
select * from Student S where S.StudentName LIKE "h%";

/*2*/
select * from Class where Class.StartDate LIKE "%12%";

/*3*/
select * from Subject where Subject.credit > 3 and Subject.credit < 5;

/*4*/
update Student
SET Student.ClassId = '2'
where Student.StudentName = 'Hung';

/*5*/
Select Stu.StudentName, Sub.SubName, Mark.SubId, 
Mark.StudentId, Mark.Mark, Mark.ExamTimes from 
((Mark Mark inner join Student Stu  on Mark.StudentId = Stu.StudentId) 
inner join Subject Sub on Mark.SubId = Sub.SubId);

/*----------------------------- Th???c h??nh Session 4 -------------------------------*/
-- S??? d???ng h??m count ????? hi???n th??? s??? l?????ng sinh vi??n ??? t???ng n??i
select Stu.Address, count(Stu.StudentID) from Student Stu group by Stu.Address;
-- B?????c 3: T??nh ??i???m trung b??nh c??c m??n h???c c???a m???i h???c vi??n b???ng c??ch s??? d???ng h??m AVG
select Stu.StudentId, Stu.StudentName, avg(Mark) from
Student Stu join Mark on Stu.StudentId = Mark.StudentId
group by Stu.StudentId, Stu.StudentName;
--  B?????c 4: Hi???n th??? nh???ng b???n h???c vi??n co ??i???m trung b??nh c??c m??n h???c l???n h??n 15
select Stu.StudentId, Stu.StudentName, avg(Mark) from
Student Stu join Mark on Stu.StudentId = Mark.StudentId
group by Stu.StudentId, Stu.StudentName having avg(Mark) > 15;

/*----------------------------- B??i T???p Session 4 -------------------------------*/
-- Hi???n th??? t???t c??? c??c th??ng tin m??n h???c (b???ng subject) c?? credit l???n nh???t.
select *, max(Subject.Credit) from Subject;

-- Hi???n th??? c??c th??ng tin m??n h???c c?? ??i???m thi l???n nh???t.
select Subject.SubName, Subject.Credit, Subject.Status, Mark.Mark from
Mark left join Subject on Mark.SubId = Subject.SubId
where mark >= all(select mark from Mark);

-- Hi???n th??? c??c th??ng tin sinh vi??n v?? ??i???m trung b??nh c???a m???i sinh vi??n, 
-- x???p h???ng theo th??? t??? ??i???m gi???m d???n
select Stu.StudentId, Stu.StudentName, avg(Mark.Mark) from
Student Stu inner join Mark on Stu.StudentId = Mark.StudentId
group by Mark.StudentId
order by Mark.Mark DESC;
