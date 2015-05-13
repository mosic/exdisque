ExDisque
========

[Elixir](http://elixir-lang.org/) client for [Disque](https://github.com/antirez/disque), an in-memory, distributed job queue.

### Installation

Add this to your project's `mix.exs` file:

```elixir
{:exdisque, ">= 0.0.1"}
```

### Usage

#### Connect to the Disque Server

``` elixir
{:ok, client} = ExDisque.start_link
```

#### Add a job to a queue and fetch it back

``` elixir
ExDisque.query client, ["ADDJOB", "queue_name", "job_body", "0"]
#=> "DIa88749862374413ece8b8b8156a15466474edecb05a0SQ"
ExDisque.query client, ["GETJOB", "FROM", "queue_name"]
#=> [["queue", "DIa88749862374413ece8b8b8156a15466474edecb05a0SQ", "job_body"]]
```

See more Disque command examples on the [Disque repo](https://github.com/antirez/disque#api).

### Dependencies

Only dependency of ExDisque is [eredis](https://github.com/wooga/eredis), Redis client written in Erlang.

### Contributing

Issues and pull requests welcome.

### License

ExDisque is licensed under the MIT License.
