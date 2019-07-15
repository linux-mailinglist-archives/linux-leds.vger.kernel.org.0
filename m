Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8A2169D33
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jul 2019 23:02:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730258AbfGOVC0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 15 Jul 2019 17:02:26 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40120 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729640AbfGOVCZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 15 Jul 2019 17:02:25 -0400
Received: by mail-wm1-f67.google.com with SMTP id v19so16551072wmj.5
        for <linux-leds@vger.kernel.org>; Mon, 15 Jul 2019 14:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dHsXqOI3gug1EIxpL25nN7IJ29TVD/T8nji3vu8y6F0=;
        b=UFy9wv+5YcTbs+EEVMB6kScqrP5QtFVJDziwjR4kSlHMX9VvK/H0ea4EQGdWtr084F
         lvSy38HMazGgWghurrVFbIz23TaTdw7a0xMyuYLyOWZVVg1ZsBXRUkUQVTL4tv8ZrZek
         aL8riNfwlD4gBRtIZjqJcH2izFRTxDSVANC9i7HeGC0TtZA6qfGiXMzPedeN7ysoz7iM
         dkWtPdq+uyXOwG9LSz6kxczch3ewMIxK9JkVd65HItPB2J78ftZBTzPXgfXQ+TjSSzLz
         zUVJzDaFGmw35XhoCm2CzEJAlF+JK3jPrNCQcIHe7q9nEi2/dqI+cC79DbmfiQ35EoUj
         DJXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=dHsXqOI3gug1EIxpL25nN7IJ29TVD/T8nji3vu8y6F0=;
        b=oBvlLUC7QUOLAPUpctpWKkop+POwPcfiEgt+lFYubUPpAIKyijDl5wSzwQcoXhlYc6
         +Jgcfk0CWPwGZ+uvK0v0pKXwL20e+Q4L5wYdoWWhPTubhi3Ri4FXTNU/56eOzDFCtCz7
         kIqVgqVbEhoLPMzlzM2Y3aI2CfdvxhFYNr96FcL3lEw09pAaCVnU9qKZKOEu+VnsFe1D
         NF3i4Y2q3FMlFJdsxYWjR530DVWpWn6wg90JJ4/i1+1rqMvJSiXOhu80su9QJ0v73aSv
         fjZvRR2gqfGGku9oeBiy/WvC9iFfBbyInWdRAA8jqtZwCifTK2jtlkbZzbOiBW1ON+72
         bsGA==
X-Gm-Message-State: APjAAAX8HulRhalPif+kHv5IWNmZAye7lohJ+jL6lC1a5IddkRmH4paG
        COpYBlJEbVaac4bUZFjY+lEnb0Gl
X-Google-Smtp-Source: APXvYqwfBImdEMR0a/Y9Psm4krF4AlrwtIkmFAhiZB1qB61Yz0Yd0oY3Sh+CSxUrQRoNyvDPLvcClA==
X-Received: by 2002:a1c:228b:: with SMTP id i133mr26223210wmi.140.1563224542565;
        Mon, 15 Jul 2019 14:02:22 -0700 (PDT)
Received: from [192.168.1.19] (chk118.neoplus.adsl.tpnet.pl. [83.31.8.118])
        by smtp.gmail.com with ESMTPSA id u1sm17845263wml.14.2019.07.15.14.02.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Jul 2019 14:02:21 -0700 (PDT)
Subject: Re: [PATCH v3] leds: max77650: Add of_node_put() before return
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>,
        bgolaszewski@baylibre.com, pavel@ucw.cz, dmurphy@ti.com,
        linux-leds@vger.kernel.org
