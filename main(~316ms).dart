import 'dart:convert';

List set_default() {
  List sudoku = [
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0]
  ];
  return sudoku;
}

List set_example_1() {
  List example_1 = [
    [0, 0, 5, 0, 0, 1, 0, 3, 0],
    [4, 2, 9, 6, 3, 7, 1, 8, 0],
    [3, 0, 1, 2, 0, 8, 0, 4, 6],
    [1, 8, 0, 3, 2, 5, 0, 0, 0],
    [0, 0, 0, 8, 0, 9, 2, 0, 0],
    [9, 5, 0, 0, 7, 0, 8, 0, 3],
    [5, 0, 8, 7, 0, 3, 4, 2, 0],
    [2, 0, 0, 0, 9, 0, 0, 0, 8],
    [0, 4, 0, 0, 8, 0, 5, 9, 0]
  ];
  return example_1;
}

List set_example_2() {
  List example_2 = [
    [0, 0, 0, 5, 0, 1, 9, 7, 0],
    [0, 0, 0, 8, 2, 0, 5, 4, 0],
    [0, 0, 7, 3, 0, 4, 0, 0, 0],
    [8, 3, 0, 0, 0, 0, 0, 6, 9],
    [6, 0, 0, 2, 0, 0, 0, 0, 0],
    [7, 1, 0, 9, 3, 6, 4, 0, 0],
    [3, 6, 4, 0, 8, 2, 1, 0, 0],
    [9, 7, 0, 0, 5, 3, 8, 2, 4],
    [0, 5, 8, 0, 4, 0, 6, 3, 0]
  ];
  return example_2;
}

List set_example_3() {
  List example_3 = [
    [0, 5, 4, 6, 0, 0, 0, 7, 8],
    [0, 0, 2, 8, 0, 1, 5, 6, 0],
    [1, 6, 0, 0, 0, 0, 0, 0, 0],
    [0, 8, 7, 0, 0, 0, 0, 1, 9],
    [0, 0, 0, 0, 4, 8, 0, 0, 7],
    [5, 0, 0, 7, 0, 0, 0, 0, 0],
    [0, 0, 0, 5, 0, 2, 0, 0, 0],
    [0, 0, 0, 1, 0, 0, 2, 0, 0],
    [6, 2, 0, 0, 0, 9, 0, 8, 5]
  ];
  return example_3;
}

List set_example_4() {
  List example_4 = [
    [0, 3, 0, 0, 5, 0, 6, 1, 0],
    [0, 0, 5, 0, 9, 0, 0, 0, 0],
    [1, 6, 0, 8, 0, 0, 0, 7, 5],
    [0, 9, 0, 0, 0, 0, 2, 0, 3],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [5, 0, 6, 0, 0, 0, 0, 9, 0],
    [7, 4, 0, 0, 0, 3, 0, 8, 6],
    [0, 0, 0, 0, 6, 0, 7, 0, 0],
    [0, 5, 8, 0, 1, 0, 0, 2, 0]
  ];
  return example_4;
}

List find_least_possible_location(List possible_number) {
  int min_len = 9;
  int min_location_i = 0, min_location_j = 0;
  for (int i = 0; i < 9; i++) {
    for (int j = 0; j < 9; j++) {
      if (possible_number[i][j].length > 0 &&
          possible_number[i][j].length < min_len) {
        min_len = possible_number[i][j].length;
        min_location_i = i;
        min_location_j = j;
        if (min_len == 2) {
          return [min_location_i, min_location_j];
        }
      }
    }
  }
  return [min_location_i, min_location_j];
}

int get_number_of_blank(sudoku_by_row) {
  int number_of_blank = 0;
  for (int i = 0; i < 9; i++) {
    for (int j = 0; j < 9; j++) {
      if (sudoku_by_row[i][j] == 0) {
        number_of_blank++;
      }
    }
  }
  return number_of_blank;
}

