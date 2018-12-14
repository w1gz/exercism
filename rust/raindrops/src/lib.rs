pub fn raindrops(n: usize) -> String {
    let mut res = "".to_owned();

    if n % 3 == 0 {
        res = res + "Pling";
    }

    if n % 5 == 0 {
        res = res + "Plang";
    }

    if n % 7 == 0 {
        res = res + "Plong";
    }

    if res == "" {
        res = n.to_string();
    }

    return res;
}