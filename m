Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB4B9264584
	for <lists+linux-leds@lfdr.de>; Thu, 10 Sep 2020 13:51:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730166AbgIJLvz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 10 Sep 2020 07:51:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729779AbgIJLsp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 10 Sep 2020 07:48:45 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF1CBC061573;
        Thu, 10 Sep 2020 04:46:26 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id z19so4467737pfn.8;
        Thu, 10 Sep 2020 04:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Nw0E6gxQ2hI2c4XtcGgjWtuM2BIER2w0GyM871TVHiE=;
        b=TA0eyE+C1G8SDT1g5ewoXGJN+Pte1ilhz6PSvNsNQH/mV4ErK+fr1FKYJ9wwPMZILn
         Ed9l1+V5/pBZwg5KGPHzH1iXJCdMvytO1u91dfuuG+lMPlsArNoDH+qw7TUyX0uiGSc+
         VXGaMnOwU72TeQuVxi9MIWYcowk6asEF0ZqZ6tufgjirVCiWVm3rsYZnUaRnh+2shh/z
         NQ5hL/IDyaxFs4dIWHN7DIGNG7A0eZwb+btta7syG8UFhXCh07oWcy4FrSD7DXR2tKnY
         TDOBpN1OMQz5PcPCCq662olaEJv89X4VHgMO5GRUc3beDuHuLwWCgHU6dTHXkIVBnwib
         RRIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Nw0E6gxQ2hI2c4XtcGgjWtuM2BIER2w0GyM871TVHiE=;
        b=KurtnkqvzfgvUeTd3yApv+ZEop9d9SIxU9LWF/bNji6+5vpHrMrZfR9tM7wIMiK1/U
         u9OuayzLNA74+qi6hoTnSzVXDx1gZtAkFE+N3g31L+2g8c4jVwzEI38QZ3kQsWPMVuwi
         ssk1XdRIKUl5QjIlQoihMFNvsZ86J+cABYU1lbUofJBjJ6OZiCydfI1to2lxIHk2ORGZ
         OTtKfVjUpN70qCTNweLbBKSYRioAWUzD80lzGfwjQ2vX15INQyry0f+Z426GFvvXXflw
         uwxzPGqfxa93ddYHZ5nlRfyJxO87uJkd7tttUH/H4Krhj7h0EM8GTXF3YubJkx7lTjCA
         riMQ==
X-Gm-Message-State: AOAM530Dk1Aw+2VCL+KrETO6PCM623ZiSzUNsTcqPhS6Kl9ZN2FXoErF
        UyADLFFmBPuWVlTCCCqyYrTF6i3PxdEYd49dXts=
X-Google-Smtp-Source: ABdhPJwpLTvKve2riypUG+0ME7LX2XWWhl8ZwU5Y5Lg5Cj0ecvXaABCi2XmCtinoJjzwlOm6SQanVtnbYUXx1NFPLMs=
X-Received: by 2002:a63:ec4c:: with SMTP id r12mr4068361pgj.74.1599738385970;
 Thu, 10 Sep 2020 04:46:25 -0700 (PDT)
MIME-Version: 1.0
References: <1599474459-20853-1-git-send-email-gene.chen.richtek@gmail.com>
 <1599474459-20853-2-git-send-email-gene.chen.richtek@gmail.com>
 <CAHp75VdLDvoQicP1nLnjOiit6qjaw9n7+LuJ-J3MtaoHUOa_2g@mail.gmail.com> <CAE+NS35FETQ9ASJeYP=Sa8dm7ohRBcdAwUioCAnHPY2TiD4pNA@mail.gmail.com>
In-Reply-To: <CAE+NS35FETQ9ASJeYP=Sa8dm7ohRBcdAwUioCAnHPY2TiD4pNA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 10 Sep 2020 14:46:08 +0300
Message-ID: <CAHp75VdeqiMdm=zS7W9sfu7=hVFMo0NV6kTOZ_q6UNq9jFcNuA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] leds: mt6360: Add LED driver for MT6360
To:     Gene Chen <gene.chen.richtek@gmail.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
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
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Sep 10, 2020 at 11:11 AM Gene Chen <gene.chen.richtek@gmail.com> wr=
ote:
> Andy Shevchenko <andy.shevchenko@gmail.com> =E6=96=BC 2020=E5=B9=B49=E6=
=9C=889=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=889:48=E5=AF=AB=E9=81=
=93=EF=BC=9A
> > On Mon, Sep 7, 2020 at 1:31 PM Gene Chen <gene.chen.richtek@gmail.com> =
wrote:
> > > From: Gene Chen <gene_chen@richtek.com>

...

> > > +       if (priv->fled_strobe_used) {
> > > +               dev_warn(lcdev->dev, "Please disable strobe first [%d=
]\n", priv->fled_strobe_used);
> > > +               return -EINVAL;
> >
> > Hmm... Shouldn't be guaranteed by some framework?
> >
>
> Because both Flash LED use single logically control.
> It doesn't exist one LED is torch mode, and the other is strobe mode.

You mean you have always an attribute for hardware even if it doesn't
support a feature?
Can you consider hiding attributes?

...

> > > +       lcdev->max_brightness =3D (val - MT6360_ITORCH_MIN) / MT6360_=
ITORCH_STEP + 1;
> >
> > DIV_ROUND_UP(val - MT6360_ITORCH_MIN, MT6360_ITORCH_STEP) ?
> >
>
> This is mapping 0~val to 1~max_brightness as level.
> I convert val below MT6360_ITORCH_STEP to 1 for ignore max_brightness
> =3D 0, because 0 means disable.
> There is a little difference from DIV_ROUND_UP.

What div_round_up does is
(x + y - 1) / y
What do you do

x / y + 1 =3D (x + y)/y =3D ((x + 1) + y - 1)/y =3D DIV_ROUND_UP(x+1,y)

So, DIV_ROUND_UP(val - MT6360_ITORCH_MIN + 1, MT6360_ITORCH_STEP) ?

(yes I made classical off-by-one error)

--=20
With Best Regards,
Andy Shevchenko
