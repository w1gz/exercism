pub fn is_leap_year(year: i32) -> bool {
    let leap_exception = year % 400 == 0;
    let leap = (year % 4 == 0) && (year % 100 != 0);
    return leap_exception || leap;
}