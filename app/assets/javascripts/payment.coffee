simplifyResponseHandler = (data) ->
        paymentForm = $('#simplify-payment-form')
        $('.error').remove()
        if data.error
            if data.error.code == 'validation'
                errorList = ''
                for f in data.error.fieldErrors
                    errorList += "Field #{f.field} is invalid – #{f.message}"
                paymentForm.after errorList 
            $('#process-payment-btn').removeAttr 'disabled'
        else
            token = data['id']
            paymentForm.append ""
            paymentForm.get(0).submit()
        return

ready = ->
        $('#simplify-payment-form').on 'submit', ->
            $('#process-payment-btn').attr disabled: 'disabled'
            SimplifyCommerce.generateToken {
                key: 'sbpb_Y2NiZjE4YTQtMDQ2My00YTQ0LWFmYjEtZWI4NzY2Zjc1YTFi',
                card: {
                    number: $('#cc-number').val(),
                    cvc: $('#cc-cvc').val(),
                    expMonth: $('#cc-exp-month').val(),
                    expYear: $('#cc-exp-year').val().slice(-2)
                }
            }, simplifyResponseHandler
            false

$(document).ready(ready)