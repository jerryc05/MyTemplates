#ifndef LOGGER_HPP
#define LOGGER_HPP

#include <iostream>

using std::cout, std::cerr;
using OutStream = std::ostream;

class BaseLogger {
public:
  template<typename T>
  BaseLogger &operator<<(T msg);

  explicit operator OutStream &();

protected:
  OutStream &stream_;
  const char *const type_str_;

  BaseLogger(OutStream &stream, const char *type_str);
};

class [[maybe_unused]] ErrLogger : public BaseLogger {
public:
  ErrLogger();

  ~ErrLogger();
};

class [[maybe_unused]] InfoLogger : public BaseLogger {
public:
  InfoLogger();
};

#ifndef NDEBUG

class [[maybe_unused]] DbgLogger : public BaseLogger {
public:
  DbgLogger();
};

#endif

#endif //LOGGER_HPP
