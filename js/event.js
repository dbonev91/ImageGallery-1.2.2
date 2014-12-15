var Event = (function () {

    var ShowHideVirtualBackground = (function () {
        function ShowHideVirtualBackground() {
            this.showVirtualBackground();
            this.hideVirtualBackground();
        }

        ShowHideVirtualBackground.prototype.showVirtualBackground = function () {
            $('.smallImage').on('click', function () {
                $('.virtualBackground').show();

                new Event.SlideImage();
                new Event.LoadVirtualImage($(this).attr('class').split(' ')[1]);

                GeneralVariables.currentImage = parseInt($(this).attr('class').split(' ')[1]);

                new Event.DisableScrollingPage();
            });
        }

        ShowHideVirtualBackground.prototype.hideVirtualBackground = function () {
            $(document).on('click', function (event) {
                if (event.target.className.split(' ')[0] == 'virtualImageHolder') {
                    hideImage();
                }
            });

            $(document).on('keydown', function (event) {
                if (event.which == 27) {
                    hideImage();
                }
            });

            $('.closeVirtualImage').on('click', function () {
                hideImage();
            });

            var hideImage = function () {
                $('.virtualBackground').hide();

                new Event.EnableScrollingPage();
            };
        }

        return ShowHideVirtualBackground ;

    })();

    var LoadVirtualImage = (function () {
        function LoadVirtualImage(imageId) {
            this.setImageId(imageId);
            this.setImageName();

            this.appendImage();
        }

        LoadVirtualImage.prototype.setImageName = function () {
            this._imageName = GeneralVariables.JSONImageData[this.getImageId()].imagename;
        }

        LoadVirtualImage.prototype.getImageName = function () {
            return this._imageName;
        }

        LoadVirtualImage.prototype.appendImage = function () {
            new Image.BigImage(this.getImageName(), this.getImageId());
        }

        LoadVirtualImage.prototype.setImageId = function (value) {
            this._imageId = value;
        }

        LoadVirtualImage.prototype.getImageId = function () {
            return this._imageId;
        }

        return LoadVirtualImage;

    })();

    var SlideImage = (function () {
        function SlideImage() {
            this.nextImage();
            this.prevImage();
            this.leftArrowOpacity();
            this.rightArrowOpacity();
        }

        SlideImage.prototype.prevImage = function () {
            $(".leftArrow, .bigImageLeftArrowHolder")
                .on('click', function () {
                    prevImageLogic();
            });

            $(document).on('keypress', function (event) {
                if (event.keyCode == 37) {
                    prevImageLogic();
                }
            });
        }

        var prevImageLogic = function () {
            GeneralVariables.currentImage = isNaN(GeneralVariables.currentImage) ? '' :
                GeneralVariables.currentImage ? --GeneralVariables.currentImage :
                GeneralVariables.JSONImageData.length - 1;

            new Image.BigImage(GeneralVariables.JSONImageData[GeneralVariables.currentImage].imagename, GeneralVariables.currentImage);

            $(this)
                .data('prevImage', GeneralVariables.currentImage - 1 < 0 ?
                GeneralVariables.JSONImageData.length - 1 : GeneralVariables.currentImage - 1);
        }

        SlideImage.prototype.nextImage = function () {
            $(".rightArrow, .bigImageRightArrowHolder, .bigImageCenter")
                .on('click', function () {
                nextImageLogic();
            });

            $(document).on('keypress', function (event) {
                if (event.keyCode == 39) {
                    nextImageLogic();
                }
            });
        }

        var nextImageLogic = function () {
            GeneralVariables.currentImage = isNaN(GeneralVariables.currentImage) ? '' :
                GeneralVariables.currentImage >= GeneralVariables.JSONImageData.length - 1 ?
                    0 : ++GeneralVariables.currentImage;

            new Image.BigImage(GeneralVariables.JSONImageData[GeneralVariables.currentImage].imagename, GeneralVariables.currentImage);

            $(this)
                .data('nextImage', GeneralVariables.currentImage + 1 <=
                GeneralVariables.JSONImageData.length - 1 ? GeneralVariables.currentImage + 1 : 0);
        }

        SlideImage.prototype.rightArrowOpacity = function () {
            $(".rightArrow, .bigImageRightArrowHolder, .bigImageCenter")
                .on('mouseover', function () {
                    $(".rightArrow").css("opacity", 0.9);
                })
                .on('mouseout', function () {
                    $(".rightArrow").css("opacity", 0.4);
                });
        }

        SlideImage.prototype.leftArrowOpacity = function () {
            $(".leftArrow, .bigImageLeftArrowHolder")
                .on('mouseover', function () {
                    $(".leftArrow").css("opacity", 0.9);
                })
                .on('mouseout', function () {
                    $(".leftArrow").css("opacity", 0.4);
                });
        }

        return SlideImage;

    })();

    var DisableScrollingPage = (function () {
        function DisableScrollingPage() {
            this.bodyOverflowHidden();
            this.disableScrolling();
        }

        DisableScrollingPage.prototype.bodyOverflowHidden = function () {
            // Computer
            $("body").css("overflow", "hidden");

            // SmartPhone
            $(document).on('touchmove', function(event) {
                event.preventDefault();
            });
        }

        DisableScrollingPage.prototype.disableScrolling = function () {
            var disabledKeyWhich = [32, 33, 34, 38, 40, 35];

            $(document).on("keydown", function (event) {
                if (disabledKeyWhich.indexOf(event.which) !== -1) {
                    event.preventDefault();
                }
            });
        }

        return DisableScrollingPage;

    })();

    var EnableScrollingPage = (function () {
        function EnableScrollingPage() {
            this.bodyOverflowAuto();
            this.enableScrolling();
        }

        EnableScrollingPage.prototype.bodyOverflowAuto = function () {
            // Computer
            $("body").css("overflow", "auto");

            // SmartPhone
            $(document).unbind('touchmove');
        }

        EnableScrollingPage.prototype.enableScrolling = function () {
            $(document).unbind("keydown");
        }

        return EnableScrollingPage;

    })();

    return {
        ShowHideVirtualBackground : ShowHideVirtualBackground,
        LoadVirtualImage: LoadVirtualImage,
        SlideImage: SlideImage,
        DisableScrollingPage: DisableScrollingPage,
        EnableScrollingPage: EnableScrollingPage
    }

})();
