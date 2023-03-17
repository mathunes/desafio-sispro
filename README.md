# SISPRO CHALLENGE

This project aims to calculate the CR of students in a university. The program reads a CSV file containing the grades of students and, according to the university's criteria, calculates the CR of all students and by courses. At the end of the process, the program displays the CR of all students and the average CR of each course.

## Rules

- The student's grade ranges from zero to 100;
- A grade is associated with a course code and a discipline;
- The CR is the weighted average of the student's grade in that class with the credit course. The calculation is:

```
  CR = Grade(i) * CreditHours(i) / TotalCreditHours
```

  Where i is the i-th class of a student.

## Usage

1. Clone the repository: `git clone https://github.com/mathunes/sispro-challenge.git`
2. Go to the project directory: `cd sispro-challenge`
3. Install any necessary dependencies or libraries with `bundle install`
4. Run the program: `ruby main.rb <csv_path>`
5. View the output displayed on the screen, which will show the CR of all students and the average CR of each course.

## Contributing

If you wish to contribute to this project, please follow the guidelines below:

1. Fork the repository
2. Create a new branch: `git checkout -b <my-new-branch>`
3. Make changes and add them: `git add .`
4. Commit your changes: `git commit -m "Add some feature"`
5. Push to the branch: `git push origin <my-new-branch>`
6. Submit a pull request to the original repository

## License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).
