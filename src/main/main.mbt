///|
fn main {
  println("http://localhost:4000/")
  let app = @mocket.new()
  app.get("/", _ => Text("Hello, Mocket!"))
  app.use_middleware(logger_middleware)
  app.serve(port=4000)
}

///|
pub async fn logger_middleware(
  event : @mocket.MocketEvent,
  next : async () -> @mocket.HttpBody noraise,
) -> @mocket.HttpBody noraise {
  let start_time = @env.now()
  let res = next()
  let duration = @env.now() - start_time
  println("\{event.req.http_method} \{event.req.url} - \{duration}ms")
  res
}
