class ArticlesController < ApplicationController

	def new #initially, should be empty. Now you assign to the variable @article.
		@article = Article.new
	end

	def edit
		@article = Article.find(params[:id])
	end

	def index
		@articles = Article.all
	end

	def create
		@article = Article.new(params.require(:article).permit(:title, :text))
		# render plain: params[:article].inspect #not just rendering, but in the end we want to store the data.
		if @article.save	#Now we are using @
			redirect_to @article	#Capital A as we are calling the class Article.
		else
			render 'new' #return blank statement to show that nothing is saved
		end
	end

	def destroy
		@article = Article.find(params[:id]).destroy
			redirect_to @article
	end

	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end
	#All these needs to be called for outside. The rest can be private.
	def show
		@article = Article.find(params[:id])
	end
	#If you dont include the 'show' function, the 'show' error will occur.

	private
		def article_params
			params.require(:article).permit(:title, :text)
		end
end

#params is a hash, creates key-value pairs.
#More conventional way
#How to store and see the data?
#Managing data.
#Generate model