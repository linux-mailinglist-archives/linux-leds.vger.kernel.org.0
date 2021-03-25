Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 579D5348AB2
	for <lists+linux-leds@lfdr.de>; Thu, 25 Mar 2021 08:53:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbhCYHwo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 25 Mar 2021 03:52:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229913AbhCYHwN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 25 Mar 2021 03:52:13 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 414FBC06174A;
        Thu, 25 Mar 2021 00:52:13 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id z25so1950128lja.3;
        Thu, 25 Mar 2021 00:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lnLwy/Jou0XEIdxcSbSHHdhXEPhOau+eCiT2vPBYoiU=;
        b=YOA7+c+dcDSzMeDuPXg4dJGhBKysRgqSFzTQ4F+VSwVUetrPijpfxk1S5g2vitN3S7
         tgr2eMM+RkM+zkuL52oySLTvklg3e2UlpDxrmZ3dniv8sh8lsgyatMUBfpGHBElgdjwL
         FOIIfz9fR05lUCc0shZHOAJBBbnA80KQ21NpWFj4YJOAzqrPaCcOidOPgWQ8SAnfiSPz
         EcJ2zSiKAsz3xiCmiifL8hZtCk9hkSQkdJ01CZh0b1B8n78JNpRmzkwT3x2ryRlHpGdB
         Bxx14tOjjeZrxDSeIKtuv38xRTmTUEUCUMduYN6vasI9FHWPVAxkWLFSGlGMeABp2oFI
         3VqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lnLwy/Jou0XEIdxcSbSHHdhXEPhOau+eCiT2vPBYoiU=;
        b=R3lch5OvBGcSRsTlOAwxzxJqng9yP8iLB0yyx43NozR+5q5Y/0yE4eX8PGhgJGfRMp
         C7K/oPSxLTWALY/m0gdBRK8qq3p7++M1U+k4y69vMqnklRbbaaEJxBL0+ySkQt59FAt6
         ZisP03I5JXcLEC+EIS0m/ho7hOmJFpFU6AtZWHgJCCEjmxNE46WI9ObiHSS1T9yBgNPw
         4jMLiLBvNB4jOHkilNhMC2k7weuG1faLqO0Wo+sE7aX06CqxSMQRN/AcvhgKKhvuBDyH
         roz6JWtN0MHDrOfB5gcExiRXep3nDxcnZb+W2jjcbaWyVCbtqGgFPrb9F1LHvPgfQFVH
         2eVA==
X-Gm-Message-State: AOAM530FqdFwX4cLmvG5lN1qD6iO9HlAp0aT4uhutpzMppweCTh/vlCX
        YqROxKNmnwy9cjt4Rz0QG5lGBzGzzZynkfiLl9Q=
X-Google-Smtp-Source: ABdhPJzIDckoBV4B9YqIJBaupdyoDDSp1YMVagyRHCVdCoOf/5vuwMfVLnmaawNrLecmwBbS+ao+49uMtf/rj+p6mHo=
X-Received: by 2002:a2e:9591:: with SMTP id w17mr4773935ljh.141.1616658731697;
 Thu, 25 Mar 2021 00:52:11 -0700 (PDT)
MIME-Version: 1.0
References: <1604284946-16254-1-git-send-email-u0084500@gmail.com> <3cf3ee50-3dd8-d3b1-66a9-cea2ba487de3@gmail.com>
In-Reply-To: <3cf3ee50-3dd8-d3b1-66a9-cea2ba487de3@gmail.com>
From:   ChiYuan Huang <u0084500@gmail.com>
Date:   Thu, 25 Mar 2021 15:52:00 +0800
Message-ID: <CADiBU3-pDdoCioKc1mZwx7tp+_kfcN=4j-iMOT9LupXW03qwNA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] leds: rt4505: Add support for Richtek RT4505 flash
 LED controller
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        cy_huang <cy_huang@richtek.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi, Jacek:

Jacek Anaszewski <jacek.anaszewski@gmail.com> =E6=96=BC 2020=E5=B9=B411=E6=
=9C=883=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=884:44=E5=AF=AB=E9=81=
=93=EF=BC=9A
>
> Hi ChiYuan,
>
> On 11/2/20 3:42 AM, cy_huang wrote:
> > From: ChiYuan Huang <cy_huang@richtek.com>
> >
> > Add support for RT4505 flash LED controller. It can support up to 1.5A
> > flash current with hardware timeout and low input voltage protection.
> >
> > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > ---
> > Changes since v1 to v2
> >
> > - Create flash directory into drvers/leds.
> > - Coding style fix to meet 80 charactors per line limit.
> > - Refine the description in the Kconfig help text.
> > - Change all descriptions for 'led' text to uppercase 'LED'.
> >
> > ---
> >   drivers/leds/Kconfig             |   2 +
> >   drivers/leds/Makefile            |   3 +
> >   drivers/leds/flash/Kconfig       |  17 ++
> >   drivers/leds/flash/Makefile      |   2 +
> >   drivers/leds/flash/leds-rt4505.c | 430 ++++++++++++++++++++++++++++++=
+++++++++
> >   5 files changed, 454 insertions(+)
> >   create mode 100644 drivers/leds/flash/Kconfig
> >   create mode 100644 drivers/leds/flash/Makefile
> >   create mode 100644 drivers/leds/flash/leds-rt4505.c
>
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>
Any problem with this patch? Do I need to submit it again?
> --
> Best regards,
> Jacek Anaszewski
