/* ===================================
   1. BIẾN DÙNG CHUNG
=================================== */

let categoryModal;
let productModal;
let confirmDeleteModal;
let notificationModal;

let deleteType = '';
let deleteId = null;

let categoryCurrentPage = 1;
let categoryItemsPerPage = 5;


/* ===================================
   2. KHỞI TẠO TRANG
=================================== */

window.onload = function () {
  categoryModal = new bootstrap.Modal(
    document.getElementById('categoryModal')
  );

  productModal = new bootstrap.Modal(
    document.getElementById('productModal')
  );

  confirmDeleteModal = new bootstrap.Modal(
    document.getElementById('confirmDeleteModal')
  );

  notificationModal = new bootstrap.Modal(
    document.getElementById('notificationModal')
  );

  showCurrentUser();
  populateCatDropdown();
  renderCategories();
  renderProducts();
};


/* ===================================
   3. HIỂN THỊ NGƯỜI DÙNG
=================================== */

function showCurrentUser() {
  let currentUser = JSON.parse(
    localStorage.getItem('currentUser')
  );

  if (currentUser === null) {
    return;
  }

  let fullName =
    currentUser.first_name + ' ' + currentUser.last_name;

  document.getElementById(
    'headerUserName'
  ).innerText = fullName;

  document.getElementById(
    'headerUserEmail'
  ).innerText = currentUser.email;

  if (
    currentUser.avatar !== undefined &&
    currentUser.avatar !== ''
  ) {
    document.getElementById(
      'headerUserAvatar'
    ).src = currentUser.avatar;
  }
}


function logout() {
  let confirmLogout = confirm(
    'Bạn có chắc muốn đăng xuất không?'
  );

  if (!confirmLogout) {
    return;
  }

  localStorage.removeItem('currentUser');
  window.location.href = 'login.html';
}


/* ===================================
   4. CHUYỂN TAB
=================================== */

function switchTab(tabName) {
  document.getElementById('nav-thongke').classList.remove('active');
  document.getElementById('nav-danhmuc').classList.remove('active');
  document.getElementById('nav-sanpham').classList.remove('active');

  document.getElementById('nav-' + tabName).classList.add('active');

  document.getElementById('tab-thongke').classList.add('d-none');
  document.getElementById('tab-danhmuc').classList.add('d-none');
  document.getElementById('tab-sanpham').classList.add('d-none');

  document.getElementById('tab-' + tabName).classList.remove('d-none');
}


/* ===================================
   5. LỌC VÀ SẮP XẾP DANH MỤC
=================================== */

function getFilteredCategories() {
  let statusFilter = document.getElementById('catStatusFilter').value;
  let searchText = document.getElementById('catSearchInput').value.trim().toLowerCase();
  let sortValue = document.getElementById('catSort').value;

  let result = [];

  for (let i = 0; i < categories.length; i++) {
    let category = categories[i];

    let matchStatus =
      statusFilter === 'all' ||
      category.status === statusFilter;

    let matchName =
      category.category_name
        .toLowerCase()
        .includes(searchText);

    if (matchStatus && matchName) {
      result.push(category);
    }
  }

  if (sortValue === 'name-asc') {
    result.sort(function (a, b) {
      return a.category_name.localeCompare(b.category_name, 'vi');
    });
  }

  if (sortValue === 'name-desc') {
    result.sort(function (a, b) {
      return b.category_name.localeCompare(a.category_name, 'vi');
    });
  }

  if (sortValue === 'created-newest') {
    result.sort(function (a, b) {
      return new Date(b.created_at) - new Date(a.created_at);
    });
  }

  if (sortValue === 'created-oldest') {
    result.sort(function (a, b) {
      return new Date(a.created_at) - new Date(b.created_at);
    });
  }

  return result;
}


function changeCategoryFilter() {
  categoryCurrentPage = 1;
  renderCategories();
}


/* ===================================
   6. HIỂN THỊ DANH MỤC
=================================== */

