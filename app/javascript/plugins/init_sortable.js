import Sortable from 'sortablejs';

const initSortable = () => {
  const box = document.getElementById('code-box');
  const canvas = document.getElementById('canvas');

  new Sortable(box, {
    group: {
        name: 'shared',
        pull: 'clone',
        put: false // Do not allow items to be put into this list
    },
    animation: 150,
    sort: false // To disable sorting: set sort to false
  });

  new Sortable(canvas, {
    group: 'shared',
    animation: 150
  });
};

export { initSortable };
