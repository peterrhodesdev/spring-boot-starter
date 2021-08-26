package dev.peterrhodes.sbstarter.controllers;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;

@RestController
public class CustomErrorController implements ErrorController  {

    @RequestMapping("/error")
    public String handleError(HttpServletRequest request) {
        Object attribute = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
        HttpStatus errorStatusCode = attribute != null ? HttpStatus.resolve(Integer.valueOf(attribute.toString())) : null;

        if (errorStatusCode != null) {
            switch (errorStatusCode) {
                case NOT_FOUND:
                    return "Resource not found";
                default:
                    return defaultHttpStatusErrorMessage(errorStatusCode);
            }
        }

        return "Error";
    }

    private String defaultHttpStatusErrorMessage(HttpStatus httpStatus) {
        return String.valueOf(httpStatus.value()) + ": " + httpStatus.getReasonPhrase();
    }
}
