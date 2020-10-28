Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E1E629D754
	for <lists+linux-leds@lfdr.de>; Wed, 28 Oct 2020 23:23:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732141AbgJ1WXP (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 28 Oct 2020 18:23:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732707AbgJ1WWp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 28 Oct 2020 18:22:45 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06E02C0613D1;
        Wed, 28 Oct 2020 15:22:45 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id v6so752666lfa.13;
        Wed, 28 Oct 2020 15:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Y4rpBP1ZPK1NF+eOD5UawQX3qZnudBwJVDTqXuwDYuI=;
        b=Lk09YH0K7QSeRT59OEL7O/tpVQW9qQIQA6PqEjePyJ8pyIlRrn0VTpvwd/2xBMu4+i
         KLXGBA1bFJ5PG3PpkvvikY4209uKnSw4gtDWZqWjE7QLYtq1zChbdcKAFCw5sLjESct3
         //q5NKoK11rdVejEdDqHRJpp/t04rLTbYPpOwtBShE+A+uwW5/9rTKLAE/wlTpCRW51m
         xa/8rvrPAYccTBIF9uijdOQD5EcpdUW0ahGX2HQSeama5fbFV29x/qmiPX7GdX8jRZdw
         J3VMjqkz+lI3iYJZkqwEjqeE1ggFw19sh7CYbrqh3y3DNXu7RuE5PrCor2cUnZbZZPOs
         5GXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Y4rpBP1ZPK1NF+eOD5UawQX3qZnudBwJVDTqXuwDYuI=;
        b=J/e6ZCyfXPnU9eYuMWYCL7H7HSZWQeCaHAjzeEEkFChp9pXRzlTvj7RrM7tcfSH1ZM
         5wtnb9ULhFejY7SW6WGxedrZH3wdPyk2RcMM5H8ucPvW/gsBX3o+k47Me+0ZSUoTz9VD
         oUV9Csk2hz7G+Ncm/R4h+6/TVoVIP4SyArWeE4+Wzis/qYib7tMV6Qo+qrn9ccmDH1Tf
         9HZH5Q42plUBQxReY129236i2GUweJopkpVPMmBtBiIj/WHfEqXfL/6bCCihkW3zOzHA
         G814hdz8wmkKV2lekXJEn+kUDmQJd5di8rIgg/RrjAlnwGXuK3+7LxuQ3pmCOwT2Y6NJ
         IqVw==
X-Gm-Message-State: AOAM530YYrETouGYKbX7NCVIoC7h5qm2ZsF990Y7/YeEiMb2fmH3zUDG
        bVmlpq77wfbH6ia767IbLF8t+rkvs8MOAgotQ4iLtywGvsMZAA==
X-Google-Smtp-Source: ABdhPJwdFGTiXplqLoOuussnpBWtDMVIJVe3olbx+/4H+yRTt7pXt4u0mQjspK/IrGb3onaZ1pgCSji5V9oXxGITpOM=
X-Received: by 2002:a2e:b0e4:: with SMTP id h4mr2809532ljl.119.1603883687259;
 Wed, 28 Oct 2020 04:14:47 -0700 (PDT)
MIME-Version: 1.0
References: <1603784069-24114-1-git-send-email-u0084500@gmail.com>
 <20201027082900.GA21354@amd> <b0f5b3c8-bebd-eeb6-20b2-15529816720c@gmail.com>
 <CADiBU3_x=9wvPv4_YxWx4H_ecV7Kbt5ur91SDv+unH4z2hzS_Q@mail.gmail.com> <e49d4119-48da-9dba-bbbe-b688cf28bfb8@gmail.com>
In-Reply-To: <e49d4119-48da-9dba-bbbe-b688cf28bfb8@gmail.com>
From:   ChiYuan Huang <u0084500@gmail.com>
Date:   Wed, 28 Oct 2020 19:14:35 +0800
Message-ID: <CADiBU3-y4PMtedP7fe22LW_x6bnsbyUYUHb+tNTZctJ=1wTYbA@mail.gmail.com>
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

Jacek Anaszewski <jacek.anaszewski@gmail.com> =E6=96=BC 2020=E5=B9=B410=E6=
=9C=8828=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=887:07=E5=AF=AB=E9=81=
=93=EF=BC=9A
>
> On 10/28/20 5:57 AM, ChiYuan Huang wrote:
> > Hi,
> >
> > Jacek Anaszewski <jacek.anaszewski@gmail.com> =E6=96=BC 2020=E5=B9=B410=
=E6=9C=8828=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=8812:40=E5=AF=AB=E9=
=81=93=EF=BC=9A
> >>
> >> Hi Pavel, ChiYuan,
> >>
> >> On 10/27/20 9:29 AM, Pavel Machek wrote:
> >>> Hi!
> >>>
> >>>> From: ChiYuan Huang <cy_huang@richtek.com>
> >>>>
> >>>> Add support for RT4505 flash led controller. It can support up to 1.=
5A
> >>>> flash current with hardware timeout and low input voltage
> >>>> protection.
> >>>
> >>> Please use upper-case "LED" everywhere.
> >>>
> >>> This should be 2nd in the series, after DT changes.
> >>>
> >>>> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> >>>> ---
> >>>>    drivers/leds/Kconfig       |  11 ++
> >>>>    drivers/leds/Makefile      |   1 +
> >>>>    drivers/leds/leds-rt4505.c | 397 ++++++++++++++++++++++++++++++++=
+++++++++++++
> >>>>    3 files changed, 409 insertions(+)
> >>>>    create mode 100644 drivers/leds/leds-rt4505.c
> >> [...]
> >>>> +static int rt4505_torch_brightness_set(struct led_classdev *lcdev, =
enum led_brightness level)
> >>>> +{
> >>>
> >>> 80 columns, where easy.
> >>>
> >>>> +    struct rt4505_priv *priv =3D container_of(lcdev, struct rt4505_=
priv, flash.led_cdev);
> >>>> +    u32 val =3D 0;
> >>>> +    int ret;
> >>>> +
> >>>> +    mutex_lock(&priv->lock);
> >>>> +
> >>>> +    if (level !=3D LED_OFF) {
> >>>> +            ret =3D regmap_update_bits(priv->regmap, RT4505_REG_ILE=
D, RT4505_ITORCH_MASK,
> >>>> +                                     (level - 1) << RT4505_ITORCH_S=
HIFT);
> >>>> +            if (ret)
> >>>> +                    goto unlock;
> >>>> +
> >>>> +            val =3D RT4505_TORCH_SET;
> >>>> +    }
> >>>> +
> >>>> +    ret =3D regmap_update_bits(priv->regmap, RT4505_REG_ENABLE, RT4=
505_ENABLE_MASK, val);
> >>>> +
> >>>> +unlock:
> >>>> +    mutex_unlock(&priv->lock);
> >>>> +    return ret;
> >>>> +}
> >>>
> >>> Why is the locking needed? What will the /sys/class/leds interface
> >>> look like on system with your flash?
> >>
> >> The locking is needed since this can be called via led_set_brightness(=
)
> >> from any place in the kernel, and especially from triggers.
> >>From this case, It means only led classdev
> > brihtness_get/brightness_set need to be protected.
> > I search led_flash_classdev, it only can be controlled via sysfs or V4l=
2.
> > Like as described in last mail, flash related operation is protected
> > by led access_lock and v4l2 framework.
> > I'll keep the locking only in led classdev brightness_get/brightness_se=
t API.
> > If I misunderstand something, please help to point out.
>
> Locking have to be used consistently for each access to the resource
> being protected with the lock. Otherwise you can end up in a situation
> when rt4505_torch_brightness_set and rt4505_flash_brightness_set will
> try concurrently alter hardware state. Regardless of how harmful could
> it be in case of this particular device it is certainly against
> programming rules.
>
Sure, any resource access must be protected.
I'll keep the locking like as the original patch.
Thx.
> --
> Best regards,
> Jacek Anaszewski
