Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 896F712035B
	for <lists+linux-leds@lfdr.de>; Mon, 16 Dec 2019 12:10:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727566AbfLPLJm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 16 Dec 2019 06:09:42 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36110 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727560AbfLPLJl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 16 Dec 2019 06:09:41 -0500
Received: by mail-wr1-f67.google.com with SMTP id z3so6733209wru.3
        for <linux-leds@vger.kernel.org>; Mon, 16 Dec 2019 03:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=GSwxZqA1p+v3fIchljXoOSOPXRU+x5PdBqx4Li7pnc8=;
        b=izo3SXymVRSx/zAI+IcDTMigV+sq6Wd7JcYeHw99As5psoxVLMP2hcsI3tHbJwGtRI
         C1sl5Vl4ZnUr/g4Lri6/L0G1Ju0FJSX8nD9LjZuQRdgrzwHoo/Ut2Td8QUfkMcUybSdX
         NU7xZlV9yhVGfht/rPWB1BHz+9UV7SQQjY1Ga+C/cD+lxck8sXdO/Ghs0/6CDX5tWdei
         1nHfn4kprePHhxmwL34DXxU9LdEfN7tSGZv3N8yDY+TjCtFJT8NUDa7V4xnZdL2vZK4K
         NrCEHpLB2JVYhVXCTfpGgDw0iZcMyU/Vde4HcItkAUyqkTZSA0oax2At8u69pqDaw+Ss
         nk6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=GSwxZqA1p+v3fIchljXoOSOPXRU+x5PdBqx4Li7pnc8=;
        b=NpgJqGKGiJQQpSoMg9x0sPZ3WTkrZOxoi+a6O76GabfYVIikamOeNl+DxUgDCh68Dd
         ekDzctbiKL5CE6St8eoekOqjM8FfKmnFcYLnQ271NfJLdy02dmdgjuV0OXZ90GfC7Ahz
         G9BB5xRm/iODva2lLTufon/2uncSch9iCXtxMiFnCrabUTpy5C4PyN6mjDHXERum3GYW
         IUj7IryEgzugTa0zv6JWIAvVq/skxgN2gIug/e3a4OoYsH23mPH1wqbI9Cng3dX7JxrL
         dPguAL1wCUdMKXWNQK1bHqlM21KB+J+QcZml8PXzSk4/z2O7jH7ujuPInCc5plQ+3HmA
         7EvA==
X-Gm-Message-State: APjAAAUcdSELEZaNrsCkSu/NaLfJJIVHX4ZTxVsgP77Vwtou87QGQJ01
        Me6vIUtkEluSiO/WNm02DwxKVA==
X-Google-Smtp-Source: APXvYqzqbT4cHx/a6uUClyqUgv58zyyf1LeRoaH/ossUkpuxVMrtMTrwQ8kwz8ldw4PfghfhWvf7Iw==
X-Received: by 2002:a5d:49c7:: with SMTP id t7mr28690138wrs.369.1576494579832;
        Mon, 16 Dec 2019 03:09:39 -0800 (PST)
Received: from dell ([2.27.35.132])
        by smtp.gmail.com with ESMTPSA id l3sm21080860wrt.29.2019.12.16.03.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 03:09:39 -0800 (PST)
Date:   Mon, 16 Dec 2019 11:09:39 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Sven Van Asbroeck <thesven73@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Linus Walleij <linus.walleij@linaro.org>,
        Grigoryev Denis <grigoryev@fastwel.ru>,
        Axel Lin <axel.lin@ingics.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v5 2/2] dt-bindings: mfd: update TI tps6105x chip bindings
Message-ID: <20191216110939.GJ3601@dell>
References: <20191209140234.6558-1-TheSven73@gmail.com>
 <20191209140234.6558-3-TheSven73@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191209140234.6558-3-TheSven73@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 09 Dec 2019, Sven Van Asbroeck wrote:

> The driver has been extended to optionally get its operational
> mode, regulator init data and LED naming from the devicetree.
> 
> Tree: next-20191118

Please refrain from putting this in the commit message.

> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Sven Van Asbroeck <TheSven73@gmail.com>
> ---

... if you really want to put that in, place it here, so it doesn't
become part of the kernel's Git history.

>  .../devicetree/bindings/mfd/tps6105x.txt      | 47 ++++++++++++++++++-
>  1 file changed, 46 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/tps6105x.txt b/Documentation/devicetree/bindings/mfd/tps6105x.txt
> index 93602c7a19c8..d15763740a3f 100644
> --- a/Documentation/devicetree/bindings/mfd/tps6105x.txt
> +++ b/Documentation/devicetree/bindings/mfd/tps6105x.txt
> @@ -7,11 +7,56 @@ Required properties:
>  - compatible:		"ti,tps61050" or "ti,tps61052"
>  - reg:			Specifies the I2C slave address
>  
> -Example:
> +Optional sub-node:
> +
> +This subnode selects the chip's operational mode.
> +There can be at most one single available subnode.
> +
> +- regulator: presence of this sub-node puts the chip in regulator mode.
> +	see Documentation/devicetree/bindings/regulator/regulator.txt

Relative paths are preferred.

> +- led: presence of this sub-node puts the chip in led mode.
> +	Optional properties:
> +	- function : see ../leds/common.txt
> +	- color    : see ../leds/common.txt
> +	- label    : see ../leds/common.txt

Yes, like this.

> +			(deprecated)
> +
> +Example (GPIO operation only):
> +
> +i2c0 {
> +	tps61052@33 {
> +		compatible = "ti,tps61052";
> +		reg = <0x33>;
> +	};
> +};
> +
> +Example (GPIO + regulator operation):
>  
>  i2c0 {
>  	tps61052@33 {
>  		compatible = "ti,tps61052";
>  		reg = <0x33>;
> +
> +		regulator {
> +			regulator-min-microvolt = <5000000>;
> +			regulator-max-microvolt = <5000000>;
> +			regulator-always-on;
> +		};
> +	};
> +};
> +
> +Example (GPIO + led operation):
> +
> +#include <dt-bindings/leds/common.h>
> +
> +i2c0 {
> +	tps61052@33 {
> +		compatible = "ti,tps61052";
> +		reg = <0x33>;
> +
> +		led {
> +			color = <LED_COLOR_ID_WHITE>;
> +		};
>  	};
>  };

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
