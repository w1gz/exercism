pub fn reverse(s: &str) -> String {
    let reversed: String = s.chars().rev().collect::<String>();
    return reversed;
}