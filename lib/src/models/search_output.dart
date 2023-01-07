class search {
  String? _model;
  String? _prompt;
  double? _temperature;
  int? _maxTokens;
  int? _topP;
  int? _frequencyPenalty;
  double? _presencePenalty;
  List<String>? _stop;

  search(
      {String? model,
      String? prompt,
      double? temperature,
      int? maxTokens,
      int? topP,
      int? frequencyPenalty,
      double? presencePenalty,
      List<String>? stop}) {
    if (model != null) {
      this._model = model;
    }
    if (prompt != null) {
      this._prompt = prompt;
    }
    if (temperature != null) {
      this._temperature = temperature;
    }
    if (maxTokens != null) {
      this._maxTokens = maxTokens;
    }
    if (topP != null) {
      this._topP = topP;
    }
    if (frequencyPenalty != null) {
      this._frequencyPenalty = frequencyPenalty;
    }
    if (presencePenalty != null) {
      this._presencePenalty = presencePenalty;
    }
    if (stop != null) {
      this._stop = stop;
    }
  }

  String? get model => _model;
  set model(String? model) => _model = model;
  String? get prompt => _prompt;
  set prompt(String? prompt) => _prompt = prompt;
  double? get temperature => _temperature;
  set temperature(double? temperature) => _temperature = temperature;
  int? get maxTokens => _maxTokens;
  set maxTokens(int? maxTokens) => _maxTokens = maxTokens;
  int? get topP => _topP;
  set topP(int? topP) => _topP = topP;
  int? get frequencyPenalty => _frequencyPenalty;
  set frequencyPenalty(int? frequencyPenalty) =>
      _frequencyPenalty = frequencyPenalty;
  double? get presencePenalty => _presencePenalty;
  set presencePenalty(double? presencePenalty) =>
      _presencePenalty = presencePenalty;
  List<String>? get stop => _stop;
  set stop(List<String>? stop) => _stop = stop;

  search.fromJson(Map<String, dynamic> json) {
    _model = json['model'];
    _prompt = json['prompt'];
    _temperature = json['temperature'];
    _maxTokens = json['max_tokens'];
    _topP = json['top_p'];
    _frequencyPenalty = json['frequency_penalty'];
    _presencePenalty = json['presence_penalty'];
    _stop = json['stop'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['model'] = this._model;
    data['prompt'] = this._prompt;
    data['temperature'] = this._temperature;
    data['max_tokens'] = this._maxTokens;
    data['top_p'] = this._topP;
    data['frequency_penalty'] = this._frequencyPenalty;
    data['presence_penalty'] = this._presencePenalty;
    data['stop'] = this._stop;
    return data;
  }
}
