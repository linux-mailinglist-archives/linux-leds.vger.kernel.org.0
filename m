Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1C554653A
	for <lists+linux-leds@lfdr.de>; Fri, 14 Jun 2019 19:00:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725999AbfFNRAO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 14 Jun 2019 13:00:14 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:46575 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725889AbfFNRAO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 14 Jun 2019 13:00:14 -0400
Received: by mail-qt1-f195.google.com with SMTP id h21so3213660qtn.13;
        Fri, 14 Jun 2019 10:00:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GS1hGa817xEQ00srJV+PzwKtWWnIbCX8xB7ozEQ8PeA=;
        b=SziVNEb96Y3NHG5cI0sUpDirBmajlOGfVjSelfia2mBJeWUCqYrFvZxyvJh29lzVCl
         p4xWul+tbDIZtMisiTiewevPEegV/feRwVn9TgwL3Ai3RvoSxjCielu5i88b+G1GDt8X
         ZodO9PdmCGZxds27W5QpIC1Dd4CnQW6Mrs0fH8B+mCq+KiIgz6uiNWsWVsBCb8r9Kcg8
         V7youdprjCTzgarBP9KZAUEsmmm/GTqkaLD4o56BcUxcKle5N7ZYi/oJ7RjNAv13kJmU
         jA1EN4KGDB3c3p1d74U/CV1Mkv9CZtiArWHfxj+5tMaNjPQS8CS91bH2gk7l+H9OtzTi
         hDEw==
X-Gm-Message-State: APjAAAWwK2iMm10cml1uYqzRrF18oNGnKVWdHjHTmDIrjv7S2Y7DU45h
        67Hrwkam/Ut2LFN0mmjka3q/OnwUEg==
X-Google-Smtp-Source: APXvYqypc0vhDImV9CKnXnk341O4whOdSmNRzr7Vv8pyHogbMsYPOsNoVDRfEVwUDByeZtQNRMKJfg==
X-Received: by 2002:ac8:1087:: with SMTP id a7mr67129150qtj.141.1560531613016;
        Fri, 14 Jun 2019 10:00:13 -0700 (PDT)
Received: from localhost ([64.188.179.243])
        by smtp.gmail.com with ESMTPSA id j141sm2139542qke.28.2019.06.14.10.00.12
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 10:00:12 -0700 (PDT)
Date:   Fri, 14 Jun 2019 11:00:11 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/9] dt: bindings: Add multicolor class dt bindings
 documention
Message-ID: <20190614170011.GA3277@bogus>
References: <20190523190820.29375-1-dmurphy@ti.com>
 <20190523190820.29375-3-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190523190820.29375-3-dmurphy@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, May 23, 2019 at 02:08:13PM -0500, Dan Murphy wrote:
> Add DT bindings for the LEDs multicolor class framework.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  .../bindings/leds/leds-class-multicolor.txt   | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt b/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
> new file mode 100644
> index 000000000000..e2a2ce3279cb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
> @@ -0,0 +1,97 @@
> +* Multicolor LED properties
> +
> +Multicolor LEDs can consist of a RGB, RGBW or a RGBA LED clusters.  These devices
> +can be grouped together and also provide a modeling mechanism so that the
> +cluster LEDs can vary in hue and intensity to produce a wide range of colors.
> +
> +The nodes and properties defined in this document are unique to the multicolor
> +LED class.  Common LED nodes and properties are inherited from the common.txt
> +within this documentation directory.
> +
> +Required LED Child properties:
> +	- color : For multicolor LED support this property should be defined as
> +		  LED_COLOR_ID_MULTI and further definition can be found in
> +		  include/linux/leds/common.h.
> +
> +led-controller@30 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	compatible = "ti,lp5024";
> +	reg = <0x29>;
> +
> +	multi-led@4 {

Typically we sort by address order.

> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <4>;
> +		color = <LED_COLOR_ID_MULTI>;
> +		function = LED_FUNCTION_ACTIVITY;
> +
> +		led@12 {
> +			reg = <12>;
> +			color = <LED_COLOR_ID_RED>;
> +		};
> +
> +		led@13 {
> +			reg = <13>;
> +			color = <LED_COLOR_ID_GREEN>;
> +		};
> +
> +		led@14 {
> +			reg = <14>;
> +			color = <LED_COLOR_ID_BLUE>;
> +		};
> +	};
> +
> +	/* Only support RGB no model defined */

I don't understand this comment.

> +	multi-led@1 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <1>;
> +		color = <LED_COLOR_ID_MULTI>;
> +		function = LED_FUNCTION_;

??

> +
> +
> +		led@3 {
> +			reg = <3>;
> +			color = <LED_COLOR_ID_RED>;
> +		};
> +
> +		led@4 {
> +			reg = <4>;
> +			color = <LED_COLOR_ID_GREEN>;
> +		};
> +
> +		led@5 {
> +			reg = <5>;
> +			color = <LED_COLOR_ID_BLUE>;
> +		};
> +	};
> +
> +	multi-led@2 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		color = <LED_COLOR_ID_MULTI>;
> +		function = LED_FUNCTION_ACTIVITY;
> +		reg = <2>;
> +		ti,led-bank = <2 3 5>;
> +
> +		led@6 {
> +			reg = <0x6>;
> +			color = <LED_COLOR_ID_RED>;
> +			led-sources = <6 9 15>;
> +		};
> +
> +		led@7 {
> +			reg = <0x7>;
> +			color = <LED_COLOR_ID_GREEN>;
> +			led-sources = <7 10 16>;
> +		};
> +
> +		led@8 {
> +			reg = <0x8>;
> +			color = <LED_COLOR_ID_BLUE>;
> +			led-sources = <8 11 17>;
> +		};
> +	};
> +
> +};
> -- 
> 2.21.0.5.gaeb582a983
> 
