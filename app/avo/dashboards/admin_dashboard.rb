class Avo::Dashboards::AdminDashboard < Avo::Dashboards::BaseDashboard
  self.id = "admin_dashboard"
  self.name = "Admin dashboard"
  self.description = "Aperçu des données clés"

  def cards
    [
      Avo::Cards::MetricCard.new({
        label: "Total des utilisateurs",
        value: -> { User.count }
      }),
      Avo::Cards::MetricCard.new({
        label: "Total des réservations",
        value: -> { Reservation.count }
      })
    ]
  end
end
