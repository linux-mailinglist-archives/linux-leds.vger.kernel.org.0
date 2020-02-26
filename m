Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6E21170220
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2020 16:17:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727964AbgBZPR6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 26 Feb 2020 10:17:58 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:42728 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727941AbgBZPR6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 26 Feb 2020 10:17:58 -0500
Received: by mail-pl1-f193.google.com with SMTP id u3so1399869plr.9
        for <linux-leds@vger.kernel.org>; Wed, 26 Feb 2020 07:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8O8NpLMXqvZBg5ItjU9W7KfRGCwKDMgBCZWKDetNEt0=;
        b=bkqna79+cWLUh7hcO6WKMdVz9xZ+ZY0KHn0PRCC61LbyE3HWD20i9k91C6oXYKTIZG
         q9CPE/roOGcQmrNLRaESexrEs1Z5Iic6dF2UFOhF/no04qTE06T8794slsiOWatOgiph
         xCSv2DAJjlxNDMp5pjkUe1r4E5MFOd3pXqwA6vLIGNs5rI/LKnq9qN6cDYZazELGGCsN
         xzYDpW3JS5Pd8WLKA7xUlW6V9tE4AXWAfSEYikxZT4eXDS3mYUYbWBqWAbiPjR8Pkp7K
         g2ixRMblbp7edJwG/rXJ0iuV5c3QSZAhrEugwkj3FFUGVIGhhe8iS7zAm5BiNdRr0I3x
         X7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8O8NpLMXqvZBg5ItjU9W7KfRGCwKDMgBCZWKDetNEt0=;
        b=qDDkm1P6NFXRykNYwknl2BKunSPRy7BgHbcbgOIbPfZY3iycaPc+2lsh8Hjqg7KoWE
         w1SvR58p18Htp5hxCR3wy0XBRACbCm66hcN471Xw7xdLrkM9Xb7E0CzKsmqn3urPnzv0
         Xml/k3pxNpHCqAkv4Z+viEzXeTlwJCP6LxePRAnPKYrqJdjhuKDothH8qJqDms3NKDhZ
         tav0J0esFJCRfwjmFL+Lwn5Kkv4vSlmJXzKe5sM3O3SBhV2Vcu9c/5/4hvmnE54D8HHh
         DVe6DLURnHLcglEcrI0rys0fhODNz37gYkwrWxw9t5xA72M21ozDsOpt8bgbSKdsc9uv
         7QIw==
X-Gm-Message-State: APjAAAUapjDWcCDAe/8TMKNFdni/NatDcj+wtMF/M10P/qB2uhRzl7Uw
        k0CU8Sw5c7V31FnWB3o7KJc=
X-Google-Smtp-Source: APXvYqypnsIJGJrRro6NNCwJG06fz8YYPa2wgI2dt1su7/9LZmdG9uJWHzd2sTxq08jlLqySs6hRdQ==
X-Received: by 2002:a17:902:9a85:: with SMTP id w5mr4800804plp.323.1582730277325;
        Wed, 26 Feb 2020 07:17:57 -0800 (PST)
Received: from localhost ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 13sm3165486pgo.13.2020.02.26.07.17.55
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 26 Feb 2020 07:17:56 -0800 (PST)
Date:   Wed, 26 Feb 2020 23:17:54 +0800
From:   chenqiwu <qiwuchen55@gmail.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     jacek.anaszewski@gmail.com, dmurphy@ti.com,
        linux-leds@vger.kernel.org, chenqiwu <chenqiwu@xiaomi.com>
Subject: Re: [PATCH] leds: use devm_platform_ioremap_resource_byname()
Message-ID: <20200226151753.GA17825@cqw-OptiPlex-7050>
References: <1581695301-16604-1-git-send-email-qiwuchen55@gmail.com>
 <20200226135343.GG4080@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200226135343.GG4080@duo.ucw.cz>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi, Pavel,
> 
> > From: chenqiwu <chenqiwu@xiaomi.com>
> > 
> > Use devm_platform_ioremap_resource_byname() instead of calling
> > platform_get_resource_byname() and devm_ioremap_resource() separately.
> > 
> > Signed-off-by: chenqiwu <chenqiwu@xiaomi.com>
> 
> Was this tested? Can you cc driver authors to get it tested?

I will resend this patch cc driver authors to get it tested.
 
> > index ef22e1e..76af9d8 100644
> > --- a/drivers/leds/leds-cobalt-qube.c
> > +++ b/drivers/leds/leds-cobalt-qube.c
> > @@ -36,15 +36,9 @@ static void qube_front_led_set(struct led_classdev *led_cdev,
> >  
> >  static int cobalt_qube_led_probe(struct platform_device *pdev)
> >  {
> > -	struct resource *res;
> > -
> > -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > -	if (!res)
> > -		return -EBUSY;
> > -
> > -	led_port = devm_ioremap(&pdev->dev, res->start, resource_size(res));
> > -	if (!led_port)
> > -		return -ENOMEM;
> > +	led_port = devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(led_port))
> > +		return PTR_ERR(led_port);
> >  
> >  	led_value = LED_FRONT_LEFT | LED_FRONT_RIGHT;
> >  	writeb(led_value, led_port);
> > diff --git a/drivers/leds/leds-cobalt-raq.c b/drivers/leds/leds-cobalt-raq.c
> > index 045c239..8b1317d 100644
> > --- a/drivers/leds/leds-cobalt-raq.c
> > +++ b/drivers/leds/leds-cobalt-raq.c
> > @@ -65,16 +65,11 @@ static void raq_power_off_led_set(struct led_classdev *led_cdev,
> >  
> >  static int cobalt_raq_led_probe(struct platform_device *pdev)
> >  {
> > -	struct resource *res;
> >  	int retval;
> >  
> > -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > -	if (!res)
> > -		return -EBUSY;
> > -
> > -	led_port = devm_ioremap(&pdev->dev, res->start, resource_size(res));
> > -	if (!led_port)
> > -		return -ENOMEM;
> > +	led_port = devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(led_port))
> > +		return PTR_ERR(led_port);
> >  
> >  	retval = led_classdev_register(&pdev->dev, &raq_power_off_led);
> >  	if (retval)
> > @@ -90,6 +85,7 @@ static int cobalt_raq_led_probe(struct platform_device *pdev)
> >  	led_classdev_unregister(&raq_power_off_led);
> >  
> >  err_null:
> > +	devm_ioremap_release(&pdev->dev, led_port);
> >  	led_port = NULL;
> >  
> >  	return retval;
> 
> How is it that manual devm_ioremap_release() is neccessary here but
> not in the other driver?

Thanks for your remind! This is neccessary for leds-cobalt-qube driver
to apply, too.

BRs,
Qiwu
