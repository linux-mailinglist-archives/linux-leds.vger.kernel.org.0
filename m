Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A431E1BE2DE
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2020 17:37:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726853AbgD2Phb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 29 Apr 2020 11:37:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726456AbgD2Pha (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 29 Apr 2020 11:37:30 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81CA7C03C1AD;
        Wed, 29 Apr 2020 08:37:28 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id e26so2531922wmk.5;
        Wed, 29 Apr 2020 08:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rlQ2CSVV6XANNoo1iZF8vKF1KcyKLoixPtiCb4LIRmU=;
        b=UzBVTnboUM1rw6sSV38W0WKxcXHMlyDVGxvSlM+eJKNTZeceQEoiV20qojzMEmljPz
         9S2TRJyT1FaSwi9l9G9Tv2lqDHvk8PGrzhNRT7M3+QDzqVWITFQzpOB+aRoEcVHk1+Zx
         bUQu4D/nMUJnNFX+LaStHa9gmtvkhdBMn1p4DQ89cbvBFPsz0gDFGIgsECZTIR5wQz9D
         iyaqBsyFYMWvVvjFcFXZFjV9p0RAmgF/lSkqFFH7n5do/kC/zmZOnjDZ0gaMnTHzkiNb
         cITdZ2TpLrcJUaR60kV0FV9Yfigj0/TJte1oCMebG84UdiqohIIuhqzkrcOgg9h/4DcP
         WJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rlQ2CSVV6XANNoo1iZF8vKF1KcyKLoixPtiCb4LIRmU=;
        b=Wg0gC3t+CzldSh6aJRFZZk9q1v71+aIz00d2/+ckvFZDP14xCNtnn3KStL1yi5nqUk
         T6EjgPeRSGXK0/gKxlYankID/hImk5MV9C8jMnSXn2GBA7OL8u0VjhprzkEG3TK711AP
         A3qW2+z/Pv13JUQSSYNHoz2AaqRugm1NCG4w52272upjBl3VpIuAZTGxKui0f44JVTN+
         MXdZ9OAgqm6R9InqzFVBP1mqIMHgh+WEF1Dg2qDslFuYod03R/WpFjwBy/1anQ83NBiE
         sHAWi+OZFubKmwqEweIZUF11SwNuvTX1IlFcalBPN7twRSiWGmSCljSt2ljgs5+HfEtn
         J+mQ==
X-Gm-Message-State: AGi0PuZMOpw5Ck7f6ziqCWsA6Kbxy8pnxXAl1gWFhKLgf+bC5MJPXOP1
        fSD8qrQAyQ0+p/QmHdnzGDw=
X-Google-Smtp-Source: APiQypIg8WaDaKeSC+d4Fk1TXb+PTmnDD/c+xUPJUF1So7oC4slxG/rIYm8O+NdsZmPI4F8Zqjf2zw==
X-Received: by 2002:a1c:ba56:: with SMTP id k83mr3825211wmf.1.1588174647248;
        Wed, 29 Apr 2020 08:37:27 -0700 (PDT)
Received: from [192.168.1.23] (afgd208.neoplus.adsl.tpnet.pl. [95.49.159.208])
        by smtp.gmail.com with ESMTPSA id k14sm31165910wrp.53.2020.04.29.08.37.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2020 08:37:26 -0700 (PDT)
Subject: Re: [PATCH v22 01/16] dt: bindings: Add multicolor class dt bindings
 documention
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
References: <20200429125631.7044-1-dmurphy@ti.com>
 <20200429125631.7044-2-dmurphy@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <769c19a1-4124-b674-5b03-6100f176768e@gmail.com>
Date:   Wed, 29 Apr 2020 17:37:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429125631.7044-2-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Dan,

Thanks for the conversion, but now the binding example is missing.
In Documentation/devicetree/bindings/leds/common.yaml we do have
examples.

Best regards,
Jacek Anaszewski

On 4/29/20 2:56 PM, Dan Murphy wrote:
> Add DT bindings for the LEDs multicolor class framework.
> Add multicolor ID to the color ID list for device tree bindings.
> 
> CC: Rob Herring <robh@kernel.org>
> Acked-by: Pavel Machek <pavel@ucw.cz>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>   .../bindings/leds/leds-class-multicolor.yaml  | 34 +++++++++++++++++++
>   drivers/leds/led-core.c                       |  1 +
>   include/dt-bindings/leds/common.h             |  3 +-
>   3 files changed, 37 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
> new file mode 100644
> index 000000000000..3d4f23d07440
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
> @@ -0,0 +1,34 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-class-multicolor.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Common properties for the multicolor LED class.
> +
> +maintainers:
> +  - Dan Murphy <dmurphy@ti.com>
> +
> +description: |
> +  Bindings for multi color LEDs show how to describe current outputs of
> +  either integrated multi-color LED elements (like RGB, RGBW, RGBWA-UV
> +  etc.) or standalone LEDs, to achieve logically grouped multi-color LED
> +  modules. This is achieved by adding multi-led nodes layer to the
> +  monochrome LED bindings.
> +  The nodes and properties defined in this document are unique to the multicolor
> +  LED class.  Common LED nodes and properties are inherited from the common.txt
> +  within this documentation directory.
> +
> +properties:
> +  color:
> +    description: |
> +      For multicolor LED support this property should be defined as
> +      LED_COLOR_ID_MULTI and further definition can be found in
> +      include/linux/leds/common.h.
> +
> +required:
> +  - color
> +
> +additionalProperties: false
> +
> +...
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index f1f718dbe0f8..846248a0693d 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -34,6 +34,7 @@ const char * const led_colors[LED_COLOR_ID_MAX] = {
>   	[LED_COLOR_ID_VIOLET] = "violet",
>   	[LED_COLOR_ID_YELLOW] = "yellow",
>   	[LED_COLOR_ID_IR] = "ir",
> +	[LED_COLOR_ID_MULTI] = "multicolor",
>   };
>   EXPORT_SYMBOL_GPL(led_colors);
>   
> diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
> index 0ce7dfc00dcb..a463ce6a8794 100644
> --- a/include/dt-bindings/leds/common.h
> +++ b/include/dt-bindings/leds/common.h
> @@ -30,7 +30,8 @@
>   #define LED_COLOR_ID_VIOLET	5
>   #define LED_COLOR_ID_YELLOW	6
>   #define LED_COLOR_ID_IR		7
> -#define LED_COLOR_ID_MAX	8
> +#define LED_COLOR_ID_MULTI	8
> +#define LED_COLOR_ID_MAX	9
>   
>   /* Standard LED functions */
>   /* Keyboard LEDs, usually it would be input4::capslock etc. */
> 

