///|
fn main {
  println("http://localhost:4000/")
  let app = @mocket.new()
  app.get("/", _ => Text("Hello, Mocket!"))
  app.serve(port=4000)
}
