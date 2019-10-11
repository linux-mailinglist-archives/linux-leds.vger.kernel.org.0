Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D1ABD493C
	for <lists+linux-leds@lfdr.de>; Fri, 11 Oct 2019 22:23:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729153AbfJKUPw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 11 Oct 2019 16:15:52 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50260 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729102AbfJKUPv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 11 Oct 2019 16:15:51 -0400
Received: by mail-wm1-f65.google.com with SMTP id 5so11612836wmg.0;
        Fri, 11 Oct 2019 13:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tu1djCD07vR6Np7/uG+RV0J/wyoWVKzkLXaCxKlssVQ=;
        b=Et1faQ9fqzEspoGff/VIzcIDW1n/IL6988ozBTr3McLm32cens8mNPSrdNto4yp9c/
         Ygh933mY1gu+fgVYDBeWAkgrDPPcDMqn20sGppTQ4vPsDka6rtENAeqsI7cTa5E+rnV2
         6Gl5wQX5snYOsY/12AG0yFrYyGyeJgFIymmupvpaYUFgea/OPbn6xSkxCPxidgu4Tiv8
         d4lc2D+7TTsnTQt5B6CJ4iZTn1Ktv5e5YH2OXKuSSHN4p/mdLwN2th7JtnRgoPSS4vNr
         tBr0raH0vkwxYnFfYIRsvow86grwCynWK+IB1dMabzBCz32oUAde0Kjl7Jm0mcYOSrC4
         WgmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=tu1djCD07vR6Np7/uG+RV0J/wyoWVKzkLXaCxKlssVQ=;
        b=sIfnyNMAzHn/DfaFWoehSg7UMfE0A1BfntUS9R44bLbgJ+QRCcBz4W28t8tchKt6iu
         me/2rOePWf1/kqcI0sjyl17zePaSlG919uqBUVZbSkzRZpMIG2bHGzm3BGwqEBDLTmBK
         lgxMYVYEbkG10XqMnruz4nNEIKkS36D8Nkre0T20atIvMMj99/c8pWDghGx4b4gw/cD6
         gLA0GlWkq7rl0JjX/n0KwgcGfcYdUC+PuZVT2AVfNcxBAgD2IQqAWam2M0y2NBmohSJo
         I378gyx/hv0FPoFHwYMDkGLFn0aPYS3szXiy4qkvdgK1EUYt/d+BiTVTnbkaSeJy+5Tv
         jdLQ==
X-Gm-Message-State: APjAAAUeN/mmo22ZojQgnmJ0Xv9WNrXa4uNcOy+b7X9NhDudT6qCJUyC
        zm7k/s6louXzKDaucLEHsGY=
X-Google-Smtp-Source: APXvYqwvgMIJ3jVWWy8FJxgP4eNeecPyx6ZMrVMdWgXJWiW4l3rHCCd7MKzkt2WLQvZ6p13nTLGIgQ==
X-Received: by 2002:a1c:20d8:: with SMTP id g207mr4581850wmg.79.1570824948174;
        Fri, 11 Oct 2019 13:15:48 -0700 (PDT)
Received: from [192.168.1.19] (cjl71.neoplus.adsl.tpnet.pl. [83.31.61.71])
        by smtp.gmail.com with ESMTPSA id h17sm14222443wme.6.2019.10.11.13.15.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Oct 2019 13:15:47 -0700 (PDT)
Subject: Re: [PATCH v12 08/16] dt: bindings: lp55xx: Update binding for
 Multicolor Framework
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tony Lindgren <tony@atomide.com>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
References: <20191011130657.4713-1-dmurphy@ti.com>
 <20191011130657.4713-9-dmurphy@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <42fb3f20-be4c-8e9e-8035-e4eafbc1e687@gmail.com>
