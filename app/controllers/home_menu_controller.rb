class HomeMenuController < ApplicationController
  # 展现添加菜单极富文本的页面
  def new
    @parent_id=params['nodeId']
    @home_page=HomePage.new
    render partial:'home_menu/new'
  end

  # 新加菜单
  def create
    menu_pra={}
    home_page_pra={}
    menu_pra[:parent_id]=params['home_page']['parent_id']
    menu_pra[:name]=params['home_page']['name']
    menu_pra[:hospital_id]=current_user.hospital_id
    menu_pra[:department_id]=current_user.department_id
    @home_menu=HomeMenu.new(menu_pra)
    @home_menu.save

    home_page_pra[:home_menu_id]=@home_menu.id
    home_page_pra[:content]=params['home_page']['content']
    home_page_pra[:hospital_id]=current_user.hospital_id
    home_page_pra[:department_id]=current_user.department_id
    @home_page=HomePage.new(home_page_pra)
    @home_page.save
    render json:'success'
  end
  def show
      home_menus=HomeMenu.where(hospital_id:current_user.hospital_id,department_id:current_user.department_id)
      @home_menus= {name:"菜单管理",children:home_menus,open:true}

     render partial: 'home_menu/show'
  end



  private
  # Use callbacks to share common setup or constraints between actions.
  def set_home_page
    @home_menu = HomeMenu.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def home_page_params
    params.permit(:id,:name,:parent_id,:hospital_id,:department_id,:content,:show_in_menu,:link_url,:skip_to_first_child,:show_in_header,:show_in_footer,:depth)
    params.require(:home_pages).permit(:id,:home_menu_id,:name,:content,:hospital_id,:department_id,:position,:link_url)

  end
end