bool check_row_column_block_smaller_than_45(List sudoku_by_row) {
  List sudoku_by_column = set_sudoku_by_column(sudoku_by_row);
  List sudoku_by_block = set_sudoku_by_block(sudoku_by_row);
  int row_sum = 0;
  int column_sum = 0;
  int block_sum = 0;
  for (int i = 0; i < 9; i++) {
    for (int j = 0; j < 9; j++) {
      int tempr = sudoku_by_row[i][j];
      int tempc = sudoku_by_column[i][j];
      int tempb = sudoku_by_block[i][j];
      row_sum += tempr;
      column_sum += tempc;
      block_sum += tempb;
    }
    if (row_sum <= 45 && column_sum <= 45 && block_sum <= 45) {
      continue;
    } else {
      return false;
    }
  }
  return true;
}

bool is_correct(List sudoku_by_row) {
  List sudoku_by_column = set_sudoku_by_column(sudoku_by_row);
  List sudoku_by_block = set_sudoku_by_block(sudoku_by_row);
  for (int i = 0; i < 9; i++) {
    int row_sum = 0;
    int column_sum = 0;
    int block_sum = 0;
    for (int j = 0; j < 9; j++) {
      int tempr = sudoku_by_row[i][j];
      int tempc = sudoku_by_column[i][j];
      int tempb = sudoku_by_block[i][j];
      row_sum += tempr;
      column_sum += tempc;
      block_sum += tempb;
    }
    if (row_sum == 45 && column_sum == 45 && block_sum == 45) {
      continue;
    } else {
      return false;
    }
  }
  return true;
}

List set_sudoku_by_column(List sudoku_by_row) {
  List sudoku_by_column = set_default();
  for (int i = 0; i < 9; i++) {
    for (int j = 0; j < 9; j++) {
      sudoku_by_column[j][i] = sudoku_by_row[i][j];
    }
  }
  return sudoku_by_column;
}

List set_sudoku_by_block(List sudoku_by_row) {
  List sudoku_by_block = set_default();
  List temp0, temp1, temp2;
  temp0 = [];
  temp1 = [];
  temp2 = [];
  int x = 0;
  for (int k = 0; k < 9; k++) {
    for (int i = 0; i < 9; i++) {
      if (i % 3 == 0) {
        temp0 = [];
        temp1 = [];
        temp2 = [];
      }
      for (int j = 0; j < 9; j++) {
        if (j < 3) {
          temp0.add(sudoku_by_row[i][j]);
        } else if (j >= 3 && j < 6) {
          temp1.add(sudoku_by_row[i][j]);
        } else if (j >= 6 && j < 9) {
          temp2.add(sudoku_by_row[i][j]);
        }
      }

      if (i % 3 == 0) {
        if (x == 9) {
          break;
        }
        sudoku_by_block[x++] = temp0;
        sudoku_by_block[x++] = temp1;
        sudoku_by_block[x++] = temp2;
      }
    }
  }
  return sudoku_by_block;
}

List set_possible_number(List sudoku_by_row) {
  List possible_number = [
    [
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9]
    ],
    [
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9]
    ],
    [
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9]
    ],
    [
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9]
    ],
    [
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9]
    ],
    [
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9]
    ],
    [
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9]
    ],
    [
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9]
    ],
    [
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9],
      [1, 2, 3, 4, 5, 6, 7, 8, 9]
    ]
  ];
  List sudoku_by_column = set_sudoku_by_column(sudoku_by_row);
  List sudoku_by_block = set_sudoku_by_block(sudoku_by_row);
  for (int i = 0; i < 9; i++) {
    for (int j = 0; j < 9; j++) {
      if (sudoku_by_row[i][j] != 0) {
        List<int> temp = [];
        possible_number[i][j] = temp;
      }
    }
  }
  int n = 0;
  for (int i = 0; i < 9; i++) {
    for (int j = 0; j < 9; j++) {
      if (i < 3) {
        if (j == 3) {
          n = 1;
        } else if (j == 6) {
          n = 2;
        }
      } else if (i >= 3 && i < 6) {
        if (j == 0) {
          n = 3;
        } else if (j == 3) {
          n = 4;
        } else if (j == 6) {
          n = 5;
        }
      } else if (i >= 6 && i < 9) {
        if (j == 0) {
          n = 6;
        } else if (j == 3) {
          n = 7;
        } else if (j == 6) {
          n = 8;
        }
      }
      for (int k = 0; k < possible_number[i][j].length;) {
        if (sudoku_by_row[i].contains(possible_number[i][j][k])) {
          possible_number[i][j].remove(possible_number[i][j][k]);
        } else if (sudoku_by_column[j].contains(possible_number[i][j][k])) {
          possible_number[i][j].remove(possible_number[i][j][k]);
        } else if (sudoku_by_block[n].contains(possible_number[i][j][k])) {
          possible_number[i][j].remove(possible_number[i][j][k]);
        } else {
          k++;
        }
      }
      if (j == 8) {
        n -= 2;
      }
    }
  }
  return possible_number;
}

