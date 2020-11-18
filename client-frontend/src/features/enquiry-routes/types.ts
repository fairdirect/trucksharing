export interface IRoute {
  id: string
  route_date_start: string
  route_city_start: string
  route_city_end: string
  route_stops: {
    url: string
    label: string
  }
  route_space_available: string
  route_weight_available: string
  route_unloading_device: string
  route_service_provider: string
  route_status: string
  route_price: string
}
