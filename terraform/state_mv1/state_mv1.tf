/*resource "random_string" "tables-prefix" {
  length = 10
}
*/

/*
$terraform state mv random_string.tables-prefix random_string.env-prefix
>Move "random_string.tables-prefix" to "random_string.env-prefix"
>Successfully moved 1 object(s).
*/
resource "random_string" "env-prefix" {
  length = 10
}