function renderCategories() {
  let tbody = document.getElementById('catTableBody');
  let filteredCategories = getFilteredCategories();
  let totalItems = filteredCategories.length;

  let totalPages = Math.ceil(totalItems / categoryItemsPerPage);
  if (totalPages === 0) totalPages = 1;

  if (categoryCurrentPage > totalPages) {
    categoryCurrentPage = totalPages;
  }

  let startIndex = (categoryCurrentPage - 1) * categoryItemsPerPage;
  let endIndex = startIndex + categoryItemsPerPage;
  let pageCategories = filteredCategories.slice(startIndex, endIndex);

  let htmlContent = '';

  for (let i = 0; i < pageCategories.length; i++) {
    let category = pageCategories[i];
    let badgeHTML = '';

    if (category.status === 'ACTIVE') {
      badgeHTML = `<span class="status-badge status-active">Đang hoạt động</span>`;
    } else {
      badgeHTML = `<span class="status-badge status-inactive">Ngừng hoạt động</span>`;
    }

    htmlContent += `
      <tr>
        <td><strong>${category.category_code}</strong></td>
        <td>${category.category_name}</td>
        <td>${badgeHTML}</td>
        <td class="text-end">
          <button type="button" class="btn-action-icon btn-delete" onclick="askDelete('category', ${category.id})">
            <i class="bi bi-trash"></i>
          </button>
          <button type="button" class="btn-action-icon btn-edit" onclick="openCategoryModal(${category.id})">
            <i class="bi bi-pencil"></i>
          </button>
        </td>
      </tr>
    `;
  }

  if (pageCategories.length === 0) {
    htmlContent = `
      <tr>
        <td colspan="4" class="text-center text-muted">Không tìm thấy danh mục</td>
      </tr>
    `;
  }

  tbody.innerHTML = htmlContent;
  renderCategoryPagination(totalPages, totalItems, startIndex, pageCategories.length);
}


/* ===================================
   7. PHÂN TRANG DANH MỤC
=================================== */

function renderCategoryPagination(totalPages, totalItems, startIndex, currentItems) {
  let pagination = document.getElementById('categoryPagination');
  let pageInfo = document.getElementById('categoryPageInfo');

  let paginationHTML = '';
  let previousDisabled = categoryCurrentPage === 1 ? 'disabled' : '';

  paginationHTML += `
    <li class="page-item ${previousDisabled}">
      <button type="button" class="page-link" onclick="changeCategoryPage(${categoryCurrentPage - 1})">Trước</button>
    </li>
  `;

  for (let i = 1; i <= totalPages; i++) {
    let activeClass = i === categoryCurrentPage ? 'active' : '';
    paginationHTML += `
      <li class="page-item ${activeClass}">
        <button type="button" class="page-link" onclick="changeCategoryPage(${i})">${i}</button>
      </li>
    `;
  }

  let nextDisabled = categoryCurrentPage === totalPages ? 'disabled' : '';
  paginationHTML += `
    <li class="page-item ${nextDisabled}">
      <button type="button" class="page-link" onclick="changeCategoryPage(${categoryCurrentPage + 1})">Sau</button>
    </li>
  `;

  pagination.innerHTML = paginationHTML;

  if (totalItems === 0) {
    pageInfo.innerText = 'Không có dữ liệu';
  } else {
    let firstItem = startIndex + 1;
    let lastItem = startIndex + currentItems;
    pageInfo.innerText = `Hiển thị ${firstItem} - ${lastItem} trong tổng số ${totalItems} danh mục`;
  }
}


function changeCategoryPage(page) {
  let filteredCategories = getFilteredCategories();
  let totalPages = Math.ceil(filteredCategories.length / categoryItemsPerPage);
  if (totalPages === 0) totalPages = 1;

  if (page < 1 || page > totalPages) return;

  categoryCurrentPage = page;
  renderCategories();
}


/* ===================================
   8. TÌM DANH MỤC THEO ID
=================================== */

function findCategoryIndexById(categoryId) {
  for (let i = 0; i < categories.length; i++) {
    if (categories[i].id === categoryId) {
      return i;
    }
  }
  return -1;
}


/* ===================================
   9. MỞ MODAL DANH MỤC
=================================== */

