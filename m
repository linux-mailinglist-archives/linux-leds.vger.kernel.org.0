Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BE712C0C27
	for <lists+linux-leds@lfdr.de>; Mon, 23 Nov 2020 14:57:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731430AbgKWNtU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 23 Nov 2020 08:49:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731406AbgKWNtU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 23 Nov 2020 08:49:20 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7BEAC061A4E
        for <linux-leds@vger.kernel.org>; Mon, 23 Nov 2020 05:49:19 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id 142so18013640ljj.10
        for <linux-leds@vger.kernel.org>; Mon, 23 Nov 2020 05:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cALLdyIGhIcYa+yZMOrmTa8LFbCTBghd/fpPDcmloEk=;
        b=xyHkmCEBQ3MVFceIjt3I0NGS8o7fVNOGgPaId2vNfBysRauom0De6SfYwcKry5IBri
         pNXnwileIREKxTPcxi/R+C832zSYhb2FySqt2+JlxigdhHrTEWBHP7BCiCNCGOWTnTCb
         xRvkYkqOSxvow/ldk5fAIngGUFgGxAyRIvtAk9OdUKohjMCe0LpW3TaS+tQnT1Aw1Sw0
         V7j7qpdN69H0UjkBk6uoJe0RaL+r606bGf0xq3IR29xtJTL4CRypONCyrgu+MShn7T+1
         E5pp4Sp/uK7QKlrmOlVIaBqK7kWhLu/RG5OMK6G3mafhL8Qza3C6w+wNMuXkGp42POFM
         Qqww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cALLdyIGhIcYa+yZMOrmTa8LFbCTBghd/fpPDcmloEk=;
        b=sEFVwOcX+361cU8z/at4UTov0NalbOvi1uEg4R5y0nP/IV2qPFJAKxg+28gz7tZszU
         6KTHIgEov84Nf+mILM/sh4+S4DQ5PxMDnZBw0mrzPQI0sG0TZee4rWDSd4qQpT+493pF
         Osu5JweHMazUSqcKoH4v0+aH00zy297urSWVlA39dhlRu18Z9w0KGJy7zcGiCasbi5VS
         o4eiLcRfrgjTPQDpQGZwGKkx+MXAmF4NdiVVyuuOEvooO0oCzf9/fWCqQho6gY0Gvt8t
         RdHPHCAIWfpRd4K0dolLxRXNwt+nI9XCUQLtScKUJWcHlJv2WIvO3l+cwwkd72M83OqP
         Ac7g==
X-Gm-Message-State: AOAM530oHKUEXDnR5I0yztZL1uOawhODT7L51DX/+bUx1Ps1B8K+zLH2
        9esOFtUf7BGPY+y3qBkJ8hlX2e5OWaOFeTBaEWqmBg==
X-Google-Smtp-Source: ABdhPJzFez98v9zAgNlGYnlrLONH8AqW1j6A8vSWChWi6qex8ZUVebcGav1oEn82K9ah23xBYE1S3711jwgwbsB32AU=
X-Received: by 2002:a2e:321a:: with SMTP id y26mr13817426ljy.293.1606139356744;
 Mon, 23 Nov 2020 05:49:16 -0800 (PST)
MIME-Version: 1.0
References: <20201113124239.2667502-1-linus.walleij@linaro.org>
 <20201113124239.2667502-2-linus.walleij@linaro.org> <20201122115028.GB4351@valkosipuli.retiisi.org.uk>
In-Reply-To: <20201122115028.GB4351@valkosipuli.retiisi.org.uk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 23 Nov 2020 14:49:04 +0100
Message-ID: <CACRpkdbju5M_atEmJTbg8bS+DuEawGs3m1CoVJkpMZzzF5gjEg@mail.gmail.com>
Subject: Re: [PATCH 2/2 v5] leds: rt8515: Add Richtek RT8515 LED driver
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        newbytee@protonmail.com, Stephan Gerhold <stephan@gerhold.net>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, Nov 22, 2020 at 12:50 PM Sakari Ailus <sakari.ailus@iki.fi> wrote:

> > +static int rt8515_led_flash_strobe_set(struct led_classdev_flash *fled,
> > +                                    bool state)
> > +{
> > +     struct rt8515 *rt = to_rt8515(fled);
> > +     struct led_flash_setting *timeout = &fled->timeout;
> > +     int brightness = 4; /* max 16 */
>
> Just a question on the unit --- did the other spec shed any light on what
> the relation between this setting and the current might be?

They just say:
"There are a total of 16 steps of current
level which can be set by users."

They do not say whether this is linear or not. So I have
assumed linear. The above is just a bug, it should should be
the configured max or max available of course. I'll fix!

Yours,
Linus Walleij
