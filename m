Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F364B39481D
	for <lists+linux-leds@lfdr.de>; Fri, 28 May 2021 23:07:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbhE1VIx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 May 2021 17:08:53 -0400
Received: from smtp.220.in.ua ([89.184.67.205]:53098 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229481AbhE1VIw (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 28 May 2021 17:08:52 -0400
X-Greylist: delayed 490 seconds by postgrey-1.27 at vger.kernel.org; Fri, 28 May 2021 17:08:52 EDT
Received: from [192.168.202.100] (unknown [95.67.115.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp.220.in.ua (Postfix) with ESMTPSA id 487401A200CD;
        Fri, 28 May 2021 23:59:05 +0300 (EEST)
Subject: Re: [PATCH v1 04/28] leds: el15203000: Make error handling more
 robust
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Amireddy Mallikarjuna reddy 
        <mallikarjunax.reddy@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
        Abanoub Sameh <abanoubsameh8@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
 <20210510095045.3299382-5-andy.shevchenko@gmail.com>
From:   Oleh Kravchenko <oleg@kaa.org.ua>
Message-ID: <6fe3dbb8-255d-35f7-076a-039ab032ac7f@kaa.org.ua>
Date:   Fri, 28 May 2021 23:59:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210510095045.3299382-5-andy.shevchenko@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: uk-UA
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org



10.05.21 12:50, Andy Shevchenko пише:
> It's easy to miss necessary clean up, e.g. firmware node reference counting,
> during error path in ->probe(). Make it more robust by moving to a single
> point of return.
> 
> Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> ---
>  drivers/leds/leds-el15203000.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/leds/leds-el15203000.c b/drivers/leds/leds-el15203000.c
> index 912451db05e6..bcdbbbc9c187 100644
> --- a/drivers/leds/leds-el15203000.c
> +++ b/drivers/leds/leds-el15203000.c
> @@ -246,16 +246,13 @@ static int el15203000_probe_dt(struct el15203000 *priv)
>  		ret = fwnode_property_read_u32(child, "reg", &led->reg);
>  		if (ret) {
>  			dev_err(priv->dev, "LED without ID number");
> -			fwnode_handle_put(child);
> -
> -			break;
> +			goto err_child_out;
>  		}
>  
>  		if (led->reg > U8_MAX) {
>  			dev_err(priv->dev, "LED value %d is invalid", led->reg);
> -			fwnode_handle_put(child);
> -
> -			return -EINVAL;
> +			ret = -EINVAL;
> +			goto err_child_out;
>  		}
>  
>  		led->priv			  = priv;
> @@ -277,14 +274,16 @@ static int el15203000_probe_dt(struct el15203000 *priv)
>  			dev_err(priv->dev,
>  				"failed to register LED device %s, err %d",
>  				led->ldev.name, ret);
> -			fwnode_handle_put(child);
> -
> -			break;
> +			goto err_child_out;
>  		}
>  
>  		led++;
>  	}
>  
> +	return 0;
> +
> +err_child_out:
> +	fwnode_handle_put(child);
>  	return ret;
>  }
>  
> 

Reviewed-by: Oleh Kravchenko <oleg@kaa.org.ua>
