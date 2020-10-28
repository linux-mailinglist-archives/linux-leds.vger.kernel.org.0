Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FB8429D988
	for <lists+linux-leds@lfdr.de>; Wed, 28 Oct 2020 23:56:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389785AbgJ1Wz0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 28 Oct 2020 18:55:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732667AbgJ1Wxu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 28 Oct 2020 18:53:50 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E451C0613CF;
        Wed, 28 Oct 2020 15:53:49 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id y16so1058605ljk.1;
        Wed, 28 Oct 2020 15:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rC3edYnrhzYXvFCRGJWXwN8vFaoNf3fqgIxQT06XjcQ=;
        b=CsflZFC1EVOpFXsLvx03rEdAi0iyhCRvqTZ7CHxBsqWiMSZwrojs6yXI6ipBE30H6k
         OZWhlJEJ4h+j0Aq1+hsmRQDOLVsbkJh/jxvedR7aG0SeM6rCHa9mNa4nSDe4Od5tbpPT
         5gagk1hV08PbY2tmSdCOeA1AOe+kWy3VcYOoWslYV8xVJBq2td1xCKbmbJw/7r1z1l7n
         PjJypUkg+oC8mKi+0mnQSuCnBXWfMVqWO7uv6Dty2LpIA/shjFjy/anAxywKyl3WxdOi
         3fR4+StH6xMkK6gBAtIGa8rRbJpK8tFoQRODf+YLIB1xHfnfOfuc69l+NB8sGKpxxwyt
         3IaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rC3edYnrhzYXvFCRGJWXwN8vFaoNf3fqgIxQT06XjcQ=;
        b=rUzr7ov0JH0QCvBObWbHknIP1XdYF4FZSQO5PrOYMh57/iBtCyQnGtFcU5XUOJ2/6H
         epFrj7x2QEB5aZE7mzFwlec/6yhjAXhTFWVGXkQYiTNEDXO4Hjn4MDRJshqQ43gcwn+y
         yW3CrZxW4zcW66jbnEolv1gmoQqTQcrI/EOp/1yww4WZsDVIAFvmUqXQDrUiZIvscvOy
         t9NHtqNbc6YAsgHt+wPmsjJpxwHafNnc9P0YmU/OSBDih8tOdCVZaGVNFcLRIoK3mErU
         BzDftsqDzLtslhtAC9Iq5s8QU811FnrsG1HSCPyQ2Uubb722eQqJcQ8dKpSkDsETZdxY
         Gn9Q==
X-Gm-Message-State: AOAM531OJIUTmp6qnBkWW/UNiFw7dtwIXWAwqbOxC8SEbmk6su4Gc0mK
        P4Krxaw0XBvhQ3cKrRpt8Tq7CHX687H/OpMYJWZbTlmdeiydxw==
X-Google-Smtp-Source: ABdhPJxAsroU0VHqaY55EGB7GG0qb1U75bFxdIuKXL6hovDSKNC0EmGz3z+m282ND9pzHs03g7U2AVxSVlh1yXKUDH4=
X-Received: by 2002:ac2:57c7:: with SMTP id k7mr2096036lfo.20.1603861074212;
 Tue, 27 Oct 2020 21:57:54 -0700 (PDT)
MIME-Version: 1.0
References: <1603784069-24114-1-git-send-email-u0084500@gmail.com>
 <20201027082900.GA21354@amd> <b0f5b3c8-bebd-eeb6-20b2-15529816720c@gmail.com>
In-Reply-To: <b0f5b3c8-bebd-eeb6-20b2-15529816720c@gmail.com>
From:   ChiYuan Huang <u0084500@gmail.com>
Date:   Wed, 28 Oct 2020 12:57:42 +0800
Message-ID: <CADiBU3_x=9wvPv4_YxWx4H_ecV7Kbt5ur91SDv+unH4z2hzS_Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] leds: rt4505: Add support for Richtek RT4505 flash
 led controller
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, dmurphy@ti.com, robh+dt@kernel.org,
        linux-leds@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
        cy_huang <cy_huang@richtek.com>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

Jacek Anaszewski <jacek.anaszewski@gmail.com> =E6=96=BC 2020=E5=B9=B410=E6=
=9C=8828=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=8812:40=E5=AF=AB=E9=81=
=93=EF=BC=9A
>
> Hi Pavel, ChiYuan,
>
> On 10/27/20 9:29 AM, Pavel Machek wrote:
> > Hi!
> >
> >> From: ChiYuan Huang <cy_huang@richtek.com>
> >>
> >> Add support for RT4505 flash led controller. It can support up to 1.5A
> >> flash current with hardware timeout and low input voltage
> >> protection.
> >
> > Please use upper-case "LED" everywhere.
> >
> > This should be 2nd in the series, after DT changes.
> >
> >> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> >> ---
> >>   drivers/leds/Kconfig       |  11 ++
> >>   drivers/leds/Makefile      |   1 +
> >>   drivers/leds/leds-rt4505.c | 397 +++++++++++++++++++++++++++++++++++=
++++++++++
> >>   3 files changed, 409 insertions(+)
> >>   create mode 100644 drivers/leds/leds-rt4505.c
> [...]
> >> +static int rt4505_torch_brightness_set(struct led_classdev *lcdev, en=
um led_brightness level)
> >> +{
> >
> > 80 columns, where easy.
> >
> >> +    struct rt4505_priv *priv =3D container_of(lcdev, struct rt4505_pr=
iv, flash.led_cdev);
> >> +    u32 val =3D 0;
> >> +    int ret;
> >> +
> >> +    mutex_lock(&priv->lock);
> >> +
> >> +    if (level !=3D LED_OFF) {
> >> +            ret =3D regmap_update_bits(priv->regmap, RT4505_REG_ILED,=
 RT4505_ITORCH_MASK,
> >> +                                     (level - 1) << RT4505_ITORCH_SHI=
FT);
> >> +            if (ret)
> >> +                    goto unlock;
> >> +
> >> +            val =3D RT4505_TORCH_SET;
> >> +    }
> >> +
> >> +    ret =3D regmap_update_bits(priv->regmap, RT4505_REG_ENABLE, RT450=
5_ENABLE_MASK, val);
> >> +
> >> +unlock:
> >> +    mutex_unlock(&priv->lock);
> >> +    return ret;
> >> +}
> >
> > Why is the locking needed? What will the /sys/class/leds interface
> > look like on system with your flash?
>
> The locking is needed since this can be called via led_set_brightness()
> from any place in the kernel, and especially from triggers.
From this case, It means only led classdev
brihtness_get/brightness_set need to be protected.
I search led_flash_classdev, it only can be controlled via sysfs or V4l2.
Like as described in last mail, flash related operation is protected
by led access_lock and v4l2 framework.
I'll keep the locking only in led classdev brightness_get/brightness_set AP=
I.
If I misunderstand something, please help to point out.
Thx.
>
> --
> Best regards,
> Jacek Anaszewski
