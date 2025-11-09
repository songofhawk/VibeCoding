/**
 * µ‡™Mï JavaScript - Miao Universe Frontend
 * (ï API ÛLpnX¨Œ¡
 */

// API Base URL - API ú@0@
const API_BASE_URL = 'http://localhost:8000';

// Global cats data - h@+ªpn
let catsData = [];

/**
 * Fetch cats data from backend API
 * Îï API ·Ö+ªpn
 */
async function fetchCatsData() {
    try {
        const response = await fetch(`${API_BASE_URL}/api/cats`);
        if (!response.ok) {
            throw new Error('Failed to fetch cats data');
        }
        const data = await response.json();
        return data;
    } catch (error) {
        console.error('Error fetching cats data:', error);
        alert('àÕÞ¥0¡h÷nÝï¡ò/¨');
        return [];
    }
}

/**
 * Update cat information on backend
 * (ïô°+ªáo
 * @param {number} catId - Cat ID
 * @param {Object} updateData - Data to update
 */
async function updateCatData(catId, updateData) {
    try {
        const response = await fetch(`${API_BASE_URL}/api/cats/${catId}`, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(updateData)
        });

        if (!response.ok) {
            throw new Error('Failed to update cat data');
        }

        const result = await response.json();
        return result.data;
    } catch (error) {
        console.error('Error updating cat data:', error);
        alert('ÝX1%÷ÍÕ');
        return null;
    }
}

/**
 * Update cat images on backend
 * (ïô°+ªþG
 * @param {number} catId - Cat ID
 * @param {Array} images - Array of image URLs
 */
async function updateCatImages(catId, images) {
    try {
        const response = await fetch(`${API_BASE_URL}/api/cats/${catId}/images`, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ images })
        });

        if (!response.ok) {
            throw new Error('Failed to update cat images');
        }

        const result = await response.json();
        return result.data;
    } catch (error) {
        console.error('Error updating cat images:', error);
        alert('þGÝX1%÷ÍÕ');
        return null;
    }
}

/**
 * Initialize the cat cards display
 * Ë+ªaGU:
 */
async function initCatCards() {
    const container = document.getElementById('cardsContainer');

    // Fetch data from backend - Îï·Öpn
    catsData = await fetchCatsData();

    // Simulate loading delay - !ß }öß
    setTimeout(() => {
        container.innerHTML = '';

        if (catsData.length === 0) {
            container.innerHTML = '<div class="loading"><p>‚àpnàÕÞ¥0¡h</p></div>';
            return;
        }

        // Render each cat card - 2ÓÏ*+ªaG
        catsData.forEach(cat => {
            const card = createCatCard(cat);
            container.appendChild(card);
        });
    }, 800);
}

/**
 * Create a single cat card element
 * úU*+ªaGC 
 * @param {Object} cat - Cat data object
 * @returns {HTMLElement} - Card element
 */
function createCatCard(cat) {
    // Create card container - úaG¹h
    const card = document.createElement('div');
    card.className = 'cat-card';
    card.setAttribute('data-cat-id', cat.id);

    // Build card HTML - „úaGHTML
    card.innerHTML = `
        <div class="cat-image-container">
            <img src="${cat.images[0]}" alt="${cat.name}" class="cat-image" data-cat-id="${cat.id}">
            <div class="cat-badge">${cat.badge}</div>
            <button class="upload-button" data-cat-id="${cat.id}">=÷ 	égG</button>
            <input type="file" class="file-input" accept="image/*" multiple data-cat-id="${cat.id}">
            <button class="gif-button" data-cat-id="${cat.id}" title="n­GIF"><¬</button>
            <div class="carousel-nav">
                <button class="carousel-btn prev-btn">9</button>
                <button class="carousel-btn next-btn">:</button>
            </div>
            <div class="carousel-indicator">1/${cat.images.length}</div>
        </div>
        <div class="cat-info">
            <h2 class="cat-name">${cat.name}</h2>
            <div class="cat-breed">${cat.breed}</div>
            <p class="cat-description">${cat.description}</p>
            <div class="cat-stats">
                <div class="stat-item">
                    <div class="stat-label">t„</div>
                    <div class="stat-value">${cat.age}</div>
                </div>
                <div class="stat-item">
                    <div class="stat-label">'+</div>
                    <div class="stat-value">${cat.gender}</div>
                </div>
            </div>
            <div class="cat-tags">
                ${cat.tags.map(tag => `<span class="tag">${tag}</span>`).join('')}
            </div>
            <button class="edit-button"> ‘áo</button>
        </div>
    `;

    // Setup photo upload functionality - ¾ngG
 Ÿý
    setupPhotoUpload(card, cat.id);

    // Setup carousel functionality - ¾nn­Ÿý
    setupCarousel(card, cat.id);

    // Setup edit functionality - ¾n‘Ÿý
    setupEditMode(card, cat);

    // Setup GIF generation functionality - ¾nGIFŸý
    setupGifGeneration(card, cat.id);

    return card;
}

