import '/models/article.dart';
import 'package:flutter/cupertino.dart';

class ChangerViewModel extends ChangeNotifier{

  final List<Article> _article = defaultArticles;
  bool _afficher = false;

  List<Article> get article => _article;
  bool get afficher => _afficher;

  Article? recupArticleById(int id){
    for (var o in _article) {
      if(o.id == id){
        return o;
      }
    }
    return null;
  }

  void addArticle(Article article){
    _article.add(article);
    notifyListeners();
  }

  void deleteArticle(Article article){
    _article.remove(article);
    notifyListeners();
  }

  void afficherLu(){
    _afficher = !_afficher;
    notifyListeners();
  }

  void changerLu(Article article){
    article.read = !article.read;
    notifyListeners();
  }
}