bool only_one_in_the_row(List possible_number, int number, int row_index) {
  int count = 0;
  for (int i = 0; i < 9; i++) {
    if (possible_number[row_index][i].contains(number)) {
      count++;
    }
  }
  if (count > 1) {
    return false;
  } else {
    return true;
  }
}

List write_the_only_answer_length_1_in_rcb(
    List sudoku_by_row, possible_number) {
  for (int i = 0; i < 9; i++) {
    for (int j = 0; j < 9; j++) {
      if (possible_number[i][j].length == 1 && sudoku_by_row[i][j] == 0) {
        int removed_number = possible_number[i][j][0];
        sudoku_by_row[i][j] = removed_number;
        possible_number = set_possible_number(sudoku_by_row);
      }
    }
  }
  return sudoku_by_row;
}

List write_the_only_answer_appear_once_in_rcb(
    List sudoku_by_row, possible_number) {
  for (int i = 0; i < 9; i++) {
    for (int j = 0; j < 9; j++) {
      for (int k = 0; k < possible_number[i][j].length; k++) {
        int temp = possible_number[i][j][k];
        if (only_one_in_the_row(possible_number, temp, i) &&
            sudoku_by_row[i][j] == 0) {
          sudoku_by_row[i][j] = temp;
          possible_number = set_possible_number(sudoku_by_row);
        }
      }
    }
  }
  return sudoku_by_row;
}

List generate_must_answer(List sudoku_by_row) {
  int number_of_blank = get_number_of_blank(sudoku_by_row);
  int last_run_number_of_blank;
  // List possible_number = set_possible_number(sudoku_by_row);

  while (number_of_blank != 0) {
    last_run_number_of_blank = number_of_blank;
    List possible_number = set_possible_number(sudoku_by_row);
    sudoku_by_row =
        write_the_only_answer_length_1_in_rcb(sudoku_by_row, possible_number);
    sudoku_by_row = write_the_only_answer_appear_once_in_rcb(
        sudoku_by_row, possible_number);

    number_of_blank = get_number_of_blank(sudoku_by_row);
    if (last_run_number_of_blank == number_of_blank) {
      break;
    }
  }
  return sudoku_by_row;
}

List solve_the_sudoku(sudoku_by_row) {
  sudoku_by_row = generate_must_answer(sudoku_by_row);
  if (is_correct(sudoku_by_row)) {
    return sudoku_by_row;
  } else {
    List possible_number = set_possible_number(sudoku_by_row);
    List location = find_least_possible_location(possible_number);
    List possible_number_in_that_location =
        possible_number[location[0]][location[1]];
    for (int n = 0; n < possible_number_in_that_location.length; n++) {
      List sub_sudoku_by_row = jsonDecode(jsonEncode(sudoku_by_row));
      sub_sudoku_by_row[location[0]][location[1]] =
          possible_number_in_that_location[n];
      print('FU!');
      sub_sudoku_by_row = solve_the_sudoku(sub_sudoku_by_row);
      if (is_correct(sub_sudoku_by_row)) {
        return sub_sudoku_by_row;
      }
    }
  }
  return sudoku_by_row;
}

void test(List sudoku_by_row) {
  sudoku_by_row = solve_the_sudoku(sudoku_by_row);
  if (is_correct(sudoku_by_row)) {
    print("Test PASSED");
  } else {
    print("Test FAILED");
  }
  List possible_number = set_possible_number(sudoku_by_row);
  for (int i = 0; i < 9; i++) {
    print(sudoku_by_row[i]);
  }
  for (int i = 0; i < 9; i++) {
    print(possible_number[i]);
  }
}

int main() {
  // test(set_example_1());
  // test(set_example_2());
  // test(set_example_3());
  // test(set_example_4());
  test(set_default());

  return 0;
}