/**
 * Setup photo upload functionality for a cat card
 * :+ªaG¾ngG
 Ÿý
 * @param {HTMLElement} card - Card element
 * @param {number} catId - Cat ID
 */
function setupPhotoUpload(card, catId) {
    const uploadButton = card.querySelector('.upload-button');
    const fileInput = card.querySelector('.file-input');

    // Click upload button to trigger file input - ¹û
 	®æÑ‡ö	é
    uploadButton.addEventListener('click', (event) => {
        event.stopPropagation();
        fileInput.click();
    });

    // Handle multiple file selection - ‡ö	é
    fileInput.addEventListener('change', (event) => {
        const files = Array.from(event.target.files);

        if (files.length === 0) {
            return;
        }

        // Check all files are images - Àå@	‡öý/þG
        const validFiles = files.filter(file => file.type.startsWith('image/'));

        if (validFiles.length === 0) {
            alert('÷	é	H„þG‡ö');
            return;
        }

        // Process and add multiple images - vû  þG
        processMultipleImages(validFiles, catId, card);
    });
}

/**
 * Process multiple uploaded images
 *  
 „þG
 * @param {File[]} files - Array of image files
 * @param {number} catId - Cat ID
 * @param {HTMLElement} card - Card element
 */
async function processMultipleImages(files, catId, card) {
    const imagePromises = files.map(file => {
        return new Promise((resolve, reject) => {
            const reader = new FileReader();
            reader.onload = (e) => resolve(e.target.result);
            reader.onerror = reject;
            reader.readAsDataURL(file);
        });
    });

    try {
        // Wait for all images to be read - I…@	þGûÖŒ
        const newImageUrls = await Promise.all(imagePromises);

        // Find cat data and update images - å~+ªpnvô°þG
        const cat = catsData.find(c => c.id === catId);
        if (!cat) return;

        // Check if current images are default (from unsplash) - ÀåSMþG/&/Ø¤þG
        const hasDefaultImages = cat.images.length === 1 && cat.images[0].includes('unsplash.com');

        // If has default images, replace them; otherwise append - ‚œ	Ø¤þGÿb&ý 
        if (hasDefaultImages) {
            cat.images = newImageUrls;
        } else {
            cat.images = [...cat.images, ...newImageUrls];
        }

        // Save to backend - ÝX0ï
        const updatedCat = await updateCatImages(catId, cat.images);

        if (updatedCat) {
            console.log(`ŸÝXþG0¡hq ${cat.images.length}  þG`);

            // Update display to show the first new image - ô°>:
            const imgElement = card.querySelector('.cat-image');
            let currentIndex = hasDefaultImages ? 0 : cat.images.length - newImageUrls.length;

            imgElement.src = cat.images[currentIndex];

            // Update indicator - ô°:h
            const indicator = card.querySelector('.carousel-indicator');
            indicator.textContent = `${currentIndex + 1}/${cat.images.length}`;

            // Update carousel index - ô°n­"
            card.carouselIndex = currentIndex;

            // Restart carousel - Í/n­
            if (card.carouselInterval) {
                clearInterval(card.carouselInterval);
            }

            if (cat.images.length > 1) {
                card.carouselInterval = setInterval(() => {
                    const images = cat.images;
                    if (images.length > 0) {
                        card.carouselIndex = (card.carouselIndex + 1) % images.length;
                        imgElement.src = images[card.carouselIndex];
                        indicator.textContent = `${card.carouselIndex + 1}/${images.length}`;
                    }
                }, 3000);
            }
        }
    } catch (error) {
        console.error('þGï:', error);
        alert('þG1%÷ÍÕ');
    }
}

