const panelBody = document.querySelector('#panel-body');
for (const elemento of data.categorie) {
    const panelItem = createItem(elemento);
    panelBody.appendChild(panelItem);
}