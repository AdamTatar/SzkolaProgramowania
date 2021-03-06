use coderslab;

ALTER DATABASE `coderslab` DEFAULT CHARACTER SET utf8 COLLATE utf8_polish_ci;

create table student (
`studentId` int(10) unsigned NOT NULL AUTO_INCREMENT,
`studentName` varchar(255) DEFAULT 'imie studenta',
`studentSurname` varchar(255) DEFAULT 'nazwisko studenta',
`studentEmail` varchar(255) DEFAULT 'email@studenta',				#czy założyć UNIQUE na email?
`studentLogin` varchar(255) DEFAULT 'login studenta',
PRIMARY KEY (`studentId`)
);

create table solution (
`solutionId` int(10) unsigned NOT NULL AUTO_INCREMENT,
`solutionAuthor` int(10) unsigned NOT NULL,
`solutionTitle` varchar(255) DEFAULT 'default title',
`solutionDetails` varchar(10000) DEFAULT 'default details',
`solutionDate` datetime default now(),
PRIMARY KEY (`solutionId`),
FOREIGN KEY (`solutionAuthor`) REFERENCES student(`studentId`)
);

create table `group` (
`groupId` int(10) unsigned NOT NULL AUTO_INCREMENT,
`groupName` varchar(255) DEFAULT 'nazwa grupy',
PRIMARY KEY (groupId)
);

create table studentGroup (
`studentId` int(10) unsigned NOT NULL,
`groupId` int(10) unsigned NOT NULL,
PRIMARY KEY (`studentId`, `groupId`),
FOREIGN KEY (`studentId`) REFERENCES student(`studentId`),
FOREIGN KEY (`groupId`) REFERENCES `group`(`groupId`)
);

drop table studentGroup;
drop table `group`;
drop table solution;
drop table student;



describe student;
describe solution;
describe `group`;
describe studentGroup;


insert into student (studentName) values ('ąśżźćńłóę');
insert into student (studentName) values ('ędwardącki');
insert into solution (solutionAuthor) values (1);
insert into `group` (groupName) values ('Nazwa');

insert into studentGroup values (1,1);
insert into studentGroup values (2,1);
insert into studentGroup values (3,1);
insert into studentGroup values (4,1);
insert into studentGroup values (5,1);

insert into studentGroup values (1,2);
insert into studentGroup values (2,2);
insert into studentGroup values (3,2);


select * from student;
select * from solution;

update student set studentName = 'Krzysztof', studentSurname = 'Ciechanowski', studentEmail = 'k.ciech@gmail.com', studentLogin = 'k.ciech' where studentId = 2;




show variables like '%colla%';
show variables like '%charac%';



