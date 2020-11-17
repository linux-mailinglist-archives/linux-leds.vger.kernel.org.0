Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAAC62B560B
	for <lists+linux-leds@lfdr.de>; Tue, 17 Nov 2020 02:13:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731575AbgKQBKq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 16 Nov 2020 20:10:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727032AbgKQBKp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 16 Nov 2020 20:10:45 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27C84C0613CF;
        Mon, 16 Nov 2020 17:10:45 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id o24so22363511ljj.6;
        Mon, 16 Nov 2020 17:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=f3xcrWx9FduUeYZPgR1HGAP2kwlvurZfEgaa6FvL4rQ=;
        b=sttOg044ib+aE1p9NKK9p68iDQD4BHsbJmUVEvroVYV/RYdvNCbp6iVIGEAqIZInEO
         xcFGv5HWKDuendT8/RwaHUBaobnw/xnep9c0e4ia7wfws50EGXR8mgQWEnBxPZ13+lVR
         WNljP/SutKD6s5FkCZes4KRdjcWXJL6oprq0aVrLQbMIzGc19kjPnHM3+CXpp6t9ZAqb
         CAg7UlfKPl1vJhdzsvAbvicaV4VwTFuRG8LikvE9u0Gz195kOryRsEHQR5ffVC6GcZMF
         1R/1lHLkZ2wPHn1PN7x6XMwPCfO4nTOHatZWHUCCkLJ4iokS9QacM0q1bVbx0DLMvLcU
         608Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=f3xcrWx9FduUeYZPgR1HGAP2kwlvurZfEgaa6FvL4rQ=;
        b=sClOvHwdEH2IFjb8GF+VltoM7DdCA0W+cDSAX8XiMlFv65kQML5xzN+Q2BUOpX3JNE
         Lnwmv1p4qyOoeVs9wVh072hOUh4tnXRG31rmOIFwcrdduHICGiHTH3nqWJHoQUX8fBu7
         40HPAFhualaSlUQRAe3/8CzdccCFNcnmwW2zVWMSRrLfa57bHPDPZyZ6UqcP9TyLAJ1z
         eGLTfInBvqum9XUCbccx48heIDKGB1Op5crz+PEPjthoI6pUv8wlTMeD6Pt9t+wwHiGi
         6RErtw12GQm4AVEyNWVucPWZ0WN7UtaHvist36iuUw76bvhisjzixv0AVaQ4iH0IZrj0
         ut1Q==
X-Gm-Message-State: AOAM530y111sB9lD12LFvD/QyYc+mJxcTcwVwjGnN2wr75p1yKkVcBFa
        ep1rcUF9NbzkRrx4nZqivbOaYmFp93hNyUJi6KA=
X-Google-Smtp-Source: ABdhPJyOKA1DJVQydgrgHvc7O5Q3gUAlqHNn3Op5buTuj8dR9mfyfySIUyuxe0VABs7GlogVZJ3pnssJZ1iFwkb8vPY=
X-Received: by 2002:a2e:b8cb:: with SMTP id s11mr786375ljp.154.1605575443580;
 Mon, 16 Nov 2020 17:10:43 -0800 (PST)
MIME-Version: 1.0
References: <1604284946-16254-1-git-send-email-u0084500@gmail.com> <CACRpkdbGs-LEWie2uzZEHxrac-0tuHqRtdDP0D22KnXKQ3rqGQ@mail.gmail.com>
In-Reply-To: <CACRpkdbGs-LEWie2uzZEHxrac-0tuHqRtdDP0D22KnXKQ3rqGQ@mail.gmail.com>
From:   ChiYuan Huang <u0084500@gmail.com>
Date:   Tue, 17 Nov 2020 09:10:32 +0800
Message-ID: <CADiBU3_C2J0p-gWx9KyZWXqX43VAn+bh6ac5TgvPp9xK9HjSQQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] leds: rt4505: Add support for Richtek RT4505 flash
 LED controller
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        cy_huang <cy_huang@richtek.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi, Jacek/Pavel:

Linus Walleij <linus.walleij@linaro.org> =E6=96=BC 2020=E5=B9=B411=E6=9C=88=
16=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=887:55=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> On Mon, Nov 2, 2020 at 3:42 AM cy_huang <u0084500@gmail.com> wrote:
>
> >  drivers/leds/flash/Kconfig       |  17 ++
> >  drivers/leds/flash/Makefile      |   2 +
> >  drivers/leds/flash/leds-rt4505.c | 430 +++++++++++++++++++++++++++++++=
++++++++
>
> Hm Pavel also asked me to create this directory and structure,
> so if this gets applied to the MFD tree there will be some
> serious clash.
>
> I can rebase on this patch set if Lee applies it first, they you
> need an immutable branch from Lee first to set up the build
> infrastructure in the LEDs tree, and then I can rebase on your
> tree once you have pulled in that.
>
> Yours,
> Linus Walleij

From linus walleij's mail, how can I support him?
Or just  wait my patch to be committed on linux main stream?
Due to this, how's the status about rt4505 patch?

Sincerely,
ChiYuan Huang.
