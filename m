Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72319258E55
	for <lists+linux-leds@lfdr.de>; Tue,  1 Sep 2020 14:41:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727949AbgIAMlJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 1 Sep 2020 08:41:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728037AbgIAM3x (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 1 Sep 2020 08:29:53 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A800C06124F;
        Tue,  1 Sep 2020 05:29:49 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id g14so1006804iom.0;
        Tue, 01 Sep 2020 05:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nr3oAO1J7ou/Wa9BRVlR/mWJbOSg9zgxTm5r/RYqoxo=;
        b=CWt5TTyFycCJCtjJPv8aWy8tpmsRd8b/odwKabtR23wfFxkLqHSNKNG41TvRZHSAF1
         u1ZjDzx+V7+Un/FOxvqZNnaIwViOUFnKv8+IDkqp/amKHRaROg5FjoikQvk/UcHTvVhg
         dUeSyBvmhuMLAC3ShQr7SqvYMxG0ums6/1iPOoawhFdq/NG6mETYKZTTGbMfhWJ2HVsl
         vL60M+aBY95RET5WKuUFFrQn/ZRVslJR9zJmR+GTKcduhqny4OwwPTj/mfo5VdtNVekY
         qrFNcPKoGmd1xDeK63cX/W5BhGvWK4IGrn4jlJnqofXBtZZDh767L+P8JkPsQJup9WO1
         I3Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nr3oAO1J7ou/Wa9BRVlR/mWJbOSg9zgxTm5r/RYqoxo=;
        b=D9Oqzk34YRAZzrIRnx7iGjQHp5UQprgWN9gncft21SB7ND60vBZrwfZK6BfuKWYbsW
         WYoCW55103xJktZuMAyF0WIz1/xP8o6zfhTRYIoQUjje3o/PRqEy8adwkNSLcUsheGfc
         T3q8t8WBjTtiL7fVODxxI90wG+WMn06VU0PIcYhbmqfjFpnsjLJ5LtqMuj8P6vRwh5j5
         t0KwXmvTYWDzWJgD0Ox7wA5Ultg3nwUEJwx53B6NhSJCeIfmL4OUy8FkhJDtLSe28udo
         WV96PTIm6J6oURCbOnQCUjvBMlwTVd3/2CMx9DLCR0B10+TFWnAnwXM6wcySZ5P2PlQI
         L+pA==
X-Gm-Message-State: AOAM530rNPr2gFaSPXKWGOPHelbQ2X25r35kmjFHytFUxlblU3MmiALS
        jDxCHy+2mOdZqRwsgYk6G7GQCv/JwG0Jsvb/ycE=
X-Google-Smtp-Source: ABdhPJyoc+ysyeuiX9W3a9XcXr6aUKFAc1uY9bosrpv8NxM0mimkeTh0YjpVyD3McAmhUwVQkjUVzsH5DCRKbbjXjLE=
X-Received: by 2002:a5e:8e0a:: with SMTP id a10mr1255594ion.200.1598963388756;
 Tue, 01 Sep 2020 05:29:48 -0700 (PDT)
MIME-Version: 1.0
References: <1598441840-15226-1-git-send-email-gene.chen.richtek@gmail.com>
 <1598441840-15226-2-git-send-email-gene.chen.richtek@gmail.com> <f35bf9c1-6397-3369-954d-fe05d77438cd@infradead.org>
In-Reply-To: <f35bf9c1-6397-3369-954d-fe05d77438cd@infradead.org>
From:   Gene Chen <gene.chen.richtek@gmail.com>
Date:   Tue, 1 Sep 2020 20:29:37 +0800
Message-ID: <CAE+NS36MAwNJkbNV30h=bjB6UnW8u9XuzNkDB4Nor=x63Oz3Eg@mail.gmail.com>
Subject: Re: [PATCH 1/2] leds: mt6360: Add LED driver for MT6360
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Gene Chen <gene_chen@richtek.com>, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Randy Dunlap <rdunlap@infradead.org> =E6=96=BC 2020=E5=B9=B48=E6=9C=8826=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=8811:30=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On 8/26/20 4:37 AM, Gene Chen wrote:
> > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> > index 1c181df..ce95ead 100644
> > --- a/drivers/leds/Kconfig
> > +++ b/drivers/leds/Kconfig
> > @@ -271,6 +271,17 @@ config LEDS_MT6323
> >         This option enables support for on-chip LED drivers found on
> >         Mediatek MT6323 PMIC.
> >
> > +config LEDS_MT6360
> > +     tristate "LED Support for Mediatek MT6360 PMIC"
> > +     depends on LEDS_CLASS_FLASH && OF
> > +     depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
> > +     depends on MFD_MT6360
> > +     help
> > +       This option enables support for dual Flash LED drivers found on
> > +       Mediatek MT6360 PMIC.
> > +       Support Torch and Strobe mode independently current source.
>
>           Supports                      independently of current source.
>
> I'm guessing on that ending; I wasn't sure what was intended, but it does=
n't
> make sense as posted.
>
>

I want to say is fled1/2 can independently control.
For example, fled1 in strobe mode, or fled2 in torch mode,
or both fled1 and fled2 in torch or strobe mode

> > +       Include Low-VF and short protection.
>
>           Includes
>

ACK

> > +
> >  config LEDS_S3C24XX
> >       tristate "LED Support for Samsung S3C24XX GPIO LEDs"
> >       depends on LEDS_CLASS
>
>
> thanks.
> --
> ~Randy
