Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80E622E72E9
	for <lists+linux-leds@lfdr.de>; Tue, 29 Dec 2020 19:10:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726198AbgL2SKa (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 29 Dec 2020 13:10:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726111AbgL2SKa (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 29 Dec 2020 13:10:30 -0500
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [IPv6:2001:67c:2050::465:102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69490C0613D6;
        Tue, 29 Dec 2020 10:09:49 -0800 (PST)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4D52WG4fcvzQlY1;
        Tue, 29 Dec 2020 19:09:46 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dylanvanassche.be;
        s=MBO0001; t=1609265384;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+kaAl/Sht/vrod5Tqio0znaWQlZDDyFyOD3lL/94zZE=;
        b=uHdX9CI/XFbEty3ZExxueWn1TLlqPqFjCNnVcWqYbbPSTUAhGHQCtAZyNrIADzCgoE5suz
        J0rX6CcWqc8yFbAnRgKQAKS8fBWp2XNNVaLT7yrtnliL1defTYSpJqDHABXjwFaIwhli+R
        s3IHP48QQTUfi6e4i/GEvAgDSvKLJND/4NwD/skVImvAi5gz8VFty/BRBHCCe7OjbtO4Yk
        YEZrR+TFbLv3CJQ2RJqsWd+At891lDpy17v3UoknalFFbFEOBMQ95v4zUNC4i944vZY2kd
        tmZ8IeoQCoZzemSN9gHkGFESX9zITu6uNOGeMiHUE7YW1nJfgD7RObkjY/Lt0A==
Received: from smtp1.mailbox.org ([80.241.60.240])
        by gerste.heinlein-support.de (gerste.heinlein-support.de [91.198.250.173]) (amavisd-new, port 10030)
        with ESMTP id NhvfUmaKXHiy; Tue, 29 Dec 2020 19:09:40 +0100 (CET)
Message-ID: <cbfba11f00850e610d0a6ca1e0da2ead977f1574.camel@dylanvanassche.be>
Subject: Re: [PATCH v2] leds: gpio: Set max brightness to 1
From:   Dylan Van Assche <me@dylanvanassche.be>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Tue, 29 Dec 2020 19:09:11 +0100
In-Reply-To: <20201229160450.GA9564@duo.ucw.cz>
References: <20201229142440.31916-1-me@dylanvanassche.be>
         <20201229160450.GA9564@duo.ucw.cz>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -4.99 / 15.00 / 15.00
X-Rspamd-Queue-Id: 9ACBC1861
X-Rspamd-UID: 63b168
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi!

Thanks for the feedback!
Indeed, this can be even more simplified with your suggestion.
I will send a new version of the patch soon.

Happy holidays!

Kind regards,
Dylan Van Assche

On Tue, 2020-12-29 at 17:04 +0100, Pavel Machek wrote:
> Hi!
> 
> > GPIO LEDs only know 2 states: ON or OFF and do not have PWM
> > capabilities.
> > However, the max brightness is reported as 255.
> > 
> > This patch sets the max brightness value of a GPIO controlled LED
> > to 1.
> > 
> > Tested on my PinePhone 1.2.
> > 
> > Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
> > ---
> > v2 drops an obsolete change in include/linux/leds.h
> 
> I thought that one looked odd.
> 
> > +++ b/drivers/leds/leds-gpio.c
> > @@ -96,7 +96,8 @@ static int create_gpio_led(const struct gpio_led
> > *template,
> >  	} else {
> >  		state = (template->default_state ==
> > LEDS_GPIO_DEFSTATE_ON);
> >  	}
> > -	led_dat->cdev.brightness = state ? LED_FULL : LED_OFF;
> > +	led_dat->cdev.brightness = state ? LED_ON : LED_OFF;
> > +	led_dat->cdev.max_brightness = LED_ON;
> 
> Would simpler version work:
> 
> > +	led_dat->cdev.brightness = state;
> > +	led_dat->cdev.max_brightness = 1;
> 
> ? Easier to understand... I'd prefer that version unless it causes
> warnings or something.
> 
> 								Pavel

