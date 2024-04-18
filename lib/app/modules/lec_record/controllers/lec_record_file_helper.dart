import 'dart:developer';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class AudioRecorderFileHelper{
  final String _recordsDirectoryName = "audio_records";
  String? _appDirPath;

  Future<String> get _getAppDirPath async{
    _appDirPath ??= (await getApplicationDocumentsDirectory()).path;
    return _appDirPath!;
  }

  Future<Directory> get getRecordsDirectory async{
    Directory recordDir = Directory(path.join((await _getAppDirPath), _recordsDirectoryName));

    if (!(await recordDir.exists())){
      await recordDir.create();
    }

    return recordDir;
  }

  Future<void> deleteRecord(String filePath) async{
    final File file = File(filePath);

    try{
      await file.delete();
      log('file deleted');
    }catch(e){
      throw('file does not exist');
    }
  }

}
