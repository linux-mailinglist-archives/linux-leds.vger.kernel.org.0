Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D291129A7DB
	for <lists+linux-leds@lfdr.de>; Tue, 27 Oct 2020 10:29:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2895046AbgJ0J3E (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 27 Oct 2020 05:29:04 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:34627 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2895029AbgJ0J3E (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 27 Oct 2020 05:29:04 -0400
Received: by mail-ot1-f67.google.com with SMTP id k3so556054otp.1;
        Tue, 27 Oct 2020 02:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sgFjZIObLui97V1pIxflfNxV2YXVCYIopn9YOyvuSZ0=;
        b=Krr4jShPctiCY36G2WXzjkwBkSSXI15qqafmMA7Nny9kb2qGvsfFbBVMeMhiWeKU7r
         9Our9rSmPOq1P8DYMd1fbvlOLvh/YNaH6gGipsT00sY160lepyETkMwogA37DnRcTX8q
         qvKrgk60Myw4VC/iS9AHE5aAxFrrKOnYvdfcnUHoQrXnE3X8LrlLuab4C91Mixz2Tqwe
         V7rYK9GuTgeHR0gGG1NziQuhlo6pqfzVZ4P27u9usOGdU9RVsKqVWhEelF9ep8hYFa4f
         5kULVUTujC/6/RoT7gFGmWyKJQs+JbDY2HdhMIzioIBqd739uzx/Wt7AxZoD5ZgUsMKc
         IUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sgFjZIObLui97V1pIxflfNxV2YXVCYIopn9YOyvuSZ0=;
        b=YvwZpnvh2/WfZ4Yc0eW9Zx/YzPr9jZj0vAMTZ4gc1kLbbdX8TsN/UbB2YAud9EjvuZ
         RA2+OtQ171jsiShI4OvkwBZpZuLwZh+6E/UN57YkjedIk1T3HPLIHhLNQbpXnTmZfiUt
         BKb3wOW1HpQGclf9mLbEvLnu/Rj8IhloNEClFVO/ecmNXaJRyUyhlspFTphaUUa+Z4in
         7Z/XLT9IVrLuQ6BViByxqtvb5j4CzpaNYVDXAiYuRHophoQ4MGLuzQ1TfPBS7jdHn3GC
         bK/4KXPSquqONj2/0e5vB1M6IgED2GDWZSVvq5SmS0qeXFOvdI9tAZo6fk6/fILONsVc
         n4Bw==
X-Gm-Message-State: AOAM5314eri9hwT0crhA2Zb1fWpkp7/Agi384S/WG+KQyvuoCvyg3/j6
        qXEL3Nq05+ALOxge979szX9nhAZElKHQy8ADn5I=
X-Google-Smtp-Source: ABdhPJxpYV4rEorf2QEsAUwlP2G0D0Aeuljy4KNnLX1qLc2TcDwV6guRYjpFyNnOtSOQ8cug34OzBCRBEvTuWa4UEE0=
X-Received: by 2002:a9d:6d15:: with SMTP id o21mr858982otp.232.1603790943415;
 Tue, 27 Oct 2020 02:29:03 -0700 (PDT)
MIME-Version: 1.0
References: <1602034966-3524-1-git-send-email-gene.chen.richtek@gmail.com>
 <1602034966-3524-3-git-send-email-gene.chen.richtek@gmail.com>
 <5a9b31c4-739c-06fc-2015-ed474993ad22@gmail.com> <CAE+NS35Y41mFKNhj+54BeeSYFu2J9BtvMWOxyMcf9a==39cbdA@mail.gmail.com>
 <8925db23-5cc4-3c5f-932a-461fe6450dad@gmail.com>
In-Reply-To: <8925db23-5cc4-3c5f-932a-461fe6450dad@gmail.com>
From:   Gene Chen <gene.chen.richtek@gmail.com>
Date:   Tue, 27 Oct 2020 17:28:51 +0800
Message-ID: <CAE+NS379bgtRotqzioR+Ya3mE1kZrKfe9qV=W2p=hH7Omrn8Hw@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] leds: mt6360: Add LED driver for MT6360
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Gene Chen <gene_chen@richtek.com>, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek Anaszewski <jacek.anaszewski@gmail.com> =E6=96=BC 2020=E5=B9=B410=E6=
=9C=8821=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=885:47=E5=AF=AB=E9=81=
=93=EF=BC=9A
>
> On 10/20/20 8:44 AM, Gene Chen wrote:
> > Jacek Anaszewski <jacek.anaszewski@gmail.com> =E6=96=BC 2020=E5=B9=B410=
=E6=9C=889=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=885:51=E5=AF=AB=E9=
=81=93=EF=BC=9A
> >>
> >> Hi Gene,
> >>
> >> On 10/7/20 3:42 AM, Gene Chen wrote:
> >>> From: Gene Chen <gene_chen@richtek.com>
> >>>
> >>> Add MT6360 LED driver include 2-channel Flash LED with torch/strobe m=
ode,
> >>> 3-channel RGB LED support Register/Flash/Breath Mode, and 1-channel f=
or
> >>> moonlight LED.
> >>>
> >>> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> >>> ---
> >>>    drivers/leds/Kconfig       |  12 +
> >>>    drivers/leds/Makefile      |   1 +
> >>>    drivers/leds/leds-mt6360.c | 783 +++++++++++++++++++++++++++++++++=
++++++++++++
> >>>    3 files changed, 796 insertions(+)
> >>>    create mode 100644 drivers/leds/leds-mt6360.c
> >>>
> >>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> >>> index 1c181df..c7192dd 100644
> >>> --- a/drivers/leds/Kconfig
> >>> +++ b/drivers/leds/Kconfig
> >>> @@ -271,6 +271,18 @@ config LEDS_MT6323
> >>>          This option enables support for on-chip LED drivers found on
> >>>          Mediatek MT6323 PMIC.
> >>>
> >>> +config LEDS_MT6360
> >>> +     tristate "LED Support for Mediatek MT6360 PMIC"
> >>> +     depends on LEDS_CLASS_FLASH && OF
> >>> +     depends on LEDS_CLASS_MULTICOLOR
> >>
> >> Since CONFIG_LED_CLASS_MULTICOLOR can be turned off you need to have
> >> below instead:
> >>
> >> depends on LEDS_CLASS_MULTICOLOR || !!LEDS_CLASS_MULTICOLOR
> >>
> >> Unless you want to prevent enabling the driver without RGB LED,
> >> but that does not seem to be reasonable at first glance.
> >>
> >
> > May I change to "select LEDS_CLASS_MULTICOLOR"?
> > I suppose RGB always use multicolor mode.
>
> You will also have moonlight LED that will not need multicolor
> framework. Is it somehow troublesome to keep "depends on"?
>

If only use ML LED and FLED,  DTSI will only define ML LED and FLED.
Therefore, the drivers probe will not register rgb multicolor device.
I will remove "depends", use "select" instead.

> --
> Best regards,
> Jacek Anaszewski