function openCategoryModal(categoryId) {
  clearCatErrors();

  let categoryIndex = -1;
  if (categoryId !== -1) {
    categoryIndex = findCategoryIndexById(categoryId);
  }

  if (categoryIndex === -1) {
    document.getElementById('catModalTitle').innerText = 'Thêm mới danh mục';
    document.getElementById('btnSaveCat').innerText = 'Thêm';
    document.getElementById('catIndex').value = '-1';
    document.getElementById('catId').value = '';
    document.getElementById('catName').value = '';
    document.getElementById('catActive').checked = true;
  } else {
    let category = categories[categoryIndex];
    document.getElementById('catModalTitle').innerText = 'Cập nhật danh mục';
    document.getElementById('btnSaveCat').innerText = 'Lưu';
    document.getElementById('catIndex').value = categoryIndex;
    document.getElementById('catId').value = category.category_code;
    document.getElementById('catName').value = category.category_name;

    if (category.status === 'ACTIVE') {
      document.getElementById('catActive').checked = true;
    } else {
      document.getElementById('catInactive').checked = true;
    }
  }

  categoryModal.show();
}


/* ===================================
   10 & 11. KIỂM TRA TRÙNG LẮP DANH MỤC
=================================== */

function isDuplicateCategoryCode(categoryCode, editingIndex) {
  for (let i = 0; i < categories.length; i++) {
    if (i !== editingIndex && categories[i].category_code.toLowerCase() === categoryCode.toLowerCase()) {
      return true;
    }
  }
  return false;
}

function isDuplicateCategoryName(categoryName, editingIndex) {
  for (let i = 0; i < categories.length; i++) {
    if (i !== editingIndex && categories[i].category_name.toLowerCase() === categoryName.toLowerCase()) {
      return true;
    }
  }
  return false;
}


/* ===================================
   12. LƯU DANH MỤC
=================================== */

function saveCategory() {
  clearCatErrors();

  let categoryCode = document.getElementById('catId').value.trim();
  let categoryName = document.getElementById('catName').value.trim();
  let editingIndex = Number(document.getElementById('catIndex').value);

  let status = document.getElementById('catInactive').checked ? 'INACTIVE' : 'ACTIVE';
  let hasError = false;

  if (categoryCode === '') {
    document.getElementById('catIdErr').innerText = 'Mã danh mục không được để trống';
    hasError = true;
  } else if (isDuplicateCategoryCode(categoryCode, editingIndex)) {
    document.getElementById('catIdErr').innerText = 'Mã danh mục đã tồn tại';
    hasError = true;
  }

  if (categoryName === '') {
    document.getElementById('catNameErr').innerText = 'Tên danh mục không được để trống';
    hasError = true;
  } else if (isDuplicateCategoryName(categoryName, editingIndex)) {
    document.getElementById('catNameErr').innerText = 'Tên danh mục đã tồn tại';
    hasError = true;
  }

  if (hasError) return;

  if (editingIndex === -1) {
    let newCategory = {
      id: Date.now(),
      category_code: categoryCode,
      category_name: categoryName,
      image: '',
      status: status,
      created_at: new Date().toISOString()
    };
    categories.push(newCategory);
    categoryCurrentPage = 1;
    showNotification('Thêm mới danh mục thành công!');
  } else {
    categories[editingIndex].category_code = categoryCode;
    categories[editingIndex].category_name = categoryName;
    categories[editingIndex].status = status;
    showNotification('Cập nhật danh mục thành công!');
  }

  saveCategoriesToLocalStorage();
  categoryModal.hide();

  renderCategories();
  populateCatDropdown();
  renderProducts();
}


/* ===================================
   13. XÓA LỖI DANH MỤC
=================================== */

function clearCatErrors() {
  document.getElementById('catIdErr').innerText = '';
  document.getElementById('catNameErr').innerText = '';
}


/* ===================================
   14. ĐƯA CATEGORY VÀO SELECT
=================================== */

function populateCatDropdown() {
  let filterSelect = document.getElementById('prodCatFilter');
  let modalSelect = document.getElementById('prodCatSelect');

  let filterHTML = '<option value="all">Lọc theo danh mục</option>';
  let modalHTML = '<option value="">Chọn danh mục</option>';

  for (let i = 0; i < categories.length; i++) {
    filterHTML += `<option value="${categories[i].id}">${categories[i].category_name}</option>`;
    modalHTML += `<option value="${categories[i].id}">${categories[i].category_name}</option>`;
  }

  filterSelect.innerHTML = filterHTML;
  modalSelect.innerHTML = modalHTML;
}


