Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13C8F394B6B
	for <lists+linux-leds@lfdr.de>; Sat, 29 May 2021 11:47:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229709AbhE2Jsh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 29 May 2021 05:48:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbhE2Jsg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 29 May 2021 05:48:36 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ACA4C061574;
        Sat, 29 May 2021 02:46:59 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id y15so1166487pfl.4;
        Sat, 29 May 2021 02:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3gTPDj6l14sSO0G8qTrglWcCvlcNDw/Zi+y0OrtuL4Q=;
        b=hg/nysFvG/cDCIlA4GJDow80QTyDM4pq/mTbjBnBeiUziCbM5JmTkQDXiiXCaAgUBq
         oPD71koFogjDM/k29tXf3cQFoyTTKSkkHgunld43qUeDe54KK3CQOUkA+9+Ks3JdSVhG
         j02qedaawR/tUxXCoGCsB4GOJDIKv/dfy3Pb8LxCMQclSKuvkhbSzlKFAOd88HNdxbGl
         Mz4OY5ijPNvmusKSBh7QwzAoFn6Awpzm3INUVDjktgpIBeo8GlLbfmoqt7taM8LtOZYr
         JIapBpjwDXBxCr00UXhz+m1MSZ7bb8Cmo4FwI8iBS4F3jgBKa3sUvKi+Z6zJkuWI6Bhk
         DKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3gTPDj6l14sSO0G8qTrglWcCvlcNDw/Zi+y0OrtuL4Q=;
        b=Qqt0OM9C6LFx9IXIf15w6yADXjQQOkrCn3weOuK3FAlthvnxKfDnVXJZBl2RMpbR/i
         EHHzezUgdDl5Y0fYwwrbm3j81CtM/YEygcJL1XSF8FvstD8XsE4maS4fx4VFpfbnXJi6
         NRbKK6GfrYWm5lJM+KjdNVeQDFzlKODM+ktkTKVB6o+c8I2iWy4Fkf5ZVeNRX6X8oq16
         Xa8PL6JsdWorpMj+TDi4bQmM1/kxFFD9oFVcqAjUjhzaapwCxRipiOinjXzHk/UMMRPj
         Ih7SdGCqB1tRzqJXXAPlGbtlKeAvLpGdU4uI7v+lnXDsCzTLY+7n9NAm5Tr3FK3cvjt7
         GWeA==
X-Gm-Message-State: AOAM533Nay9sLjfbloJl6GZohbNv/cBjTTebZnirtP8pA6Osy0A3+nqG
        PVfP6Q4bX3fErdm2kSK8HhaYeC+rw3DhYBMCiJc=
X-Google-Smtp-Source: ABdhPJxAV+zrPKKTyztRffBDbdVXLakbH8UUM2Ix1++odTodmc+rnilqIHHMnno5t3PxztM+fOmct2cfD94NRU9Gf4o=
X-Received: by 2002:a63:79c3:: with SMTP id u186mr13318953pgc.203.1622281619170;
 Sat, 29 May 2021 02:46:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
 <20210510095045.3299382-12-andy.shevchenko@gmail.com> <20210528100906.GG2209@amd>
 <YLDKneVl0DefNdAW@smile.fi.intel.com>
In-Reply-To: <YLDKneVl0DefNdAW@smile.fi.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 29 May 2021 12:46:43 +0300
Message-ID: <CAHp75VcnKJj_2G5xiBXCGQmo3XqV=jR1J64zoimiBr162rw+DA@mail.gmail.com>
Subject: Re: [PATCH v1 11/28] leds: lgm-sso: Remove explicit managed resource cleanups
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>,
        Abanoub Sameh <abanoubsameh8@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, May 28, 2021 at 1:50 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Fri, May 28, 2021 at 12:09:06PM +0200, Pavel Machek wrote:
> > On Mon 2021-05-10 12:50:28, Andy Shevchenko wrote:
> > > The idea of managed resources that they will be cleaned up automatically
> > > and in the proper order. Remove explicit cleanups.
> >
> > Are you really sure this is good idea with the regmap_update_bits in
> > between?
>
> Good question. I will check it.
>
> > > -   /* unregister led */
> > > -   devm_led_classdev_unregister(priv->dev, &led->cdev);

I left this untouched, i.o.w. no removal in v2.

-- 
With Best Regards,
Andy Shevchenko
