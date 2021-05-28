Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0EE639405D
	for <lists+linux-leds@lfdr.de>; Fri, 28 May 2021 11:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbhE1J5M (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 May 2021 05:57:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235640AbhE1J5L (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 May 2021 05:57:11 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05463C06174A
        for <linux-leds@vger.kernel.org>; Fri, 28 May 2021 02:55:36 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id n2so2757241wrm.0
        for <linux-leds@vger.kernel.org>; Fri, 28 May 2021 02:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=BcIOldmZVwSiwDw5G4va3pjEdcv7Dn7tcdn9Gsx873k=;
        b=NShNNzK+tzFi2lVVD7YpraXxGazLcNhejUQVT42SHnmLZZapqZRt1HeA7cF2WCgcby
         dIZqalfzWp6WJGL/edhrQqYKfOKuoiZBe5NhMAfPyT0JoX8vDeoEsrE7Rg55Kc8dSba/
         sEktiKVk1ho6Zb+XFKva1yBpnw/S0RJ+634Y7dhGsNXtrfGkvOzcsu0GGehXev7XQ4Am
         IYVCB64rDF4go5EI1gm4Gagy1VPsZ5/Pi7dBKrma/vTt8EwClxGuL+4cxA4yE3kdqQ0O
         ragKANk3RBDm6Rueil7O75K70q08qUNZJV3M+Im3ev8RRSoLCcYuAcdj0UDdSVOX+BS/
         uOxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=BcIOldmZVwSiwDw5G4va3pjEdcv7Dn7tcdn9Gsx873k=;
        b=D+cyuUfK52vOFAW4/3Z9eeqRM0fXPPkx/Z0wjXXJrmPVR7m04MzGPJYY9Xk1JEBrD0
         a1KRuFLTRQg+K0DvFZ+M/0dWjQwfUCnrrbkBKhYpxdR7Z03DIUBAZAyDLJau9SkrejH7
         t5pAfq72vxe+M6aW/HP0tqk5lNx6/JO2+Fb12Ip5x0hsE/wVSay+VolYNz08G8krVFMN
         KU+a4GluMqR6oCPiSHRgQj0iLJzZ/hzC4Y0RxKm4aoUsHHsLxfeMcUpcOG/CWbKPxJiW
         wqCkTRhHhvuv6bC4bWW3euojqNVlQZr6ny3CDBirTeXAkk1cUA6O37pC7N1AXnc8sSeQ
         Wvsg==
X-Gm-Message-State: AOAM532AXPh/ar3Yn2cwTqZQJ6a7Nb/nUbOjnwPzJpblFmigP5/gF+S4
        EsQo8gGTxFJ05Mz+FOw7LbjxmEnIMdNGIQ==
X-Google-Smtp-Source: ABdhPJxXMogHhPAuwHe17CWdC9Gbz06ZehTeoTb1h0hwDnX6aajY8pPoEU9vUz9NEdq+bEyB9KXQkg==
X-Received: by 2002:a05:6000:1081:: with SMTP id y1mr7621791wrw.34.1622195733890;
        Fri, 28 May 2021 02:55:33 -0700 (PDT)
Received: from dell ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id s5sm6620676wrw.95.2021.05.28.02.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 02:55:33 -0700 (PDT)
Date:   Fri, 28 May 2021 10:55:31 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH 02/15] leds: leds-gpio-register: Supply description for
 param 'id'
Message-ID: <20210528095531.GO543307@dell>
References: <20210528090629.1800173-1-lee.jones@linaro.org>
 <20210528090629.1800173-3-lee.jones@linaro.org>
 <20210528094118.xw53q46i676wx6gb@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210528094118.xw53q46i676wx6gb@pengutronix.de>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 28 May 2021, Uwe Kleine-König wrote:

> Hello Lee,
> 
> On Fri, May 28, 2021 at 10:06:16AM +0100, Lee Jones wrote:
> > diff --git a/drivers/leds/leds-gpio-register.c b/drivers/leds/leds-gpio-register.c
> > index b9187e71e0cf2..de3f12c2b80d7 100644
> > --- a/drivers/leds/leds-gpio-register.c
> > +++ b/drivers/leds/leds-gpio-register.c
> > @@ -11,6 +11,7 @@
> >  /**
> >   * gpio_led_register_device - register a gpio-led device
> >   * @pdata: the platform data used for the new device
> > + * @id: platform ID
> >   *
> 
> Given that id is the first parameter and pdata the second I suggest to
> swap the order here and describe id first.

That's super picky.

I can do it as a follow-up patch if you *really* care about it.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