/* ===================================
   15. HIỂN THỊ SẢN PHẨM
=================================== */

function renderProducts() {
  let tbody = document.getElementById('prodTableBody');
  let categoryFilter = document.getElementById('prodCatFilter').value;
  let statusFilter = document.getElementById('prodStatusFilter').value;
  let searchText = document.getElementById('prodSearchInput').value.trim().toLowerCase();

  let htmlContent = '';

  for (let i = 0; i < products.length; i++) {
    let product = products[i];

    let matchCategory = categoryFilter === 'all' || product.category_id === Number(categoryFilter);
    let matchStatus = statusFilter === 'all' || product.status === statusFilter;
    let matchName = product.product_name.toLowerCase().includes(searchText);

    if (matchCategory && matchStatus && matchName) {
      let badgeHTML = product.status === 'ACTIVE'
        ? `<span class="status-badge status-active">Đang hoạt động</span>`
        : `<span class="status-badge status-inactive">Ngừng hoạt động</span>`;

      let formattedPrice = product.price.toLocaleString('vi-VN');

      htmlContent += `
        <tr>
          <td><strong>${product.product_code}</strong></td>
          <td>${product.product_name}</td>
          <td>${formattedPrice} đ</td>
          <td>${product.stock}</td>
          <td>${product.discount}%</td>
          <td>${badgeHTML}</td>
          <td class="text-end">
            <button type="button" class="btn-action-icon btn-delete" onclick="askDelete('product', ${product.id})">
              <i class="bi bi-trash"></i>
            </button>
            <button type="button" class="btn-action-icon btn-edit" onclick="openProductModal(${product.id})">
              <i class="bi bi-pencil"></i>
            </button>
          </td>
        </tr>
      `;
    }
  }

  if (htmlContent === '') {
    htmlContent = `
      <tr>
        <td colspan="7" class="text-center text-muted">Không tìm thấy sản phẩm</td>
      </tr>
    `;
  }

  tbody.innerHTML = htmlContent;
}


/* ===================================
   15.B MỞ & LƯU SẢN PHẨM (Bổ sung phần thiếu)
=================================== */

function openProductModal(productId) {
  document.getElementById('prodCodeErr').innerText = '';
  document.getElementById('prodNameErr').innerText = '';
  document.getElementById('prodCatErr').innerText = '';

  let prodIndex = -1;
  for (let i = 0; i < products.length; i++) {
    if (products[i].id === productId) {
      prodIndex = i;
      break;
    }
  }

  if (prodIndex === -1) {
    document.getElementById('prodModalTitle').innerText = 'Thêm mới sản phẩm';
    document.getElementById('btnSaveProd').innerText = 'Thêm';
    document.getElementById('prodIdHidden').value = '-1';
    document.getElementById('prodCode').value = '';
    document.getElementById('prodName').value = '';
    document.getElementById('prodCatSelect').value = '';
    document.getElementById('prodStock').value = '100';
    document.getElementById('prodPrice').value = '20000';
    document.getElementById('prodDiscount').value = '0';
    document.getElementById('prodActive').checked = true;
  } else {
    let prod = products[prodIndex];
    document.getElementById('prodModalTitle').innerText = 'Cập nhật sản phẩm';
    document.getElementById('btnSaveProd').innerText = 'Lưu';
    document.getElementById('prodIdHidden').value = prodIndex;
    document.getElementById('prodCode').value = prod.product_code;
    document.getElementById('prodName').value = prod.product_name;
    document.getElementById('prodCatSelect').value = prod.category_id;
    document.getElementById('prodStock').value = prod.stock;
    document.getElementById('prodPrice').value = prod.price;
    document.getElementById('prodDiscount').value = prod.discount;

    if (prod.status === 'ACTIVE') {
      document.getElementById('prodActive').checked = true;
    } else {
      document.getElementById('prodInactive').checked = true;
    }
  }

  productModal.show();
}

