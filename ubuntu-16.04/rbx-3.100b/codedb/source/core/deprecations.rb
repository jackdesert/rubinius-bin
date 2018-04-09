module Rubinius
  DEPRECATIONS = {
    # "Description" => "Alternative"
    "Ruby 2.1/2.2 features that are incompatible with Ruby 2.3 are deprecated." =>
      "Use Ruby 2.3 features if they are available.",
    "Rubinius::ConstantScope is deprecated." =>
      "Use Rubinius::LexicalScope instead.",
    "Rubinius::Executable#primitive is deprecated." =>
      "Use Rubinius::Executable#tags instead.",
    "Rubinius::RUNTIME_PATH is deprecated." =>
      "Use Rubinius::CODEDB_PATH instead.",
    "Rubinius::CORE_PATH is deprecated." =>
      "Use Rubinius::CODEDB_PATH/source/core instead, or retrieve the path from the CompiledCode#file attribute",
  }
end
