function validazione(event) {
    let valid = true;
    let password = null;
    let confirmPassword = null;
    const form = event.target;
    for (let i = 0; i < form.elements.length; i++) {
        const field = form.elements[i];
        if (field.type === 'submit' || field.type === 'hidden' || field.type === 'button') continue;
        if (field.name === 'password') password = field.value;
        if (field.name === 'confirm_password') confirmPassword = field.value;
        if (field.value.trim().length <= 1) {
            if (field.name === 'accept_marketing') continue;
            valid = false;
            var missingField = field;
            break;
        }
    }
    if (!valid) {
        let label = missingField && missingField.name ? missingField.name : '';
        switch(label) {
            case 'email': label = 'Email'; break;
            case 'password': label = 'Password'; break;
            case 'confirm_password': label = 'Conferma password'; break;
            case 'first_name': label = 'Nome'; break;
            case 'last_name': label = 'Cognome'; break;
            case 'birthday': label = 'Data di nascita'; break;
            case 'city': label = 'Città'; break;
            case 'province': label = 'Provincia'; break;
            case 'phone': label = 'Telefono'; break;
            default: label = label.charAt(0).toUpperCase() + label.slice(1);
        }
        alert("Compilare il campo: " + label);
        event.preventDefault();
        return;
    }
    if (password !== null && confirmPassword !== null && password !== confirmPassword) {
        alert("Le password non coincidono.");
        event.preventDefault();
        return;
    }
}

const forms = document.querySelectorAll('form');
if (forms && forms.length > 0) {
    forms.forEach(function(form) {
        if (form) {
            form.addEventListener('submit', validazione);
        }
    });
}