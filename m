Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26D9B394B66
	for <lists+linux-leds@lfdr.de>; Sat, 29 May 2021 11:45:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229560AbhE2JrV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 29 May 2021 05:47:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbhE2JrU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 29 May 2021 05:47:20 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 054ADC061574;
        Sat, 29 May 2021 02:45:44 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id pi6-20020a17090b1e46b029015cec51d7cdso3872081pjb.5;
        Sat, 29 May 2021 02:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BDLTYYEAOQhatr0LdGoGVfqkbli40+8xddekenJeYkg=;
        b=dvtjSdL/u9BbMkbGBbzMV0Z7C0SxhBpC8AINL+QbdJ8NSq79x4pez9t0BhCrDW8Oiv
         3Q91kaP5KbXQ7VJDz74V1kI+B942/sVtyLsXlLjXI1+F97Ecd22kHYRDSKQ6tJrrh7Ho
         EqrNN+bqkBKHjr1HiASnA5RSNTl11rKSQf7+U/yNsuoJ5VYe94ZiFTEaL6rDCOrQnD6V
         DPykEuR4L8stS0uQs2ijQeB3Rj7gf4jzGgHTxqxWIvVUA28PBkfrl4SN3cRYpvF6BHu+
         55qETYPnsBi1MuCyEuBXjFRyVVsXCfgTQA6bIuKs6839WZChDN4tLtcR45+w3RvAYF6p
         3nuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BDLTYYEAOQhatr0LdGoGVfqkbli40+8xddekenJeYkg=;
        b=EsMty4jcEjdwTYcOSg6ihqZ4xHBRFEK7GCvvIC9hMoeDTuzKru9rrn/Sk43vB9Fvc3
         +VhqhyCVilDKTw6yq6zQfwRxfa/x7peZfGuDRuNb72RGdX81k7ipgh2PGMAzr3U+iWz2
         nnbwvcaSNH0t1StDEdQU4JUCgjfnqLScKksrPjwOfAbnNN3pu1ZGpN1gW0jvAObwRuuV
         HsOUatsBJQPtME6wRgDvxpclK/VeZ/20/mASHgP3+3FNqIVcnPH5pwkasIpuiT0CG94i
         sIiZ5IZEv20Ou6m/DCJG+SGmnm7cnpjWmmYWER2VFtbnCQaKSKvJo4mgbsgkjR/6uIbg
         GZag==
X-Gm-Message-State: AOAM531TSdC6Tsl88gJ0QyyNRI4xHHEaLTabQSyfskOca9TflccD7Ke0
        20z00HAkJrkVRfIEjV2BCOrkQMVysthNLMEXGrQ=
X-Google-Smtp-Source: ABdhPJyJSxi2Of9APPOogdMaEFieJtmz9kXxSLNW1iP/wpmxSnC23o4GhTm+AkI10pmZ7jj4HveCGJx7nf3lFnMb8TA=
X-Received: by 2002:a17:90a:17ad:: with SMTP id q42mr9178692pja.181.1622281544430;
 Sat, 29 May 2021 02:45:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
 <20210510095045.3299382-6-andy.shevchenko@gmail.com> <f21ff98f-8728-eea1-f9ef-c14f64d31d0e@kaa.org.ua>
In-Reply-To: <f21ff98f-8728-eea1-f9ef-c14f64d31d0e@kaa.org.ua>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 29 May 2021 12:45:27 +0300
Message-ID: <CAHp75VdVFHBCPqZonYZbk2iUMMKD7nP7+_8JkXqYFZK5zn2Lzw@mail.gmail.com>
Subject: Re: [PATCH v1 05/28] leds: el15203000: Correct headers (of*.h -> mod_devicetable.h)
To:     Oleh Kravchenko <oleg@kaa.org.ua>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Amireddy Mallikarjuna reddy 
        <mallikarjunax.reddy@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>,
        Abanoub Sameh <abanoubsameh8@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, May 29, 2021 at 12:00 AM Oleh Kravchenko <oleg@kaa.org.ua> wrote:
> 10.05.21 12:50, Andy Shevchenko =D0=BF=D0=B8=D1=88=D0=B5:
> > There is no user of of*.h headers, but mod_devicetable.h.
> > Update header block accordingly.

> > While at it, drop unneeded dependency to OF.

> >       depends on LEDS_CLASS
> >       depends on SPI
> > -     depends on OF

> Reviewed-by: Oleh Kravchenko <oleg@kaa.org.ua>

Thanks! I have dropped the OF dependency removal, while keeping your Rb.
I think we may figure out later what is the best course of action regarding=
 it.

--=20
With Best Regards,
Andy Shevchenko
