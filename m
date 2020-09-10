Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E64F3265A7A
	for <lists+linux-leds@lfdr.de>; Fri, 11 Sep 2020 09:24:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725535AbgIKHYr (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 11 Sep 2020 03:24:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725468AbgIKHYq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 11 Sep 2020 03:24:46 -0400
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0C89C061573;
        Fri, 11 Sep 2020 00:24:45 -0700 (PDT)
Received: by mail-il1-x142.google.com with SMTP id u20so8162737ilk.6;
        Fri, 11 Sep 2020 00:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yDDPYjQ6DUX6xXLMzgBfV6buP3oYPEgo+EN2kc6eWTY=;
        b=VCg1Rxdg/5MOXY5w9Loq/ArIKnhcyC7pdwtI0PJCD0vVfIdVBX+RvdOd1Q5EE/A53w
         HWGWf0JGtxHP61Zr4h8gH4j26j5SNSoxD3vtLuGw3a0z0WxP89DkWfDwDzZcnX1R76Ic
         jXruVD3rEZ4UXYCNvS2a7SCyOmZW8U+yp5ao+bAfosxKLd2YKefNhRYzjaJSwazSk08G
         v654syyecqb4nuwrs7j4hZIwCdFoj/l0Ei56xgFfWkIAn4dksivJxtmTJHXaJn+CYlHl
         YLMUqkbMZRmVZbV0VPKguJqZFYMyTDpGNyYxSUjXRJrxYEL6h6Dj3bXA5NYbLYpMKZqk
         ClfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yDDPYjQ6DUX6xXLMzgBfV6buP3oYPEgo+EN2kc6eWTY=;
        b=RVJNr63JskiF1nzWeNemM12GGz8sZdEXjX/imBTGpV6I2pAjKqzhoXovUfvKTbQoug
         eD1vxldOAxSy8JPmWl3QvzLtH8XL1zmdr5cTsl4fbsObTsOnWWM2Wm4FnoJi9yK/8Cig
         d9X3WR9KKTa2i1x1pjw0cMx5zhDfDlbo0QUjiJ/S3Tl9a3NLYIbSVt/pKiCFmYD+tpfG
         xIE0/KfrS1f6pQ9QromsxXlZH/bqGQTVC2yrfv2EHAvCjkO5t0NE0jmx3hPA+ZuJ7H8e
         zOV4LLA85fmSLesqqlOn0WPWDeH3rbIVUYd0Yo0samsxygNx5U/unEKFtPeb4NuKtfmF
         iweg==
X-Gm-Message-State: AOAM531s2oQbAggfVFLYaSm0UEWKtvRBFNwem3VviHcGnTxmkEmPq7x1
        CWcLT1QQaQrwOS8UEuUciHI5Qazyr7SuGDFHQY/CAfNT3aM=
X-Google-Smtp-Source: ABdhPJzhSZZfBvon++gRijFHc6uMrRA3K01c6hT3xUWA9CJkZCyxj2DMSIaOlblADANdWJCoh65AMYrunuU/yZTx3G4=
X-Received: by 2002:a92:d1d1:: with SMTP id u17mr699311ilg.127.1599809083413;
 Fri, 11 Sep 2020 00:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <1599474459-20853-1-git-send-email-gene.chen.richtek@gmail.com>
 <1599474459-20853-2-git-send-email-gene.chen.richtek@gmail.com>
 <559a568e-3a2e-33c6-43aa-547a18f8e26b@gmail.com> <20200911070503.GA9818@amd>
In-Reply-To: <20200911070503.GA9818@amd>
From:   Gene Chen <gene.chen.richtek@gmail.com>
Date:   Fri, 11 Sep 2020 07:24:31 +0800
Message-ID: <CAE+NS34aKmu0tjnCPg3nF_vB0ELKsKwZSOeEXsm5V9aPAqqSbQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] leds: mt6360: Add LED driver for MT6360
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, robh+dt@kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
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

Pavel Machek <pavel@ucw.cz> =E6=96=BC 2020=E5=B9=B49=E6=9C=8811=E6=97=A5 =
=E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:05=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi!
>
> > >+{
> > >+    struct mt6360_led *led =3D container_of(lcdev, struct mt6360_led,=
 flash.led_cdev);
> > >+    struct mt6360_priv *priv =3D led->priv;
> > >+    u32 enable_mask =3D MT6360_TORCHEN_MASK | MT6360_FLCSEN_MASK(led-=
>led_no);
> > >+    u32 val =3D (level) ? MT6360_FLCSEN_MASK(led->led_no) : 0;
> > >+    u32 prev =3D priv->fled_torch_used, curr;
> > >+    int ret;
> > >+
> > >+    dev_dbg(lcdev->dev, "[%d] brightness %d\n", led->led_no, level);
> > >+    if (priv->fled_strobe_used) {
> > >+            dev_warn(lcdev->dev, "Please disable strobe first [%d]\n"=
, priv->fled_strobe_used);
> >
> > Doesn't hardware handle that? IOW, what happens when you have enabled
> > both torch and flash? If flash just overrides torch mode, than you
> > should not prevent enabling torch in this case.
>
> Yep, this is strange/confusing... and was reason why I asked for not
> supporting strobe from sysfs.
>
> Could I get you to remove code you are not commenting at when
> reviewing?
>

MT6360 FLED register define is STROBE_EN/TORCH_EN/CS1/CS2 (current
source) 4 bits.
The STROBE_EN/TORCH_EN is shared by FLED1 and FLED2.
If I want to enable FLED1 torch mode, I set TORCH_EN and CS1
If I want to enable FLED2 strobe mode, I set STROBE_EN and CS2
For example I set FLED1 torch, then I set FLED2 strobe.
When I set FLED2 strobe, I will see the strobe current is FLED2 add
FLED1 current which is not I want.
So I need disable FLED1 torch first.
Considering every circumstances is complicated when share same H/W
logic control.
And the other problem is torch mode switch to strobe mode needs ramp
time because strobe and torch mode can't be co-exist.

> > >+MODULE_AUTHOR("Gene Chen <gene_chen@richtek.com>");
> > >+MODULE_DESCRIPTION("MT6360 Led Driver");
>
> Led -> LED.
>

ACK

>                                                                         P=
avel
> --
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/b=
log.html
