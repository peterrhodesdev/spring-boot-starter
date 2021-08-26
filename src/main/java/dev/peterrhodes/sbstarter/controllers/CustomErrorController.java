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

        String errorMessage;
        if (errorStatusCode != null) {
            switch (errorStatusCode) {
                case NOT_FOUND:
                    errorMessage = "Resource not found";
                    break;
                default:
                    errorMessage = defaultHttpStatusErrorMessage(errorStatusCode);
            }
        } else {
            errorMessage = "Error";
        }

        return "<h1>" + errorMessage + "</h1><a href=\"/\">Home</a>";
    }

    private String defaultHttpStatusErrorMessage(HttpStatus httpStatus) {
        return String.valueOf(httpStatus.value()) + ": " + httpStatus.getReasonPhrase();
    }
}
