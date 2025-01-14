defmodule DummyWeb.Async.TableComponent do
  use Phoenix.Component

  def table(assigns) do
    ~H"""
    <table
      :if={is_list(@users)}
      class="table-fixed border-separate border-spacing-2 border border-slate-500"
    >
      <thead>
        <tr>
          <th class="border border-slate-600">UUID</th>
          <th class="border border-slate-600">Name</th>
          <th class="border border-slate-600">Email</th>
        </tr>
      </thead>
      <tbody id="users">
        <tr :for={user <- @users} id={user.uuid}>
          <td class="border border-slate-600"><%= user.uuid %></td>
          <td class="border border-slate-600"><%= user.name %></td>
          <td class="border border-slate-600"><%= user.email %></td>
        </tr>
      </tbody>
    </table>
    <p :if={not is_list(@users)}><%= @users %></p>
    """
  end

  def connected(assigns) do
    ~H"""
    <h1 class={[
      "text-2xl text-blue-500  px-4 py-2",
      @connected? && "bg-blue-200",
      !@connected? && "bg-red-200"
    ]}>
      Socket is connected? <span><%= @connected? %></span>
    </h1>
    """
  end
end