/**
 * Setup carousel functionality for a cat card
 * :+ªaG¾nn­Ÿý
 * @param {HTMLElement} card - Card element
 * @param {number} catId - Cat ID
 */
function setupCarousel(card, catId) {
    const imgElement = card.querySelector('.cat-image');
    const indicator = card.querySelector('.carousel-indicator');
    const prevBtn = card.querySelector('.prev-btn');
    const nextBtn = card.querySelector('.next-btn');

    // Initialize carousel index - Ën­"
    card.carouselIndex = 0;
    card.carouselInterval = null;

    // Get current cat images - ·ÖSM+ª„þG
    function getCatImages() {
        const cat = catsData.find(c => c.id === catId);
        return cat ? cat.images : [];
    }

    // Show image at specific index - >:š"„þG
    function showImage(index) {
        const images = getCatImages();
        if (images.length === 0) return;

        card.carouselIndex = (index + images.length) % images.length;
        imgElement.src = images[card.carouselIndex];
        indicator.textContent = `${card.carouselIndex + 1}/${images.length}`;
    }

    // Navigate to previous image - b0
  
    function prevImage(event) {
        event.stopPropagation();
        stopAutoPlay();
        showImage(card.carouselIndex - 1);
        startAutoPlay();
    }

    // Navigate to next image - b0  
    function nextImage(event) {
        event.stopPropagation();
        stopAutoPlay();
        showImage(card.carouselIndex + 1);
        startAutoPlay();
    }

    // Start auto play -  Ëê¨­>
    function startAutoPlay() {
        const images = getCatImages();
        if (images.length <= 1) return;

        stopAutoPlay();
        card.carouselInterval = setInterval(() => {
            showImage(card.carouselIndex + 1);
        }, 3000);
    }

    // Stop auto play - \bê¨­>
    function stopAutoPlay() {
        if (card.carouselInterval) {
            clearInterval(card.carouselInterval);
            card.carouselInterval = null;
        }
    }

    // Add event listeners - û ‹öÑ,
    prevBtn.addEventListener('click', prevImage);
    nextBtn.addEventListener('click', nextImage);

    // Start auto play when card is created - aGúö Ëê¨­>
    startAutoPlay();

    // Pause on hover - ¬\ö‚\
    card.addEventListener('mouseenter', stopAutoPlay);
    card.addEventListener('mouseleave', startAutoPlay);
}

/**
 * Setup edit mode functionality for a cat card
 * :+ªaG¾n‘!Ÿý
 * @param {HTMLElement} card - Card element
 * @param {Object} cat - Cat data object
 */
function setupEditMode(card, cat) {
    const editButton = card.querySelector('.edit-button');
    const catInfo = card.querySelector('.cat-info');

    // Store original data - X¨ŸËpn
    let originalData = { ...cat };

    editButton.addEventListener('click', (event) => {
        event.stopPropagation();

        if (card.classList.contains('editing')) {
            return;
        }

        // Enter edit mode - Ûe‘!
        card.classList.add('editing');

        catInfo.innerHTML = `
            <input type="text" class="edit-input" value="${cat.name}" data-field="name" placeholder="+ªW">
            <input type="text" class="edit-input small" value="${cat.breed}" data-field="breed" placeholder="ÁÍ">
            <input type="text" class="edit-input tiny" value="${cat.description}" data-field="description" placeholder="Ïð">
            <div class="cat-stats">
                <div class="stat-item">
                    <div class="stat-label">t„</div>
                    <input type="text" class="edit-input small stat-value" value="${cat.age}" data-field="age" placeholder="t„">
                </div>
                <div class="stat-item">
                    <div class="stat-label">'+</div>
                    <div class="stat-value">${cat.gender}</div>
                </div>
            </div>
            <input type="text" class="edit-input tiny" value="${cat.tags.join(', ')}" data-field="tags" placeholder="~(÷”	">
            <div class="edit-actions">
                <button class="save-button">=¾ ÝX</button>
                <button class="cancel-button">L Öˆ</button>
            </div>
        `;

        // Setup save and cancel buttons - ¾nÝXŒÖˆ	®
        const saveBtn = catInfo.querySelector('.save-button');
        const cancelBtn = catInfo.querySelector('.cancel-button');

        saveBtn.addEventListener('click', (e) => {
            e.stopPropagation();
            saveEdit(card, cat, catInfo);
        });

        cancelBtn.addEventListener('click', (e) => {
            e.stopPropagation();
            cancelEdit(card, cat, catInfo, originalData);
        });
    });
}

