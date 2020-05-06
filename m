Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F345B1C65EF
	for <lists+linux-leds@lfdr.de>; Wed,  6 May 2020 04:44:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728158AbgEFCoU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 5 May 2020 22:44:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728069AbgEFCoT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 5 May 2020 22:44:19 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F826C061A0F;
        Tue,  5 May 2020 19:44:19 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id m18so196846otq.9;
        Tue, 05 May 2020 19:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lToKiYqDzeyepcFYxdBUJOiTycbEPx+SdzPCH8xZYpU=;
        b=GMBFz7sPA/TGfkt1kbDYWSZGtF7dE0sIA+dILblK8rgopnKEHvEfl7XLAy62/X5lVB
         aDe1gPwU+EouYVsvHd5fUssazSTRFiEL09WzDIDgj08KPji+ZqgtS1rQ0661pe2SKb9Q
         g/uI1QUxXd6vCgq4SUmULMvqMJVP7i8T8tSCeYktMZMtSssC3W/cNsjpk7PZUTjajdr6
         gYreOi+yZo8clrQYQ0QLybtIhfKvgCGje1A2yS4p6pySutpq+gZ6rOpaQ7Shm67Oa0kN
         aBATkYxtkZEjSiKcyRptHmqhfl56KdEuqrZwU1wwtnD6zVvwcfY+LjXqoCpl1MyMiIVc
         vSzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lToKiYqDzeyepcFYxdBUJOiTycbEPx+SdzPCH8xZYpU=;
        b=Ewof0V1y/5lH7p+SDRbT/UI6jpozwjW8EbFQYwrIwTckyqYUzlQQrzPbXbG4ms/c3G
         hUVvgeJQKt4bbJLr5MMlXZHGO0gxfuJQQQsvPtJutUECjpbOMszFRUGyaTAMVltwXhFx
         7OHx201iMQL6zi/m0UgzFHFqIHDupZxEOWok1fzQss07CxTEPI9cKXqyJrARdLcr0rae
         weMAc2eXIgVWPbrcMTDgSJN+BY9uhxtgL0h73E/FtX8dTVxH0/hHqEiJxqHjN+NGXhHX
         wuLbjR+SlvnlR0RtQDRbBB9ho4iC0CJYBzSYTheB0weBYzqvo3Tni2IkiqQYoQa1DRx9
         brGA==
X-Gm-Message-State: AGi0PuZAcA/jjaS9+KT+WFs0hMmf+TuYmP3YUqR6l62IcB8UZpO2k12X
        mWo9zIRAe+l8Gpp58xG8Q00=
X-Google-Smtp-Source: APiQypKZ9U3E4u2jK3T6T7S2CFrG49xOysMgOhOpNszjxXwMTKHUPf1wx4Fr7wtM+u5GFswF860+HA==
X-Received: by 2002:a05:6830:da:: with SMTP id x26mr4862496oto.259.1588733058513;
        Tue, 05 May 2020 19:44:18 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id a27sm135255oos.37.2020.05.05.19.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 19:44:18 -0700 (PDT)
Date:   Tue, 5 May 2020 19:44:16 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Bryan Wu <bryan.wu@canonical.com>,
        "G.Shark Jeong" <gshark.jeong@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: Re: [PATCH] leds: lm355x: avoid enum conversion warning
Message-ID: <20200506024416.GB415100@ubuntu-s3-xlarge-x86>
References: <20200505141928.923428-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200505141928.923428-1-arnd@arndb.de>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, May 05, 2020 at 04:19:17PM +0200, Arnd Bergmann wrote:
> clang points out that doing arithmetic between diffent enums is usually
                                                 ^ different
> a mistake:
> 
> drivers/leds/leds-lm355x.c:167:28: warning: bitwise operation between different enumeration types ('enum lm355x_tx2' and 'enum lm355x_ntc') [-Wenum-enum-conversion]
>                 reg_val = pdata->pin_tx2 | pdata->ntc_pin;
>                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
> drivers/leds/leds-lm355x.c:178:28: warning: bitwise operation between different enumeration types ('enum lm355x_tx2' and 'enum lm355x_ntc') [-Wenum-enum-conversion]
>                 reg_val = pdata->pin_tx2 | pdata->ntc_pin | pdata->pass_mode;
>                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
> 
> In this driver, it is intentional, so add a cast to hide the false-positive

Not sure that I would call this a false positive. The warning is correct
that there is a bitwise operation between different enumeration types
but we do not care since we are just using the enumerated type for its
integer value in lieu of a #define VAR value.

> warning. It appears to be the only instance of this warning at the moment.
> 
> Fixes: b98d13c72592 ("leds: Add new LED driver for lm355x chips")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/leds/leds-lm355x.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/leds/leds-lm355x.c b/drivers/leds/leds-lm355x.c
> index 11ce05249751..b2eb2e1e9c04 100644
> --- a/drivers/leds/leds-lm355x.c
> +++ b/drivers/leds/leds-lm355x.c
> @@ -164,18 +164,19 @@ static int lm355x_chip_init(struct lm355x_chip_data *chip)
>  	/* input and output pins configuration */
>  	switch (chip->type) {
>  	case CHIP_LM3554:
> -		reg_val = pdata->pin_tx2 | pdata->ntc_pin;
> +		reg_val = (u32)pdata->pin_tx2 | (u32)pdata->ntc_pin;
>  		ret = regmap_update_bits(chip->regmap, 0xE0, 0x28, reg_val);
>  		if (ret < 0)
>  			goto out;
> -		reg_val = pdata->pass_mode;
> +		reg_val = (u32)pdata->pass_mode;

Is this cast needed? I don't think there should be warning from going
from an enumerated type to unsigned int.

>  		ret = regmap_update_bits(chip->regmap, 0xA0, 0x04, reg_val);
>  		if (ret < 0)
>  			goto out;
>  		break;
>  
>  	case CHIP_LM3556:
> -		reg_val = pdata->pin_tx2 | pdata->ntc_pin | pdata->pass_mode;
> +		reg_val = (u32)pdata->pin_tx2 | (u32)pdata->ntc_pin |
> +		          (u32)pdata->pass_mode;
>  		ret = regmap_update_bits(chip->regmap, 0x0A, 0xC4, reg_val);
>  		if (ret < 0)
>  			goto out;
> -- 
> 2.26.0
> 

With those comments addressed, feel free to add:

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
