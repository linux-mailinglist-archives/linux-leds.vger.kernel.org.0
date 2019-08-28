Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77C00A0B19
	for <lists+linux-leds@lfdr.de>; Wed, 28 Aug 2019 22:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726687AbfH1UJU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 28 Aug 2019 16:09:20 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:38728 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726663AbfH1UJU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 28 Aug 2019 16:09:20 -0400
Received: by mail-wr1-f67.google.com with SMTP id e16so1061934wro.5;
        Wed, 28 Aug 2019 13:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tKEaTUZEAYl5DlrWPO5ct5BclLqumjFbmjuxJBmq1hU=;
        b=g40YxbETJAmrRlb2nbSFLWPFSdyzJJLeQ/bU1JD21B6CVShmmvj68gTg8XlmdeZFq/
         6cegNMmiV3BfAPR02Zk9wieYqRFMfRWb9v7DoNWwUoLRWKpnueHI/3HNux2w3+Yl/+vy
         i9nINTvC2K2uVaMAwjVmDQkLu77mfAuwU1jyixysxcuMARhJHTYDt8WGh4qUk11l5OF7
         pC/7NVRgYkkL68zFh+zghS0SsdcY5ZwUd1l6gYchhfeGd//AxeomiXahUuiw6YD1vcjo
         7pPIc6bbTAjuBXvTMuc8t7vR6Et3DzHISKtcALpFsQmRqptC/WpZ9QhAXvrNl/nLJhqu
         PqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=tKEaTUZEAYl5DlrWPO5ct5BclLqumjFbmjuxJBmq1hU=;
        b=dYoML2ZdizdGOuiKXOTRFypIWAjZF36bPjje9tmTYJI6bGFOtb0y6rwvoKn42nrF7x
         ReBUxDswLhndnFR96zIE8Ve/a/eU5PgXgEOVJPJDpfLW+q/bjdLE6pYdbdzXsntGkHNH
         VyIrGE2wko5W+RmrNcMKN8tnR+m2OuVDJvOTVTuifsb+Zwe7cQnagDIeEspJZ/BrwX1G
         LyNXibyDoNpaGWRskAVqvxVaKGE+zpzlLryXVFjRPkqPXhqH4M5n4hQr1P+h94HSFQ4z
         +sdTVX0JfKYVGqx7LG6pBpzsIDnNB8Z2S1d0OOzTG+XVLcAgxiLpPlXhudEhJBmm+p16
         XgZQ==
X-Gm-Message-State: APjAAAU3ZmSiTNzklc3w7prdTFl5ZtOtCU2X85qZM4aBwa9QpVPYWsBj
        uY3dLG5Gdh4uwgGpFJDviYd9M5yo
X-Google-Smtp-Source: APXvYqy8OiwwUBMFC1xDdigGJ88rF5unEZ28rR6wAf2vDokAZRQwArOqEYNMAx03zDSLGIBccDAZaw==
X-Received: by 2002:adf:a491:: with SMTP id g17mr3305729wrb.327.1567022956901;
        Wed, 28 Aug 2019 13:09:16 -0700 (PDT)
Received: from [192.168.1.19] (chg13.neoplus.adsl.tpnet.pl. [83.31.4.13])
        by smtp.gmail.com with ESMTPSA id x6sm743565wmf.6.2019.08.28.13.09.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Aug 2019 13:09:16 -0700 (PDT)