Date:   Fri, 11 Oct 2019 22:15:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191011130657.4713-9-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 10/11/19 3:06 PM, Dan Murphy wrote:
> Update the DT binding to include the properties to use the
> multicolor framework for the devices that use the LP55xx
> framework.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> CC: Tony Lindgren <tony@atomide.com>
> CC: "Benoît Cousson" <bcousson@baylibre.com>
> CC: Linus Walleij <linus.walleij@linaro.org>
> CC: Shawn Guo <shawnguo@kernel.org>
> CC: Sascha Hauer <s.hauer@pengutronix.de>
> CC: Pengutronix Kernel Team <kernel@pengutronix.de>
> CC: Fabio Estevam <festevam@gmail.com>
> CC: NXP Linux Team <linux-imx@nxp.com>
> ---
>  .../devicetree/bindings/leds/leds-lp55xx.txt  | 149 +++++++++++++++---
>  1 file changed, 124 insertions(+), 25 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-lp55xx.txt b/Documentation/devicetree/bindings/leds/leds-lp55xx.txt
> index bfe2805c5534..736a2e1538be 100644
> --- a/Documentation/devicetree/bindings/leds/leds-lp55xx.txt
> +++ b/Documentation/devicetree/bindings/leds/leds-lp55xx.txt
> @@ -1,6 +1,8 @@
>  Binding for TI/National Semiconductor LP55xx LED Drivers
>  
>  Required properties:
> +- #address-cells: 1
> +- #size-cells: 0
>  - compatible: one of
>  	national,lp5521
>  	national,lp5523
> @@ -14,6 +16,18 @@ Required properties:
>  Each child has own specific current settings
>  - led-cur: Current setting at each LED channel (mA x10, 0 if LED is not connected)
>  - max-cur: Maximun current at each LED channel.
> +- reg: Output channel for the LED.  This is zero based channel identifier and
> +	the data sheet is a one based channel identifier.
> +	reg value to output to LED output number
> +	D1 = reg value is 0
> +	D2 = reg value is 1
> +	D3 = reg value is 2
> +	D4 = reg value is 3
> +	D5 = reg value is 4
> +	D6 = reg value is 5
> +	D7 = reg value is 6
> +	D8 = reg value is 7
> +	D9 = reg value is 8
>  
>  Optional properties:
>  - enable-gpio: GPIO attached to the chip's enable pin
> @@ -35,23 +49,28 @@ example 1) LP5521
>  on channel 0.
>  
>  lp5521@32 {

While at it let's fix node prefix to led-controller.
It will not break anyone and yet it will adapt the node naming
to what is now recommended.

> +	#address-cells = <1>;
> +	#size-cells = <0>;
>  	compatible = "national,lp5521";
>  	reg = <0x32>;
>  	label = "lp5521_pri";
>  	clock-mode = /bits/ 8 <2>;
>  
> -	chan0 {
> +	chan@0 {

Similarly in case of every child node:

s/chan/led/

> +		reg = <0>;
>  		led-cur = /bits/ 8 <0x2f>;
>  		max-cur = /bits/ 8 <0x5f>;
>  		linux,default-trigger = "heartbeat";
>  	};
>  
> -	chan1 {
> +	chan@1 {
> +		reg = <1>;
>  		led-cur = /bits/ 8 <0x2f>;
>  		max-cur = /bits/ 8 <0x5f>;
>  	};
>  
> -	chan2 {
> +	chan@2 {
> +		reg = <2>;
>  		led-cur = /bits/ 8 <0x2f>;
>  		max-cur = /bits/ 8 <0x5f>;
>  	};
> @@ -70,59 +89,70 @@ ASEL1    ASEL0    Address
>   VEN      VEN       35h
>  
>  lp5523@32 {

s/lp5523/led-controller/

> +	#address-cells = <1>;
> +	#size-cells = <0>;
>  	compatible = "national,lp5523";
>  	reg = <0x32>;
>  	clock-mode = /bits/ 8 <1>;
>  
> -	chan0 {
> +	chan@0 {
> +		reg = <0>;
>  		chan-name = "d1";
>  		led-cur = /bits/ 8 <0x14>;
>  		max-cur = /bits/ 8 <0x20>;
>  	};
>  
> -	chan1 {
> +	chan@1 {
> +		reg = <1>;
>  		chan-name = "d2";
>  		led-cur = /bits/ 8 <0x14>;
>  		max-cur = /bits/ 8 <0x20>;
>  	};
>  
> -	chan2 {
> +	chan@2 {
> +		reg = <2>;
>  		chan-name = "d3";
>  		led-cur = /bits/ 8 <0x14>;
>  		max-cur = /bits/ 8 <0x20>;
>  	};
>  
> -	chan3 {
> +	chan@3 {
> +		reg = <3>;
>  		chan-name = "d4";
>  		led-cur = /bits/ 8 <0x14>;
>  		max-cur = /bits/ 8 <0x20>;
>  	};
>  
> -	chan4 {
> +	chan@4 {
> +		reg = <4>;
>  		chan-name = "d5";
>  		led-cur = /bits/ 8 <0x14>;
>  		max-cur = /bits/ 8 <0x20>;
>  	};
>  
> -	chan5 {
> +	chan@5 {
> +		reg = <5>;
>  		chan-name = "d6";
>  		led-cur = /bits/ 8 <0x14>;
>  		max-cur = /bits/ 8 <0x20>;
>  	};
>  
> -	chan6 {
> +	chan@6 {
> +		reg = <6>;
>  		chan-name = "d7";
>  		led-cur = /bits/ 8 <0x14>;
>  		max-cur = /bits/ 8 <0x20>;
>  	};
>  
> -	chan7 {
> +	chan@7 {
> +		reg = <7>;
>  		chan-name = "d8";
>  		led-cur = /bits/ 8 <0x14>;
>  		max-cur = /bits/ 8 <0x20>;
>  	};
>  
> -	chan8 {
> +	chan@8 {
> +		reg = <8>;
>  		chan-name = "d9";
>  		led-cur = /bits/ 8 <0x14>;
>  		max-cur = /bits/ 8 <0x20>;
> @@ -133,29 +163,35 @@ example 3) LP5562
>  4 channels are defined.
>  
>  lp5562@30 {

s/lp5562/led-controller/

> +	#address-cells = <1>;
> +	#size-cells = <0>;
>  	compatible = "ti,lp5562";
>  	reg = <0x30>;
>  	clock-mode = /bits/8 <2>;
>  
> -	chan0 {
> +	chan@0 {
> +		reg = <0>;
>  		chan-name = "R";
>  		led-cur = /bits/ 8 <0x20>;
>  		max-cur = /bits/ 8 <0x60>;
>  	};
>  
> -	chan1 {
> +	chan@1 {
> +		reg = <1>;
>  		chan-name = "G";
>  		led-cur = /bits/ 8 <0x20>;
>  		max-cur = /bits/ 8 <0x60>;
>  	};
>  
> -	chan2 {
> +	chan@2 {
> +		reg = <2>;
>  		chan-name = "B";
>  		led-cur = /bits/ 8 <0x20>;
>  		max-cur = /bits/ 8 <0x60>;
>  	};
>  
> -	chan3 {
> +	chan@3 {
> +		reg = <3>;
>  		chan-name = "W";
>  		led-cur = /bits/ 8 <0x20>;
>  		max-cur = /bits/ 8 <0x60>;
> @@ -167,62 +203,125 @@ example 4) LP8501
>  Others are same as LP5523.
>  
>  lp8501@32 {

s/lp8501/led-controller/

> +	#address-cells = <1>;
> +	#size-cells = <0>;
>  	compatible = "ti,lp8501";
>  	reg = <0x32>;
>  	clock-mode = /bits/ 8 <2>;
>  	pwr-sel = /bits/ 8 <3>;	/* D1~9 connected to VOUT */
>  
> -	chan0 {
> +	chan@0 {
> +		reg = <0>;
>  		chan-name = "d1";
>  		led-cur = /bits/ 8 <0x14>;
>  		max-cur = /bits/ 8 <0x20>;
>  	};
>  
> -	chan1 {
> +	chan@1 {
> +		reg = <1>;
>  		chan-name = "d2";
>  		led-cur = /bits/ 8 <0x14>;
>  		max-cur = /bits/ 8 <0x20>;
>  	};
>  
> -	chan2 {
> +	chan@2 {
> +		reg = <2>;
>  		chan-name = "d3";
>  		led-cur = /bits/ 8 <0x14>;
>  		max-cur = /bits/ 8 <0x20>;
>  	};
>  
> -	chan3 {
> +	chan@3 {
> +		reg = <3>;
>  		chan-name = "d4";
>  		led-cur = /bits/ 8 <0x14>;
>  		max-cur = /bits/ 8 <0x20>;
>  	};
>  
> -	chan4 {
> +	chan@4 {
> +		reg = <4>;
>  		chan-name = "d5";
>  		led-cur = /bits/ 8 <0x14>;
>  		max-cur = /bits/ 8 <0x20>;
>  	};
>  
> -	chan5 {
> +	chan@5 {
> +		reg = <5>;
>  		chan-name = "d6";
>  		led-cur = /bits/ 8 <0x14>;
>  		max-cur = /bits/ 8 <0x20>;
>  	};
>  
> -	chan6 {
> +	chan@6 {
> +		reg = <6>;
>  		chan-name = "d7";
>  		led-cur = /bits/ 8 <0x14>;
>  		max-cur = /bits/ 8 <0x20>;
>  	};
>  
> -	chan7 {
> +	chan@7 {
> +		reg = <7>;
>  		chan-name = "d8";
>  		led-cur = /bits/ 8 <0x14>;
>  		max-cur = /bits/ 8 <0x20>;
>  	};
>  
> -	chan8 {
> +	chan@8 {
> +		reg = <8>;
>  		chan-name = "d9";
>  		led-cur = /bits/ 8 <0x14>;
>  		max-cur = /bits/ 8 <0x20>;
>  	};
>  };
> +
> +Multicolor Framework Support
> +In addition to the nodes and properties defined above for device support the
> +properties below are needed for multicolor framework support as defined in
> +Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
> +
> +Required child properties for multicolor framework
> +	- color : Must be LED_COLOR_ID_MULTI
> +	- function : see Documentation/devicetree/bindings/leds/common.txt
> +
> +Required grandchildren properties
> +	- reg : This is the LED output of the device
> +	- color : see Documentation/devicetree/bindings/leds/common.txt
> +
> +Multicolor LED example:
> +lp5523: lp5523@32 {

Do you really need "lp5523:" node label ?

Besides:

s/lp5523@32/led-controller@32/

> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	compatible = "national,lp5523";
> +	reg = <0x32>;
> +	clock-mode = /bits/ 8 <0>; /* LP55XX_CLOCK_AUTO */
> +
> +	multi-led@2 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <2>;
> +		color = <LED_COLOR_ID_MULTI>;
> +		function = LED_FUNCTION_STANDBY;
> +		linux,default-trigger = "heartbeat";
> +
> +		led@0 {
> +			led-cur = /bits/ 8 <50>;
> +			max-cur = /bits/ 8 <100>;
> +			reg = <0x0>;
> +			color = <LED_COLOR_ID_GREEN>;
> +		};
> +
> +		led@1 {
> +			led-cur = /bits/ 8 <50>;
> +			max-cur = /bits/ 8 <100>;
> +			reg = <0x1>;
> +			color = <LED_COLOR_ID_BLUE>;
> +		};
> +
> +		led@6 {
> +			led-cur = /bits/ 8 <50>;
> +			max-cur = /bits/ 8 <100>;
> +			reg = <0x6>;
> +			color = <LED_COLOR_ID_RED>;
> +		};
> +	};
> +};
> 

-- 
Best regards,
Jacek Anaszewski
