Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C828917E8D1
	for <lists+linux-leds@lfdr.de>; Mon,  9 Mar 2020 20:44:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726439AbgCITml (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 9 Mar 2020 15:42:41 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42832 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725992AbgCITmk (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 9 Mar 2020 15:42:40 -0400
Received: by mail-wr1-f68.google.com with SMTP id v11so12727996wrm.9;
        Mon, 09 Mar 2020 12:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7+b61sulzi+7E91s4SaJU4trzsAdvFnv+NCrRhgAWg4=;
        b=Yg8kBtkvD7ndhb7AL8h//8RX7thuMGe74q/BhseHqJSMVACI2RUpZqg4lCnHEjEMlz
         mHgLGMbW+5bRwc/aY2drbq++oKn+B9FhwFCQm828AKrAK+uw2UVG+rtU9hKrqJR5RUF2
         4QDot+Hj+CFYDA/FVc+VDojqoX2PSNAdq0w6rdJxM7MIK8UJYPm+BHvXt5autVmzhpIe
         Yh1RCdmghnvw1Y11cwrF+AjVT7xFfx5eg7ViTe9avCX/LhFdJy5yeN3Ux2CTMIciiDcI
         iixZsrANKctZWSv6slXMy/UM01GXsNIjSCc0tW1wg7N2KvbX66Vi3cX0pzlygZDctVOm
         FEuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=7+b61sulzi+7E91s4SaJU4trzsAdvFnv+NCrRhgAWg4=;
        b=J4RS/ooYMk50SrvJEDSQArLpnmfNzU3d9di71le8CCBhmYmvIuP0BcPKUNeU5vgtFP
         90sdAceQ/2Y1gRDj228vUl2fsMf4OQwNNdkFoXoVeVPvo34Zkgqc39YuNEi1GWjTybDG
         Rq4Do9hg5c4Ng7tK1CboMd4vvPWUmd0uT504WP1N1vuoL0mWPft10RSmL+6B/y9inJ37
         5KP9gtee6LeXPEYGQFTbXA/lHkJrKZdmYp0AbbCV3Gy3a9Wn/qbdevEOQdxha+QQGpGf
         /HOPIhycvoV6UkasZfwN1mC1kuRwAvPImu6WFOk/DoY6MQd+BxImJvKsMZAtB6XpAPuj
         faHg==
X-Gm-Message-State: ANhLgQ0j2AaTu601zjAyKCqedwIUskrClFUl0D1dyLTxtzNk0RUqMl8H
        yJVOwabveAW/YaYv2xjBPmpSdyOM
X-Google-Smtp-Source: ADFU+vu2ezoHFxlxULdyKGupsM8clX10QmMDhW6o1yUy+RdmkSRwKPvIcWfIcTOa77NapTSQjYRYgw==
X-Received: by 2002:a5d:4902:: with SMTP id x2mr24009794wrq.301.1583782958135;
        Mon, 09 Mar 2020 12:42:38 -0700 (PDT)
Received: from [192.168.1.23] (affj84.neoplus.adsl.tpnet.pl. [95.49.139.84])
        by smtp.gmail.com with ESMTPSA id j205sm732333wma.42.2020.03.09.12.42.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2020 12:42:37 -0700 (PDT)
Subject: Re: [RFC PATCH] leds: pwm: add flag to start without PWM init
To:     Denis Osterland-Heim <denis.osterland@diehl.com>,
        "dmurphy@ti.com" <dmurphy@ti.com>, "pavel@ucw.cz" <pavel@ucw.cz>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20200309082218.13263-1-Denis.Osterland@diehl.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 xsFNBFWjfaEBEADd66EQbd6yd8YjG0kbEDT2QIkx8C7BqMXR8AdmA1OMApbfSvEZFT1D/ECR
 eWFBS8XtApKQx1xAs1j5z70k3zebk2eeNs5ahxi6vM4Qh89vBM46biSKeeX5fLcv7asmGb/a
 FnHPAfQaKFyG/Bj9V+//ef67hpjJWR3s74C6LZCFLcbZM0z/wTH+baA5Jwcnqr4h/ygosvhP
 X3gkRzJLSFYekmEv+WHieeKXLrJdsUPUvPJTZtvi3ELUxHNOZwX2oRJStWpmL2QGMwPokRNQ
 29GvnueQdQrIl2ylhul6TSrClMrKZqOajDFng7TLgvNfyVZE8WQwmrkTrdzBLfu3kScjE14Q
 Volq8OtQpTsw5570D4plVKh2ahlhrwXdneSot0STk9Dh1grEB/Jfw8dknvqkdjALUrrM45eF
 FM4FSMxIlNV8WxueHDss9vXRbCUxzGw37Ck9JWYo0EpcpcvwPf33yntYCbnt+RQRjv7vy3w5
 osVwRR4hpbL/fWt1AnZ+RvbP4kYSptOCPQ+Pp1tCw16BOaPjtlqSTcrlD2fo2IbaB5D21SUa
 IsdZ/XkD+V2S9jCrN1yyK2iKgxtDoUkWiqlfRgH2Ep1tZtb4NLF/S0oCr7rNLO7WbqLZQh1q
 ShfZR16h7YW//1/NFwnyCVaG1CP/L/io719dPWgEd/sVSKT2TwARAQABzS1KYWNlayBBbmFz
 emV3c2tpIDxqYWNlay5hbmFzemV3c2tpQGdtYWlsLmNvbT7Cwa8EEwEIAEICGwMHCwkIBwMC
 AQYVCAIJCgsDFgIBAh4BAheAAhkBFiEEvx38ClaPBfeVdXCQvWpQHLeLfCYFAl5O5twFCRIR
 arsAIQkQvWpQHLeLfCYWIQS/HfwKVo8F95V1cJC9alAct4t8JhIgEACtWz3zR5uxaU/GozHh
 iZfiyUTomQpGNvAtjjZE6UKO/cKusCcvOv0FZbfGDajcMIU8f3FUxJdybrY86KJ9a3tOddal
 KtB2of3/Ot/EIQjpQb28iLoY8AWnf9G4LQZtoXHiUcOAVPkKgCFnz1IENK3uvyCB9c9//KhE
 cRZkeAIE2sTmcI4k7/dNHpRI4nha/ZytPwTdM3BjAfxxQI5nMLptm1ksEBI7W1SDOnY3dG2J
 QWmqpxIefjgyiy0aU+jAw1x3RdZrokVD8OCJiJM8+Z36imarEzqIRQLh+sDNLfV3wEaBn/HU
 0Vj6VrRyW2K0jAYToRFD3Ay/eGSfOOAEr/LoMr3NBTDkRLEWdOozllOwADEY9wH0BLHMp2WI
 hXGOStNiroIEhW2/E0udFJo9b3VoOWKWl+zcUP/keLxVUCXhpmeS7VpSkqsrCVqTVkEc8AXq
 xhJXeIQJC/XRpCYFc3pFUlVCFViF1ZU2OzE8TndRzzD8e/9ETrJ1GAYa78tNopYhY6AbGlv4
 U01nIC93bK07O4IhtBAKsiUz3JPX/KA/dXJOC86qP373cVWVYPvZW+KOya9/7rz0MGR1az9G
 HqJB7q7DVcCQKt9Egae/goznnXbET6ivCNKbqkH3n/JpiPIxkaXVrbn3QlVtzYpROsS/pCOp
 5Evig7kql5L0aYJIZs4zBFsKioYWCSsGAQQB2kcPAQEHQFCKEG5pCgebryz66pTa9eAo+r8y
 TkMEEnG8UR5oWFt3wsIbBBgBCAAgFiEEvx38ClaPBfeVdXCQvWpQHLeLfCYFAlsKioYCGwIA
 rwkQvWpQHLeLfCaNIAQZFggAHRYhBBTDHErITmX+em3wBGIQbFEb9KXbBQJbCoqGACEJEGIQ
 bFEb9KXbFiEEFMMcSshOZf56bfAEYhBsURv0pdvELgD/U+y3/hsz0bIjMQJY0LLxM/rFY9Vz
 1L43+lQHXjL3MPsA/1lNm5sailsY7aFBVJxAzTa8ZAGWBdVaGo6KCvimDB8GFiEEvx38ClaP
 BfeVdXCQvWpQHLeLfCbuOg/+PH6gY6Z1GiCzuYb/8f7D0NOcF8+md+R6KKiQZij/6G5Y7lXQ
 Bz21Opl4Vz/+39i5gmfBa9LRHH4ovR9Pd6H0FCjju4XjIOJkiJYs2HgCCm6nUxRJWzPgyMPS
 VbqCG2ctwaUiChUdbS+09bWb2MBNjIlI4b8wLWIOtxhyn25Vifm0p+QR5A2ym4bqJJ9LSre1
 qM8qdPWcnExPFU4PZFYQgZ9pX1Jyui73ZUP94L7/wg1GyJZL3ePeE4ogBXldE0g0Wq3ORqA9
 gA/yvrCSyNKOHTV9JMGnnPGN+wjBYMPMOuqDPC/zcK+stdFXc6UbUM1QNgDnaomvjuloflAx
 aYdblM26gFfypvpFb8czcPM+BP6X6vWk+Mw9+8vW3tyK9lSg+43OjIWlBGPpO9aLZsYYxAqv
 J5iSxcbbOLb5q8wWct6U7EZ1RnuOfVInoBttrlYvdWtcI/5NQTptkuB/DyRhrxBJc/fKzJ4w
 jS2ikcWe0FnxrQpcE2yqoUIFaZMdd/Cx9bRWAGZG087t5dUHJuMnVVcpHZFnHBKr8ag1eH/K
 tFdDFtyln5A/f9O22xsV0pyJni7e2z7lTBitrQFG69vnVGJlHbBE2dR4GddZqAlVOUbtEcE7
 /aMk4TrCtx0IyOzQiLA81aaJWhkD3fRO8cDlR4YQ3F0aqjYy8x1EnnhhohHOwU0EVaN9oQEQ
 AMPNymBNoCWc13U6qOztXrIKBVsLGZXq/yOaR2n7gFbFACD0TU7XuH2UcnwvNR+uQFwSrRqa
 EczX2V6iIy2CITXKg5Yvg12yn09gTmafuoIyKoU16XvC3aZQQ2Bn3LO2sRP0j/NuMD9GlO37
 pHCVRpI2DPxFE39TMm1PLbHnDG8+lZql+dpNwWw8dDaRgyXx2Le542CcTBT52VCeeWDtqd2M
 wOr4LioYlfGfAqmwcwucBdTEBUxklQaOR3VbJQx6ntI2oDOBlNGvjnVDzZe+iREd5l40l+Oj
 TaiWvBGXkv6OI+wx5TFPp+BM6ATU+6UzFRTUWbj+LqVA/JMqYHQp04Y4H5GtjbHCa8abRvBw
 IKEvpwTyWZlfXPtp8gRlNmxYn6gQlTyEZAWodXwE7CE+KxNnq7bPHeLvrSn8bLNK682PoTGr
 0Y00bguYLfyvEwuDYek1/h9YSXtHaCR3CEj4LU1B561G1j7FVaeYbX9bKBAoy/GxAW8J5O1n
 mmw7FnkSHuwO/QDe0COoO0QZ620Cf9IBWYHW4m2M2yh5981lUaiMcNM2kPgsJFYloFo2XGn6
 lWU9BrWjEoNDhHZtF+yaPEuwjZo6x/3E2Tu3E5Jj0VpVcE9U1Zq/fquDY79l2RJn5ENogOs5
 +Pi0GjVpEYQVWfm0PTCxNPOzOzGR4QB3BNFvABEBAAHCwZMEGAEIACYCGwwWIQS/HfwKVo8F
 95V1cJC9alAct4t8JgUCXk7nGAUJEhFq9wAhCRC9alAct4t8JhYhBL8d/ApWjwX3lXVwkL1q
 UBy3i3wmVBwP/RNNux3dC513quZ0hFyU6ZDTxbiafprLN2PXhmLslxPktJgW/xO5xp16OXkW
 YgNI/TKxj3+oSu+MhEAhAFA2urFWHyqedfqdndQTzbv4yqNuyhGupzPBWNSqqJ2NwKJc9f2R
 wqYTXVYIO+6KLa32rpl7xvJISkx06s70lItFJjyOf6Hn1y5RBMwQN9hP2YxLhYNO3rmlNSVy
 7Z/r95lZTDnnUCuxBZxnjx/pMHJ8LZtKY0t7D0esA+zYGUrmoAGUpNWEBP+uSL+f8rhjSAL0
 HgoRL39ixg5Bm0MzJn9z3or++Pl5bRnSvHy6OKh7rzTjCwaGoZD+6LHBwPFPlmInX1H+yHrX
 lu1uPAdqG5xcsZAZFTxBRMEnYu1yYebDSA9x+iulggMZQcWC2GvHCaKIpKcFY8XCxk7Hbl5c
 8hcPKWOy16NLO6Y66Ws4kMedXuNUHe4zBLVlRbcYUdgT9Brw8nxmxu3KhEVsJkwOpXLUDuzo
 hQNfg9em95lpAK+VOTocke8PSESy3GbEtmoMueW3caSeDHb5dRP6WrndaYhEOzAA/KjuPU7J
 LMXOABOMIq+R38y7e2B3TnVDCrccdZDseFPUWmH0cGCGihH/j2UZG+PImrSDCh3h5MedVHGo
 sI62tmWm0q6lrljwSZmMZ30w1QaGmdFpI3Q6V+nZ7TZldI3x
Message-ID: <68c56b10-7ebb-2bb4-213f-400e3f99ac40@gmail.com>
Date:   Mon, 9 Mar 2020 20:42:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200309082218.13263-1-Denis.Osterland@diehl.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Denis,

There is already a property for that purpose: default-state = "keep";

Please just use it instead.

Best regards,
Jacek Anaszewski

On 3/9/20 9:24 AM, Denis Osterland-Heim wrote:
> This patch add "pwm,uninitalized" devicetree flag support to pwm
> leds, which allows to defer pwm init to first use of led.
> 
> This allows to configure the PWM early in bootloader to let the LED
> blink until an application in Linux userspace set something different.
> 
> Signed-off-by: Denis Osterland-Heim <Denis.Osterland@diehl.com>
> ---
> Hi,
> 
> I want to ask if such a patch is intresting for mainline and
> if it is woth to think about how to represent this state to user space.
> 
> Regards Denis
> 
>  Documentation/devicetree/bindings/leds/leds-pwm.txt |  1 +
>  drivers/leds/leds-pwm.c                             | 10 ++++++++--
>  include/linux/leds_pwm.h                            |  1 +
>  3 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-pwm.txt b/Documentation/devicetree/bindings/leds/leds-pwm.txt
> index 6c6583c35f2f..4f58df631fc9 100644
> --- a/Documentation/devicetree/bindings/leds/leds-pwm.txt
> +++ b/Documentation/devicetree/bindings/leds/leds-pwm.txt
> @@ -19,6 +19,7 @@ LED sub-node properties:
>    see Documentation/devicetree/bindings/leds/common.txt
>  - linux,default-trigger :  (optional)
>    see Documentation/devicetree/bindings/leds/common.txt
> +- pwm,uninitalized : defer PWM init to first brightness change of led
>  
>  Example:
>  
> diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
> index 8b6965a563e9..02c90f05602a 100644
> --- a/drivers/leds/leds-pwm.c
> +++ b/drivers/leds/leds-pwm.c
> @@ -97,7 +97,8 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
>  	 * FIXME: pwm_apply_args() should be removed when switching to the
>  	 * atomic PWM API.
>  	 */
> -	pwm_apply_args(led_data->pwm);
> +	if (!led->pwm_uninitialized)
> +		pwm_apply_args(led_data->pwm);
>  
>  	pwm_get_args(led_data->pwm, &pargs);
>  
> @@ -108,7 +109,9 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
>  	ret = devm_led_classdev_register(dev, &led_data->cdev);
>  	if (ret == 0) {
>  		priv->num_leds++;
> -		led_pwm_set(&led_data->cdev, led_data->cdev.brightness);
> +		if (!led->pwm_uninitialized)
> +			led_pwm_set(&led_data->cdev,
> +					led_data->cdev.brightness);
>  	} else {
>  		dev_err(dev, "failed to register PWM led for %s: %d\n",
>  			led->name, ret);
> @@ -143,6 +146,9 @@ static int led_pwm_create_fwnode(struct device *dev, struct led_pwm_priv *priv)
>  		fwnode_property_read_u32(fwnode, "max-brightness",
>  					 &led.max_brightness);
>  
> +		led.pwm_uninitialized = fwnode_property_read_bool(fwnode,
> +							"pwm,uninitialized");
> +
>  		ret = led_pwm_add(dev, priv, &led, fwnode);
>  		if (ret) {
>  			fwnode_handle_put(fwnode);
> diff --git a/include/linux/leds_pwm.h b/include/linux/leds_pwm.h
> index 93d101d28943..0b04dfd43654 100644
> --- a/include/linux/leds_pwm.h
> +++ b/include/linux/leds_pwm.h
> @@ -10,6 +10,7 @@ struct led_pwm {
>  	const char	*default_trigger;
>  	unsigned	pwm_id __deprecated;
>  	u8 		active_low;
> +	u8		pwm_uninitialized;
>  	unsigned 	max_brightness;
>  	unsigned	pwm_period_ns;
>  };
> 


