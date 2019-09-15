Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69052B306A
	for <lists+linux-leds@lfdr.de>; Sun, 15 Sep 2019 16:01:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726247AbfIOOBs (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 15 Sep 2019 10:01:48 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43094 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726146AbfIOOBs (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 15 Sep 2019 10:01:48 -0400
Received: by mail-wr1-f67.google.com with SMTP id q17so31577132wrx.10;
        Sun, 15 Sep 2019 07:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pc5OYxx/OqGOCzCGhVi8QkjABEvV14GvKWnMQPL9wmI=;
        b=UNuCq27Ab3s1z3TJsB048/uxGO8RxZRq0DWK8K/nt2L9ri62RS2oFfwJNOBWoupMTh
         7kLg0AeudKHLPwj9YDMHOc8/yzPo86AmHw5jnjA5EEsJehWq4cUE20amcDz26gJw4gSb
         PWIpmscjVfIo5G0Afu36cBf/XQt1Ouldidzq4/8/2L9LSBUuCcPAdxuyizRL9e9QO+qd
         SbfRDjBKf9zdan/i2xqovFZftEdwcOJsG+k81PeyhCPt0CwURAzuu6ekHlmswpG1mVX+
         3dPmU0P55fNTJy1KUm7/HZOU3YM08qA5/G8cdVVbQ5bxiQrmenHIP0U8tCfacre+0VVN
         U+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=pc5OYxx/OqGOCzCGhVi8QkjABEvV14GvKWnMQPL9wmI=;
        b=qcygu3FD6Gbnbk0kEsboe71phMLTkMUv/1PSpd3IFD1JY8GrObfNxtWwnt7oPl8Ftg
         9JFZzKuTTAKCHVaT5tDByInUos1251Fic4+fDhyHCsOX1TWQv4+2kdMoq3E7tyvIO3pG
         G9+l9WVGNxluTHUTpf2VtFt57Aa6+/CQCyESa9Uit8PrBJ04hM34ypXv5euQ+6Agb7Vi
         npcwExk6xQfpCku46BixFoxBo0xeohPLRolaZ01svJGL8skasx+JZ55iO87LZHUJ8JUU
         W6Z8fA+Ho9za5m7OSHzqtHLbVD4JZ93NglpY7NE0agH+JBXEPbtyl5Kmlseu0Bt5DO15
         PVLA==
X-Gm-Message-State: APjAAAVyf3Vt+6knB1LfDQqwsJPZXP/fYAFxbMopC9zXz4YY0WMDRZpK
        QbqMO9/s2BYJs9VSFJ4x6oWHYuRP
X-Google-Smtp-Source: APXvYqwvyxCnc3Bkj1tGByyZclf7G0wjwNgFAsLQdSjqM7wfR4KWuuheyjg1VurBtd/curJxHCtQdw==
X-Received: by 2002:a05:6000:1c4:: with SMTP id t4mr5438428wrx.183.1568556105022;
        Sun, 15 Sep 2019 07:01:45 -0700 (PDT)
Received: from [192.168.1.19] (ckk130.neoplus.adsl.tpnet.pl. [83.31.86.130])
        by smtp.gmail.com with ESMTPSA id r20sm48039390wrg.61.2019.09.15.07.01.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 15 Sep 2019 07:01:44 -0700 (PDT)
Subject: Re: [PATCH v5 3/9] dt: bindings: Add multicolor class dt bindings
 documention
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     robh+dt@kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190911180115.21035-1-dmurphy@ti.com>
 <20190911180115.21035-4-dmurphy@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <e842eef7-094a-a7dd-bcf1-90ed41bf45cd@gmail.com>
Date:   Sun, 15 Sep 2019 16:01:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190911180115.21035-4-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

This patch has the same issues I mentioned in the v4 review [0].

On 9/11/19 8:01 PM, Dan Murphy wrote:
> Add DT bindings for the LEDs multicolor class framework.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  .../bindings/leds/leds-class-multicolor.txt   | 96 +++++++++++++++++++
>  1 file changed, 96 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt b/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
> new file mode 100644
> index 000000000000..5d36327b18fc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
> @@ -0,0 +1,96 @@
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
> +	multi-led@1 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <1>;
> +		color = <LED_COLOR_ID_MULTI>;
> +		function = LED_FUNCTION_;
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
> +	multi-led@4 {
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
> +};
> 

[0]
https://lore.kernel.org/linux-leds/684010e7-a47c-2bc8-2bf6-c632be31649b@gmail.com/

-- 
Best regards,
Jacek Anaszewski
