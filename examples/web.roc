app [Model, init!, respond!] { web: platform "https://github.com/roc-lang/basic-webserver/releases/download/0.12.0/Q4h_In-sz1BqAvlpmCsBHhEJnn_YvfRRMiNACB_fBbk.tar.br" }

import web.Stdout
import web.Http exposing [Request, Response]
import web.Utc
import web.Url

# Model is produced by `init`.
Model : {}

# With `init` you can set up a database connection once at server startup,
# generate css by running `tailwindcss`,...
# In this case we don't have anything to initialize, so it is just `Ok({})`.

print_url : Str -> Result Response *
print_url = |name|
    Ok(
        {
            status: 200,
            headers: [],
            body: Str.to_utf8("<b>${name}</b></br>"),
        },
    )

init! : {} => Result Model []
init! = |_| Ok({})

respond! : Request, Model => Result Response [ServerErr Str]_
respond! = |request, _|
    # Log request datetime, method and url
    datetime = Utc.to_iso_8601(Utc.now!({}))

    Stdout.line!("${datetime} ${Inspect.to_str(request.method)} ${request.uri}")?

    url = Url.from_str request.uri
    path = Url.path(url)

    print_url(path)