Subject: Re: [PATCH] leds: lm3532: Avoid potentially unpaired regulator calls
To:     Tony Lindgren <tony@atomide.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190827215205.59677-1-tony@atomide.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 mQINBFWjfaEBEADd66EQbd6yd8YjG0kbEDT2QIkx8C7BqMXR8AdmA1OMApbfSvEZFT1D/ECR
 eWFBS8XtApKQx1xAs1j5z70k3zebk2eeNs5ahxi6vM4Qh89vBM46biSKeeX5fLcv7asmGb/a
 FnHPAfQaKFyG/Bj9V+//ef67hpjJWR3s74C6LZCFLcbZM0z/wTH+baA5Jwcnqr4h/ygosvhP
 X3gkRzJLSFYekmEv+WHieeKXLrJdsUPUvPJTZtvi3ELUxHNOZwX2oRJStWpmL2QGMwPokRNQ
 29GvnueQdQrIl2ylhul6TSrClMrKZqOajDFng7TLgvNfyVZE8WQwmrkTrdzBLfu3kScjE14Q
 Volq8OtQpTsw5570D4plVKh2ahlhrwXdneSot0STk9Dh1grEB/Jfw8dknvqkdjALUrrM45eF
 FM4FSMxIlNV8WxueHDss9vXRbCUxzGw37Ck9JWYo0EpcpcvwPf33yntYCbnt+RQRjv7vy3w5
 osVwRR4hpbL/fWt1AnZ+RvbP4kYSptOCPQ+Pp1tCw16BOaPjtlqSTcrlD2fo2IbaB5D21SUa
 IsdZ/XkD+V2S9jCrN1yyK2iKgxtDoUkWiqlfRgH2Ep1tZtb4NLF/S0oCr7rNLO7WbqLZQh1q
 ShfZR16h7YW//1/NFwnyCVaG1CP/L/io719dPWgEd/sVSKT2TwARAQABtC1KYWNlayBBbmFz
 emV3c2tpIDxqYWNlay5hbmFzemV3c2tpQGdtYWlsLmNvbT6JAlgEEwEIAEICGwMHCwkIBwMC
 AQYVCAIJCgsDFgIBAh4BAheABQkJZgNMFiEEvx38ClaPBfeVdXCQvWpQHLeLfCYFAl05/9sC
 GQEACgkQvWpQHLeLfCarMQ/9FN/WqJdN2tf6xkP0RFyS4ft0sT04zkOCFfOMxs8mZ+KZoMU+
 X3a+fEppDL7xgRFpHyGaEel7lSi1eqtzsqZ5JiHbDS1Ht1G8TtATb8q8id68qeSeW2mfzaLQ
 98NPELGfUXFoUqUQkG5z2p92UrGF4Muj1vOIW93pwvE4uDpNsl+jriwHomLtjIUoZtIRjGfZ
 RCyUQI0vi5LYzXCebuzAjGD7Jh2YAp7fDGrv3qTq8sX+DUJ4H/+I8PiL+jXKkEeppqIhlBJJ
 l4WcgggMu3c2uljYDuqRYghte33BXyCPAocfO2/sN+yJRUTVuRFlOxUk4srz/W8SQDwOAwtK
 V7TzdyF1/jOGBxWwS13EjMb4u3XwPMzcPlEQNdIqz76NFmJ99xYEvgkAmFmRioxuBTRv8Fs1
 c1jQ00WWJ5vezqY6lccdDroPalXWeFzfPjIhKbV3LAYTlqv0It75GW9+0TBhPqdTM15DrCVX
 B7Ues7UnD5FBtWwewTnwr+cu8te449VDMzN2I+a9YKJ1s6uZmzh5HnuKn6tAfGyQh8MujSOM
 lZrNHrRsIsLXOjeGVa84Qk/watEcOoyQ7d+YaVosU0OCZl0GldvbGp1z2u8cd2N/HJ7dAgFh
 Q7dtGXmdXpt2WKQvTvQXhIrCWVQErNYbDZDD2V0TZtlPBaZP4fkUDkvH+Sy5Ag0EVaN9oQEQ
 AMPNymBNoCWc13U6qOztXrIKBVsLGZXq/yOaR2n7gFbFACD0TU7XuH2UcnwvNR+uQFwSrRqa
 EczX2V6iIy2CITXKg5Yvg12yn09gTmafuoIyKoU16XvC3aZQQ2Bn3LO2sRP0j/NuMD9GlO37
 pHCVRpI2DPxFE39TMm1PLbHnDG8+lZql+dpNwWw8dDaRgyXx2Le542CcTBT52VCeeWDtqd2M
 wOr4LioYlfGfAqmwcwucBdTEBUxklQaOR3VbJQx6ntI2oDOBlNGvjnVDzZe+iREd5l40l+Oj
 TaiWvBGXkv6OI+wx5TFPp+BM6ATU+6UzFRTUWbj+LqVA/JMqYHQp04Y4H5GtjbHCa8abRvBw
 IKEvpwTyWZlfXPtp8gRlNmxYn6gQlTyEZAWodXwE7CE+KxNnq7bPHeLvrSn8bLNK682PoTGr
 0Y00bguYLfyvEwuDYek1/h9YSXtHaCR3CEj4LU1B561G1j7FVaeYbX9bKBAoy/GxAW8J5O1n
 mmw7FnkSHuwO/QDe0COoO0QZ620Cf9IBWYHW4m2M2yh5981lUaiMcNM2kPgsJFYloFo2XGn6
 lWU9BrWjEoNDhHZtF+yaPEuwjZo6x/3E2Tu3E5Jj0VpVcE9U1Zq/fquDY79l2RJn5ENogOs5
 +Pi0GjVpEYQVWfm0PTCxNPOzOzGR4QB3BNFvABEBAAGJAiUEGAEIAA8FAlWjfaECGwwFCQlm
 AYAACgkQvWpQHLeLfCZqGxAAlWBWVvjU6xj70GwengiqYZwmW1i8gfS4TNibQT/KRq0zkBnE
 wgKwXRbVoW38pYVuGa5x/JDQMJDrLAJ0wrCOS3XxbSHCWOl/k2ZD9OaxUeXq6N+OmGTzfrYv
 PUvWS1Hy04q9AD1dIaMNruZQmvnRfkOk2UDncDIg0166/NTHiYI09H5mpWGpHn/2aT6dmpVw
 uoM9/rHlF5s5qAAo95tZ0QW2BtIceG9/rbYlL57waSMPF49awvwLQX5RhWoF8mPS5LsBrXXK
 hmizIsn40tLbi2RtWjzDWgZYitqmmqijeCnDvISN4qJ/nCLO4DjiSGs59w5HR+l0nwePDhOC
 A4RYZqS1e2Clx1VSkDXFpL3egabcIsqK7CZ6a21r8lXVpo4RnMlQsmXZTnRx4SajFvX7PrRg
 /02C811fLfh2r5O5if8sKQ6BKKlHpuuioqfj/w9z3B0aQ71e4n1zNJBO1kcdznikPLAbr7jG
 gkBUXT1yJiwpTfRQr5y2Uo12IJsKxohnNFVYtK8X/R6S0deKPjrZWvAkllgIPcHjMi2Va8yw
 KTj/JgcpUO5KN906Pf7ywZISe7Kbcc/qnE0YjPPSqFOvoeZvHe6EZCMW9+xZsaipvlqpByQV
 UHnVg09K9YFvjUBsBPdC8ef6YwgfR9o6AnPmxl0oMUIXkCCC5c99fzJY/k+JAq0EGAEIACAW
 IQS/HfwKVo8F95V1cJC9alAct4t8JgUCWwqKhgIbAgCBCRC9alAct4t8JnYgBBkWCAAdFiEE
 FMMcSshOZf56bfAEYhBsURv0pdsFAlsKioYACgkQYhBsURv0pdvELgD/U+y3/hsz0bIjMQJY
 0LLxM/rFY9Vz1L43+lQHXjL3MPsA/1lNm5sailsY7aFBVJxAzTa8ZAGWBdVaGo6KCvimDB8G
 7joP/jx+oGOmdRogs7mG//H+w9DTnBfPpnfkeiiokGYo/+huWO5V0Ac9tTqZeFc//t/YuYJn
 wWvS0Rx+KL0fT3eh9BQo47uF4yDiZIiWLNh4Agpup1MUSVsz4MjD0lW6ghtnLcGlIgoVHW0v
 tPW1m9jATYyJSOG/MC1iDrcYcp9uVYn5tKfkEeQNspuG6iSfS0q3tajPKnT1nJxMTxVOD2RW
 EIGfaV9Scrou92VD/eC+/8INRsiWS93j3hOKIAV5XRNINFqtzkagPYAP8r6wksjSjh01fSTB
 p5zxjfsIwWDDzDrqgzwv83CvrLXRV3OlG1DNUDYA52qJr47paH5QMWmHW5TNuoBX8qb6RW/H
 M3DzPgT+l+r1pPjMPfvL1t7civZUoPuNzoyFpQRj6TvWi2bGGMQKryeYksXG2zi2+avMFnLe
 lOxGdUZ7jn1SJ6Abba5WL3VrXCP+TUE6bZLgfw8kYa8QSXP3ysyeMI0topHFntBZ8a0KXBNs
 qqFCBWmTHXfwsfW0VgBmRtPO7eXVBybjJ1VXKR2RZxwSq/GoNXh/yrRXQxbcpZ+QP3/Tttsb
 FdKciZ4u3ts+5UwYra0BRuvb51RiZR2wRNnUeBnXWagJVTlG7RHBO/2jJOE6wrcdCMjs0Iiw
 PNWmiVoZA930TvHA5UeGENxdGqo2MvMdRJ54YaIR
