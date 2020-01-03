-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Departments" (
    "Dept_No" INT   NOT NULL,
    "Dept_Name" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "Dept_No"
     )
);

CREATE TABLE "Dept_Emp" (
    "Emp_No" INT   NOT NULL,
    "Dept_No" INT   NOT NULL,
    "From_Date" date   NOT NULL,
    "To_Date" date   NOT NULL,
    CONSTRAINT "pk_Dept_Emp" PRIMARY KEY (
        "Emp_No"
     )
);

CREATE TABLE "Dept_Manager" (
    "Dept_No" INT   NOT NULL,
    "Emp_No" INT   NOT NULL,
    "From_Date" date   NOT NULL,
    "To_Date" date   NOT NULL
);

CREATE TABLE "Employees" (
    "Emp_No" INT   NOT NULL,
    "Birth_Date" date   NOT NULL,
    "First_Name" VARCHAR(50)   NOT NULL,
    "Last_Name" VARCHAR(50)   NOT NULL,
    "Gender" VARCHAR(1)   NOT NULL,
    "Hire_Date" date   NOT NULL
);

CREATE TABLE "Salaries" (
    "Emp_No" INT   NOT NULL,
    "Salary" INT   NOT NULL,
    "From_Date" date   NOT NULL,
    "To_Date" date   NOT NULL
);

CREATE TABLE "Titles" (
    "Emp_No" INT   NOT NULL,
    "Title" VARCHAR(50)   NOT NULL,
    "From_Date" date   NOT NULL,
    "To_Date" date   NOT NULL
);

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_Dept_No" FOREIGN KEY("Dept_No")
REFERENCES "Departments" ("Dept_No");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_Dept_No" FOREIGN KEY("Dept_No")
REFERENCES "Departments" ("Dept_No");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_Emp_No" FOREIGN KEY("Emp_No")
REFERENCES "Dept_Emp" ("Emp_No");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_Emp_No" FOREIGN KEY("Emp_No")
REFERENCES "Dept_Emp" ("Emp_No");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_Emp_No" FOREIGN KEY("Emp_No")
REFERENCES "Employees" ("Emp_No");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_Emp_No" FOREIGN KEY("Emp_No")
REFERENCES "Employees" ("Emp_No");

