Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3843F26361A
	for <lists+linux-leds@lfdr.de>; Wed,  9 Sep 2020 20:34:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728611AbgIISef (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 9 Sep 2020 14:34:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbgIISee (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 9 Sep 2020 14:34:34 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A2DEC061573
        for <linux-leds@vger.kernel.org>; Wed,  9 Sep 2020 11:34:34 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id d18so4230291iop.13
        for <linux-leds@vger.kernel.org>; Wed, 09 Sep 2020 11:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cc1mTJ4YBbjlfzPf25X2vuH8TH88kzjymIjnYwRDABQ=;
        b=cc2Qt1f4dpUC0QpPCXg+9Y9XLHMA8xk6SiF4s5nmfrtFNkxDNTaG9UecXJsuyI+qKu
         4uk4C9AxB33jv2tLG4CDXx6E8VpPQAeLG/oD9Jy7QsgmSfWzrRmK9QJHt+tZ2KnrJPEN
         l1l7iHZWQXFC62PlvMDliggM6kXjdhhSib5wbP7JRdAIBVceTg+n0crB7GqY9SqwmSgy
         3g2tQrPYRRWyMKaQiFKxUcMG6DxHO7x263SxL4be5W6CzxtNbAVbt8f+j8zm1MDX/8Vq
         6N5BN/J1ZZCK0KUuyeiSBa4vAMF+V75zVCllRN6ERTjnW1/ltYGFkU9V0OufLgeRg6X8
         Cnbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cc1mTJ4YBbjlfzPf25X2vuH8TH88kzjymIjnYwRDABQ=;
        b=EzdXekRfiaH1YvVuxLd5llNtsS2lV/bt9pO6aCrWo3JUt0x5iNIrvX93kCgXk0eTro
         CjPlZPYKFo31SIpvyN/yKvqha2XMQE70qZ7YpV1191dREHnCh8yvp9o5Jhm/COxnq+zI
         MgI36glgJThWytZL7hVWkpD7MF4Oy19xp8Cgt2MuUpxghKaNl/onZZRidIalBsxnfi8n
         PzpK4ldQI6D3SLwNSEdT8PxNeOD2P4QRJD8QKxw1gSQQI4ihZRKZdFjzZmuQy4pMsWMD
         8LnY+EVV9icvPpIJcbRPfNFDZybPpI6HLS/XCkruoYR9fS6RcQ357FK/xjWpkxMgFu9K
         4L+w==
X-Gm-Message-State: AOAM531EHLfOjS2nEn8UUqxH/O2fec6Ip8rNN7n03tK2l9vIaV107UIm
        TsBOazCBNxb2oDGfiiQNLt8ogdyPMhKnbFBDghY3aw==
X-Google-Smtp-Source: ABdhPJxYIuKJ2FPIIDSc4fLvVsbvhDs4vwhRgTwzcnsP3YQbp/Eiiw42aHUKGWVr36iO8wKIwRx2XebS9rnI749AuKw=
X-Received: by 2002:a6b:bc82:: with SMTP id m124mr4580365iof.172.1599676473721;
 Wed, 09 Sep 2020 11:34:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200905130336.967622-1-luka.kovacic@sartura.hr>
 <20200905130336.967622-5-luka.kovacic@sartura.hr> <CAHp75VfwPa9zL6HCz+qqXJ1rK2JB=ewRiK1qdrgsyxixA5R5Lg@mail.gmail.com>
 <20200909103638.GB9222@amd> <CAHp75VcV6Tn8dVjWhOW7bfcjwA_Vabw91FJ=OYit3e1rvPp1qQ@mail.gmail.com>
In-Reply-To: <CAHp75VcV6Tn8dVjWhOW7bfcjwA_Vabw91FJ=OYit3e1rvPp1qQ@mail.gmail.com>
From:   =?UTF-8?B?THVrYSBLb3ZhxI1pxI0=?= <luka.kovacic@sartura.hr>
Date:   Wed, 9 Sep 2020 20:34:22 +0200
Message-ID: <CADZsf3ZH5BAJO_0+sWtXfZuOMdOmJGFWaU_AmgOt0wDjt2_U0g@mail.gmail.com>
Subject: Re: [PATCH 4/7] drivers: leds: Add the iEi WT61P803 PUZZLE LED driver
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-hwmon@vger.kernel.org,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Jason Cooper <jason@lakedaemon.net>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Luka Perkov <luka.perkov@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello everyone,

I'm sending the email again, as I didn't send it as plain text
earlier, sorry.

Thanks for the comments, I'll review them and fix the issues.

This is currently the only iEi Puzzle series device that is using this
microcontroller. Their Intel-based platforms most likely will not use
this MCU, as they resorted to using more standard components there.

Some upcoming iEi Puzzle ARM-based boards might also implement this
microcontroller, so I do agree that using the new API would be beneficial
to future proof the driver.

Kind regards,
Luka

On Wed, Sep 9, 2020 at 3:52 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Sep 9, 2020 at 1:36 PM Pavel Machek <pavel@ucw.cz> wrote:
> > > > Add support for the iEi WT61P803 PUZZLE LED driver.
> > > > Currently only the front panel power LED is supported.
> > > >
> > > > This driver depends on the iEi WT61P803 PUZZLE MFD driver.
> > >
> > > Can we make it OF independent?
> > > See below how to achieve this.
> >
> > Is there reason to believe this will be found in non-OF systems?
>
> It's one aspect. Another one is to give a better example to anybody
> who might use this to copy'n'paste from. I believe that most of the
> LED drivers can appear on non-DT systems.
>
> --
> With Best Regards,
> Andy Shevchenko