function saveProduct() {
  let prodCode = document.getElementById('prodCode').value.trim();
  let prodName = document.getElementById('prodName').value.trim();
  let catId = document.getElementById('prodCatSelect').value;
  let stock = Number(document.getElementById('prodStock').value);
  let price = Number(document.getElementById('prodPrice').value);
  let discount = Number(document.getElementById('prodDiscount').value);
  let editingIndex = Number(document.getElementById('prodIdHidden').value);

  let status = document.getElementById('prodInactive').checked ? 'INACTIVE' : 'ACTIVE';
  let hasError = false;

  if (prodCode === '') {
    document.getElementById('prodCodeErr').innerText = 'Mã sản phẩm không được rỗng';
    hasError = true;
  }
  if (prodName === '') {
    document.getElementById('prodNameErr').innerText = 'Tên sản phẩm không được rỗng';
    hasError = true;
  }
  if (catId === '') {
    document.getElementById('prodCatErr').innerText = 'Vui lòng chọn danh mục';
    hasError = true;
  }

  if (hasError) return;

  if (editingIndex === -1) {
    let newProd = {
      id: Date.now(),
      product_code: prodCode,
      product_name: prodName,
      category_id: Number(catId),
      stock: stock,
      price: price,
      discount: discount,
      image: '',
      description: '',
      status: status,
      created_at: new Date().toISOString()
    };
    products.push(newProd);
    showNotification('Thêm mới sản phẩm thành công!');
  } else {
    products[editingIndex].product_code = prodCode;
    products[editingIndex].product_name = prodName;
    products[editingIndex].category_id = Number(catId);
    products[editingIndex].stock = stock;
    products[editingIndex].price = price;
    products[editingIndex].discount = discount;
    products[editingIndex].status = status;
    showNotification('Cập nhật sản phẩm thành công!');
  }

  saveProductsToLocalStorage();
  productModal.hide();
  renderProducts();
}


/* ===================================
   16 & 17. XÁC NHẬN VÀ THỰC HIỆN XÓA
=================================== */

function askDelete(type, id) {
  deleteType = type;
  deleteId = id;

  if (type === 'category') {
    document.getElementById('confirmDeleteMsg').innerText = 'Bạn có chắc chắn muốn xóa danh mục này không?';
  } else {
    document.getElementById('confirmDeleteMsg').innerText = 'Bạn có chắc chắn muốn xóa sản phẩm này không?';
  }

  document.getElementById('btnConfirmDelete').onclick = executeDelete;
  confirmDeleteModal.show();
}

function executeDelete() {
  confirmDeleteModal.hide();

  if (deleteType === 'category') {
    deleteCategory(deleteId);
  } else if (deleteType === 'product') {
    deleteProduct(deleteId);
  }

  deleteType = '';
  deleteId = null;
}


/* ===================================
   18. XÓA DANH MỤC
=================================== */

function deleteCategory(categoryId) {
  let hasProduct = false;

  for (let i = 0; i < products.length; i++) {
    if (products[i].category_id === categoryId) {
      hasProduct = true;
      break;
    }
  }

  if (hasProduct) {
    showNotification('Không thể xóa vì danh mục này đang có sản phẩm.');
    return;
  }

  let categoryIndex = findCategoryIndexById(categoryId);
  if (categoryIndex === -1) return;

  categories.splice(categoryIndex, 1);
  saveCategoriesToLocalStorage();

  renderCategories();
  populateCatDropdown();
  showNotification('Xóa danh mục thành công!');
}


/* ===================================
   19. XÓA SẢN PHẨM
=================================== */

function deleteProduct(productId) {
  let productIndex = -1;

  for (let i = 0; i < products.length; i++) {
    if (products[i].id === productId) {
      productIndex = i;
      break;
    }
  }

  if (productIndex === -1) return;

  products.splice(productIndex, 1);
  saveProductsToLocalStorage();

  renderProducts();
  showNotification('Xóa sản phẩm thành công!');
}


/* ===================================
   20. THÔNG BÁO
=================================== */

function showNotification(message) {
  document.getElementById('notificationMsg').innerText = message;
  notificationModal.show();
}


/* ===================================
   21. LOCAL STORAGE
=================================== */

function saveCategoriesToLocalStorage() {
  localStorage.setItem('categories', JSON.stringify(categories));
}

function saveProductsToLocalStorage() {
  localStorage.setItem('products', JSON.stringify(products));
}