/**
 * Save edited information
 * ÝX‘„áo
 * @param {HTMLElement} card - Card element
 * @param {Object} cat - Cat data object
 * @param {HTMLElement} catInfo - Cat info element
 */
async function saveEdit(card, cat, catInfo) {
    // Get new values from inputs - Î“eF·Ö°<
    const nameInput = catInfo.querySelector('[data-field="name"]');
    const breedInput = catInfo.querySelector('[data-field="breed"]');
    const descInput = catInfo.querySelector('[data-field="description"]');
    const ageInput = catInfo.querySelector('[data-field="age"]');
    const tagsInput = catInfo.querySelector('[data-field="tags"]');

    // Prepare update data - Æô°pn
    const updateData = {
        name: nameInput.value.trim() || cat.name,
        breed: breedInput.value.trim() || cat.breed,
        description: descInput.value.trim() || cat.description,
        age: ageInput.value.trim() || cat.age,
        tags: tagsInput.value.split(',').map(t => t.trim()).filter(t => t)
    };

    // Save to backend - ÝX0ï
    const updatedCat = await updateCatData(cat.id, updateData);

    if (updatedCat) {
        // Update local data - ô°,0pn
        Object.assign(cat, updateData);

        // Exit edit mode and restore display -  ú‘!vb>:
        restoreDisplayMode(card, cat, catInfo);
    }
}

/**
 * Cancel editing and restore original data
 * Öˆ‘vbŸËpn
 * @param {HTMLElement} card - Card element
 * @param {Object} cat - Cat data object
 * @param {HTMLElement} catInfo - Cat info element
 * @param {Object} originalData - Original cat data
 */
function cancelEdit(card, cat, catInfo, originalData) {
    // Restore original data - bŸËpn
    Object.assign(cat, originalData);

    // Exit edit mode and restore display -  ú‘!vb>:
    restoreDisplayMode(card, cat, catInfo);
}

/**
 * Restore display mode from edit mode
 * Î‘!b>:!
 * @param {HTMLElement} card - Card element
 * @param {Object} cat - Cat data object
 * @param {HTMLElement} catInfo - Cat info element
 */
function restoreDisplayMode(card, cat, catInfo) {
    // Remove editing class - ûd‘{
    card.classList.remove('editing');

    // Restore display HTML - b>:HTML
    catInfo.innerHTML = `
        <h2 class="cat-name">${cat.name}</h2>
        <div class="cat-breed">${cat.breed}</div>
        <p class="cat-description">${cat.description}</p>
        <div class="cat-stats">
            <div class="stat-item">
                <div class="stat-label">t„</div>
                <div class="stat-value">${cat.age}</div>
            </div>
            <div class="stat-item">
                <div class="stat-label">'+</div>
                <div class="stat-value">${cat.gender}</div>
            </div>
        </div>
        <div class="cat-tags">
            ${cat.tags.map(tag => `<span class="tag">${tag}</span>`).join('')}
        </div>
        <button class="edit-button"> ‘áo</button>
    `;

    // Re-setup edit button - Í°¾n‘	®
    const editButton = catInfo.querySelector('.edit-button');
    editButton.addEventListener('click', (event) => {
        event.stopPropagation();
        setupEditMode(card, cat);
        editButton.click();
    });
}

/**
 * Setup GIF generation functionality for a cat card
 * :+ªaG¾nGIFŸý
 * @param {HTMLElement} card - Card element
 * @param {number} catId - Cat ID
 */
