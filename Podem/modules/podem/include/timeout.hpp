//
// Created by dolsen on 5/11/16.
//

#ifndef PODEMATPG_TIMEOUT_HPP
#define PODEMATPG_TIMEOUT_HPP

#include <chrono>

class timeout_exception : public std::exception
{
public:
    const char * what () const throw ()
    {
        return "Timeout";
    }
};

class timeout
{
public:
    explicit timeout(std::chrono::system_clock::duration max_duration) :
            _start_time(std::chrono::system_clock::now()),
            _max_duration(max_duration)
    {

    }

    std::chrono::system_clock::time_point start_time() const
    {
        return _start_time;
    }

    std::chrono::system_clock::duration max_duration() const
    {
        return _max_duration;
    }

    bool is_expired() const
    {
        const auto endTime = std::chrono::system_clock::now();

        return (endTime - start_time()) > max_duration();
    }

    static timeout infinity()
    {
        return timeout(std::chrono::system_clock::duration::max());
    }

private:
    std::chrono::system_clock::time_point _start_time;
    std::chrono::system_clock::duration _max_duration;

};


#endif //PODEMATPG_TIMEOUT_HPP
