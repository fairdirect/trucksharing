class AbstractRouter
  def initialize(router)
    @router = router
  end

  def draw
    raise NotImplementedError
  end
end
