import 'package:ecommerce/api/api_manger.dart';
import 'package:ecommerce/provider/app_config_provider.dart';
import 'package:ecommerce/repository/auth/auth_repo_contract.dart';
import 'package:ecommerce/repository/auth/impl/auth_remote_datasource_impl.dart';
import 'package:ecommerce/repository/auth/impl/auth_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

AuthRepository getAuthRepository(AuthRemoteDateSource remoteDateSource){
  return AuthRepositoryImpl(remoteDateSource);
}
AuthRemoteDateSource getAuthRemoteDataSource(ApiManger apiManger){
  return AuthRemoteDataSourceImpl(apiManger);
}
ApiManger getApiManger(){
  return ApiManger();
}
AuthRepository injectAuthRepository(){
  return getAuthRepository(getAuthRemoteDataSource(getApiManger()));
}
AppConfigProvider getAppConfigProvider(BuildContext context){
  return Provider.of<AppConfigProvider>(context,listen: false);
}