References: <20190711074402.12257-1-nishkadg.linux@gmail.com>
 <20190711075405.12634-1-nishkadg.linux@gmail.com>
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
 emV3c2tpIDxqYWNlay5hbmFzemV3c2tpQGdtYWlsLmNvbT6JAj4EEwEIACgCGwMHCwkIBwMC
 AQYVCAIJCgsDFgIBAh4BAheABQJVo39tBQkJZgNMAAoJEL1qUBy3i3wmxLQQAK8QEQ0JqZEv
 5hrxiwT+Qtkx1TULYriK9sYcY9zbi18YxbKB0C4Znh5iP5o7k26WnPGLM+w4qWvTAkHjuAI7
 aBrvb4nGRvE5s14PQ9IHgL7iL3zAAHT1azIZng9dUCCSontB+vQZu1x/Un0lVlVCvsvO7QVt
 hAZUlT3iucNMO0jpCiS3raZkNfab8M+JWP/iplaV0Kn+O7LX3A/RdLmx5ZhuT+zvyHwl2c3K
 T56UHaQnjkuHB2Ytk8HtOjNXGNYnm4nLx3ok3jEN1nWDRV/DeiPn8zz4Zebsp686OH9vvX/0
 R4dk2YEjUCY/S7CbJxXzUnLjboUAGmtTVOu/uJ7y11iS9XEoJ09HEzijQwWctJXLojcTXCFw
 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
 eGGiEQ==
Message-ID: <e0fe66bb-abba-8b6a-e21a-ebc308e51c5d@gmail.com>
Date:   Mon, 15 Jul 2019 23:02:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190711075405.12634-1-nishkadg.linux@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Nishka,

Thank you for the patch.

On 7/11/19 9:54 AM, Nishka Dasgupta wrote:
> Each iteration of for_each_child_of_node puts the previous node, but in
> the case of a return from the middle of the loop, there is no put, thus
> causing a memory leak.
> Hence create a new label, err_node_put, which puts the previous node and
> returns variable rv. Modify the mid-loop return statements to instead
> store the return value in rv and jump to err_node_put.
> Issue found with Coccinelle.
> 
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> ---
> Changes in v3:
> - Add change log.
> Changes in v2:
> - Change subject line to match previous patches on the same file.
> - Merge the of_node_put calls into a single call in a label at the end
>   of the function instead of calling it separately for each return
>   statement.
> 
>  drivers/leds/leds-max77650.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/leds/leds-max77650.c b/drivers/leds/leds-max77650.c
> index 6b74ce9cac12..1eb9998899e4 100644
> --- a/drivers/leds/leds-max77650.c
> +++ b/drivers/leds/leds-max77650.c
> @@ -93,8 +93,10 @@ static int max77650_led_probe(struct platform_device *pdev)
>  
>  	for_each_child_of_node(of_node, child) {
>  		rv = of_property_read_u32(child, "reg", &reg);
> -		if (rv || reg >= MAX77650_LED_NUM_LEDS)
> -			return -EINVAL;
> +		if (rv || reg >= MAX77650_LED_NUM_LEDS) {
> +			rv = -EINVAL;
> +			goto err_node_put;
> +		}
>  
>  		led = &leds[reg];
>  		led->map = map;
> @@ -109,8 +111,10 @@ static int max77650_led_probe(struct platform_device *pdev)
>  		} else {
>  			led->cdev.name = devm_kasprintf(dev, GFP_KERNEL,
>  							"max77650:%s", label);
> -			if (!led->cdev.name)
> -				return -ENOMEM;
> +			if (!led->cdev.name) {
> +				rv = -ENOMEM;
> +				goto err_node_put;
> +			}
>  		}
>  
>  		of_property_read_string(child, "linux,default-trigger",
> @@ -118,20 +122,23 @@ static int max77650_led_probe(struct platform_device *pdev)
>  
>  		rv = devm_of_led_classdev_register(dev, child, &led->cdev);
>  		if (rv)
> -			return rv;
> +			goto err_node_put;
>  
>  		rv = regmap_write(map, led->regA, MAX77650_LED_A_DEFAULT);
>  		if (rv)
> -			return rv;
> +			goto err_node_put;
>  
>  		rv = regmap_write(map, led->regB, MAX77650_LED_B_DEFAULT);
>  		if (rv)
> -			return rv;
> +			goto err_node_put;
>  	}
>  
>  	return regmap_write(map,
>  			    MAX77650_REG_CNFG_LED_TOP,
>  			    MAX77650_LED_TOP_DEFAULT);
> +err_node_put:
> +	of_node_put(child);
> +	return rv;
>  }
>  
>  static struct platform_driver max77650_led_driver = {
> 

Applied to for-5.4 branch of linux-leds.git.

-- 
Best regards,
Jacek Anaszewski
