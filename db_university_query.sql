use db_university_query;

-- Selezionare tutti gli studenti nati nel 1990 
select * from students s where year(date_of_birth) = 1990;

-- Selezionare tutti i corsi che valgono pi� di 10 crediti
select * from courses c where cfu > 10;

-- Selezionare tutti gli studenti che hanno pi� di 30 anni
select * from students s where timestampdiff(year,date_of_birth, curdate()) >30 ;

-- Selezionare tutti i corsi di laurea magistrale
select * from `degrees` d where `level` = 'magistrale';

-- Da quanti dipartimenti � composta l�universit�?
select count(id) from departments d;

-- Quanti sono gli insegnanti che non hanno un numero di telefono?
select count(id) from teachers t where phone is NULL;

-- Contare quanti iscritti ci sono stati ogni anno
select count(id), year(enrolment_date) from students s 
group by year(enrolment_date) order by year(enrolment_date) desc;

-- Calcolare la media dei voti di ogni appello d�esame
select exam_id , avg(vote) from exam_student es group by exam_id;

-- Contare quanti corsi di laurea ci sono per ogni dipartimento
select department_id, count(id) from `degrees` d group by department_id;

-- Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
select * from students s 
where degree_id = 53; 

-- Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
select * from `degrees` d where department_id = 7;

-- Selezionare tutti i corsi in cui insegna Fulvio Amato
select * from course_teacher ct where teacher_id = 44

-- Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
select s.name, s.surname, d.name as Corso, d2.name as Dipartimento 
from students s inner join `degrees` d ON s.degree_id = d.id 
inner join departments d2 on d.department_id = d2.id;

-- BONUS: Selezionare per ogni studente quanti tentativi d�esame ha sostenuto per superare ciascuno dei suoi esami
select s.surname , s.name , c.id , c.name , count(es.vote) as num_tentativi
from students s 
join exam_student es on s.id = es.student_id
join exams e on es.exam_id = e.id
join courses c on e.course_id = c.id
group by s.id, c.id
having max(es.vote) >= 18 
order by s.surname, s.name;





