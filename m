Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF1EC3CB27F
	for <lists+linux-leds@lfdr.de>; Fri, 16 Jul 2021 08:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234465AbhGPGau (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 16 Jul 2021 02:30:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230011AbhGPGat (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 16 Jul 2021 02:30:49 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57E78C06175F;
        Thu, 15 Jul 2021 23:27:55 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id u11so9766124oiv.1;
        Thu, 15 Jul 2021 23:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=K/pyrr7Vafmg+dkNK/O4hCihXyzzFOW/LxGI4Zbc87U=;
        b=nKg+jweLtsF6DxnI1wFe8sPeoOw4yVlgk4aoKvIxGpvd4YOFmuDEJfUkkTQoMeb29O
         rYAISCiiAD/mmXYVnMFsTAlxU9Zt+JcURj+/zn9RvOcNPzAQWqjw4WWMagtiXRT9rW8f
         3t3KyqtSRVdFc651gj8N+2hIA+P1leWO00tDnIAxahVYS0U41o/AIajj2M94MkYnkNLG
         7hZzktnK10sKmpPE2ETxzS5/ct3mtzrH/KEtjqk1tjLlZg0XUM7IQlVAwQUFFToHTb/V
         dkM0COa+TRxxyiFkU4qHUgnUfg/7dM6nuyVJ9Eae/WxX/hXG/biQfRHzLi3+Tc7lELmG
         G8eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=K/pyrr7Vafmg+dkNK/O4hCihXyzzFOW/LxGI4Zbc87U=;
        b=IfoHEv4PtFVOionIzpK8C5PHdQjhg2tUPusATGbYI20b7ZLZOOoMJNc8AIEM/AARsD
         0QrRXVOemWsOzS2RjwG+RDXkOlggPP0b85vuAZ0cpxiPHcxwreP4tMF9RxkmYC4IQiGA
         sjLc9Et43TdLLZX/wTsD+GXC3QPrEsvoGa7dKyO0FcUstw0meDgWCCb7wrWQJtiEezMZ
         f+IopMEcK/i6VT4u2d4RkZHaN00xuV4hNute9FL3q/abgC37asUi/XanopV7rEsF/oTc
         mJektE6ewb+h6yxGbm78thA94s53lXDXI/1ri+WuzHZqPhSQ9tbS2VH9UTYPf6TokdyM
         FljA==
X-Gm-Message-State: AOAM533TDxaAwFhnowCYmXqmwUABcRRin4ErhEEDVQ1I6RIBYvD6900B
        ezQOGahC5q52sKwylx2XM4A9ziVTiKL8IYLBkSE=
X-Google-Smtp-Source: ABdhPJxW8kycciW2kOm+JGHD/kLp+IQUDWTe6n8MR0tec8pGCbiFVUh1ZLgFHcNOhWBaC4yavKTkFVMQqTeco1ceA1w=
X-Received: by 2002:a05:6808:bc1:: with SMTP id o1mr11285145oik.55.1626416874759;
 Thu, 15 Jul 2021 23:27:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210524152427.123856-1-gene.chen.richtek@gmail.com>
 <CAE+NS37kf1JAJ2Zt7UGsfsubp6O=xBNtnJgVEnz8-mm2rxFa+g@mail.gmail.com> <019cde8b-e4db-6ad4-fd71-5ed03f174da3@gmail.com>
In-Reply-To: <019cde8b-e4db-6ad4-fd71-5ed03f174da3@gmail.com>
From:   Gene Chen <gene.chen.richtek@gmail.com>
Date:   Fri, 16 Jul 2021 14:27:43 +0800
Message-ID: <CAE+NS34PLwP95=85r15_xHOPn-_OfdPWmXZ3MpHKEyO7StGpzw@mail.gmail.com>
Subject: Re: [PATCH v14 0/2] leds: mt6360: Add LED driver for MT6360
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Gene Chen <gene_chen@richtek.com>, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, ChiYuan Huang <cy_huang@richtek.com>,
        benjamin.chao@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek Anaszewski <jacek.anaszewski@gmail.com> =E6=96=BC 2021=E5=B9=B47=E6=
=9C=8813=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=884:24=E5=AF=AB=E9=81=
=93=EF=BC=9A
>
> Hi Gene,
>
> You still can carry my ack:
>
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>

Ok, thanks. I will add your ack in patch v15.

> On 7/12/21 10:33 AM, Gene Chen wrote:
> > Gene Chen <gene.chen.richtek@gmail.com> =E6=96=BC 2021=E5=B9=B45=E6=9C=
=8824=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=8811:24=E5=AF=AB=E9=81=93=
=EF=BC=9A
> >>
> >> This patch series add MT6360 LED support contains driver and binding d=
ocument
> >>
> >> Gene Chen (2)
> >>   dt-bindings: leds: Add bindings for MT6360 LED
> >>   leds: mt6360: Add LED driver for MT6360
> >>
> >>   Documentation/devicetree/bindings/leds/leds-mt6360.yaml |  159 ++
> >>   drivers/leds/flash/Kconfig                              |   13
> >>   drivers/leds/flash/Makefile                             |    1
> >>   drivers/leds/flash/leds-mt6360.c                        |  910 +++++=
+++++++++++
> >>   4 files changed, 1083 insertions(+)
> >>
> >> changelogs between v1 & v2
> >>   - add led driver with mfd
> >>
> >> changelogs between v2 & v3
> >>   - independent add led driver
> >>   - add dt-binding document
> >>   - refactor macros definition for easy to debug
> >>   - parse device tree by fwnode
> >>   - use devm*ext to register led class device
> >>
> >> changelogs between v3 & v4
> >>   - fix binding document description
> >>   - use GENMASK and add unit postfix to definition
> >>   - isink register led class device
> >>
> >> changelogs between v4 & v5
> >>   - change rgb isink to multicolor control
> >>   - add binding reference to mfd yaml
> >>
> >> changelogs between v5 & v6
> >>   - Use DT to decide RGB LED is multicolor device or indicator device =
only
> >>
> >> changelogs between v6 & v7
> >>   - Add binding multicolor device sample code
> >>   - Add flash ops mutex lock
> >>   - Remove V4L2 init with indicator device
> >>
> >> changelogs between v7 & v8
> >>   - Add mutex for led fault get ops
> >>   - Fix flash and multicolor no-ops return 0
> >>   - Add LED_FUNCTION_MOONLIGHT
> >>
> >> changelogs between v8 & v9
> >>   - reuse api in flash and multicolor header
> >>
> >> changelogs between v9 & v10
> >>   - add comment for reuse registration functions in flash and multicol=
or
> >>
> >> changelogs between v10 & v11
> >>   - match dt-binding reg property comment to the functionality name
> >>   - remove exist patch in linux-next
> >>   - dicide multicolor channel by color definitiion
> >>
> >> changelogs between v11 & v12
> >>   - Fix print size_t by %zu
> >>   - Fix dt-binding name regular experssion
> >>
> >> changelogs between v12 & v13
> >>   - Fix kbuild test rebot build error
> >>
> >> changelogs between v13 & v14
> >>   - Move driver to flash folder
> >>   - Remove LED FUNCTION MOONLIGHT
> >>   - Keep 80 char per line
> >>
> >>
> >
> > Dear Reviewers,
> >
> > Please let me know if any update.
> >
>
> --
> Best regards,
> Jacek Anaszewski