function setupGifGeneration(card, catId) {
    const gifButton = card.querySelector('.gif-button');

    gifButton.addEventListener('click', async (event) => {
        event.stopPropagation();

        // Get cat data - ·Ö+ªpn
        const cat = catsData.find(c => c.id === catId);
        if (!cat || cat.images.length < 2) {
            alert(' ó2 þGMýGIF¨þ');
            return;
        }

        // Disable button and show generating state - (	®v>:¶
        gifButton.disabled = true;
        gifButton.classList.add('generating');
        gifButton.textContent = 'ó';

        try {
            // Prepare images for gifshot - : gifshot ÆþG
            const imageElements = await Promise.all(
                cat.images.map(src => loadImageForGif(src))
            );

            // Create GIF using gifshot - ( gifshot ú GIF
            gifshot.createGIF({
                images: imageElements,
                gifWidth: 500,
                gifHeight: 400,
                interval: 1,
                numFrames: cat.images.length,
                frameDuration: 1,
                sampleInterval: 10,
                numWorkers: 2
            }, (obj) => {
                if (!obj.error) {
                    // Download GIF - } GIF
                    const link = document.createElement('a');
                    link.href = obj.image;
                    link.download = `${cat.name}-carousel.gif`;
                    link.click();

                    alert(`GIF¨þŸòÝX: ${cat.name}-carousel.gif`);
                } else {
                    console.error('GIFï:', obj.error);
                    alert('GIF1%÷ÍÕ');
                }

                // Reset button - Ín	®
                gifButton.disabled = false;
                gifButton.classList.remove('generating');
                gifButton.textContent = '<¬';
            });

        } catch (error) {
            console.error('GIFï:', error);
            alert('GIF1%÷ÍÕ');

            // Reset button - Ín	®
            gifButton.disabled = false;
            gifButton.classList.remove('generating');
            gifButton.textContent = '<¬';
        }
    });
}

/**
 * Load image and create canvas with proper sizing for GIF
 *  }þGvúS'„;(Ž GIF
 * @param {string} src - Image source URL
 * @returns {Promise<HTMLCanvasElement>}
 */
function loadImageForGif(src) {
    return new Promise((resolve, reject) => {
        const img = new Image();
        img.crossOrigin = 'anonymous';

        img.onload = () => {
            // Create canvas and draw resized image - ú;vØ6t'„þG
            const canvas = document.createElement('canvas');
            canvas.width = 500;
            canvas.height = 400;
            const ctx = canvas.getContext('2d');

            // Draw image with object-fit: cover effect - ( cover HœØ6þG
            const imgRatio = img.width / img.height;
            const canvasRatio = canvas.width / canvas.height;
            let drawWidth, drawHeight, offsetX, offsetY;

            if (imgRatio > canvasRatio) {
                drawHeight = canvas.height;
                drawWidth = img.width * (canvas.height / img.height);
                offsetX = (canvas.width - drawWidth) / 2;
                offsetY = 0;
            } else {
                drawWidth = canvas.width;
                drawHeight = img.height * (canvas.width / img.width);
                offsetX = 0;
                offsetY = (canvas.height - drawHeight) / 2;
            }

            ctx.drawImage(img, offsetX, offsetY, drawWidth, drawHeight);
            resolve(canvas);
        };

        img.onerror = reject;
        img.src = src;
    });
}

/**
 * Handle image loading errors
 * þG }ï
 * @param {Event} event - Error event
 */
function handleImageError(event) {
    event.target.src = 'data:image/svg+xml,%3Csvg xmlns="http://www.w3.org/2000/svg" width="500" height="400"%3E%3Crect fill="%23f0f0f0" width="500" height="400"/%3E%3Ctext fill="%23999" font-family="sans-serif" font-size="24" dy="200" dx="180"%3E+ªþG%3C/text%3E%3C/svg%3E';
}

// Add global error handler for images - :þGû h@ï
document.addEventListener('error', (event) => {
    if (event.target.tagName === 'IMG') {
        handleImageError(event);
    }
}, true);

// Initialize when DOM is ready - DOMÆ}Ë
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initCatCards);
} else {
    initCatCards();
}