Message-ID: <75c6095c-01a0-3a87-acab-d522225f259b@gmail.com>
Date:   Wed, 28 Aug 2019 22:09:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190827215205.59677-1-tony@atomide.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Tony,

Thank you for the patch.

On 8/27/19 11:52 PM, Tony Lindgren wrote:
> We may currently get unpaired regulator calls when configuring the LED
> brightness via sysfs in case of regulator calls producing errors. Let's
> fix this by maintaining local state for enabled.
> 
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/leds/leds-lm3532.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
> --- a/drivers/leds/leds-lm3532.c
> +++ b/drivers/leds/leds-lm3532.c
> @@ -127,6 +127,7 @@ struct lm3532_als_data {
>   * @num_leds - Number of LED strings are supported in this array
>   * @full_scale_current - The full-scale current setting for the current sink.
>   * @led_strings - The LED strings supported in this array
> + * @enabled - Enabled status
>   * @label - LED label
>   */
>  struct lm3532_led {
> @@ -138,6 +139,7 @@ struct lm3532_led {
>  	int ctrl_brt_pointer;
>  	int num_leds;
>  	int full_scale_current;
> +	int enabled:1;
>  	u32 led_strings[LM3532_MAX_CONTROL_BANKS];
>  	char label[LED_MAX_NAME_SIZE];
>  };
> @@ -292,11 +294,15 @@ static int lm3532_get_ramp_index(int ramp_time)
>  				ramp_time);
>  }
>  
> +/* Caller must take care of locking */
>  static int lm3532_led_enable(struct lm3532_led *led_data)
>  {
>  	int ctrl_en_val = BIT(led_data->control_bank);
>  	int ret;
>  
> +	if (led_data->enabled)
> +		return 0;
> +
>  	ret = regmap_update_bits(led_data->priv->regmap, LM3532_REG_ENABLE,
>  					 ctrl_en_val, ctrl_en_val);
>  	if (ret) {
> @@ -304,14 +310,24 @@ static int lm3532_led_enable(struct lm3532_led *led_data)
>  		return ret;
>  	}
>  
> -	return regulator_enable(led_data->priv->regulator);
> +	ret = regulator_enable(led_data->priv->regulator);
> +	if (ret < 0)
> +		return ret;
> +
> +	led_data->enabled = 1;
> +
> +	return 0;
>  }
>  
> +/* Caller must take care of locking */
>  static int lm3532_led_disable(struct lm3532_led *led_data)
>  {
>  	int ctrl_en_val = BIT(led_data->control_bank);
>  	int ret;
>  
> +	if (!led_data->enabled)
> +		return 0;
> +
>  	ret = regmap_update_bits(led_data->priv->regmap, LM3532_REG_ENABLE,
>  					 ctrl_en_val, 0);
>  	if (ret) {
> @@ -319,7 +335,13 @@ static int lm3532_led_disable(struct lm3532_led *led_data)
>  		return ret;
>  	}
>  
> -	return regulator_disable(led_data->priv->regulator);
> +	ret = regulator_disable(led_data->priv->regulator);
> +	if (ret < 0)
> +		return ret;
> +
> +	led_data->enabled = 0;
> +
> +	return 0;
>  }
>  
>  static int lm3532_brightness_set(struct led_classdev *led_cdev,
> 

Applied.

-- 
Best regards,
Jacek Anaszewski
