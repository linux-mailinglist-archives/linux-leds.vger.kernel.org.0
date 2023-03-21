Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 080BB6C2E06
	for <lists+linux-leds@lfdr.de>; Tue, 21 Mar 2023 10:37:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230040AbjCUJh5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 21 Mar 2023 05:37:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230165AbjCUJho (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 21 Mar 2023 05:37:44 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB6F42F05D
        for <linux-leds@vger.kernel.org>; Tue, 21 Mar 2023 02:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679391415;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XfRC8Ita4hAlia+SkZ/pQsZ8qxnj9B8pouZMmuvyE0Q=;
        b=S+NhgoGAvwVSv8QTchZ133UoDHfw+AdpXLaOmt8k7GwmqZ3zkuQmX9r4rNYfwhXXE0gIxn
        74mMh07CqWYSCfThEssmOXuR+UTN+aZ4M6SwRNQwIc6pEoBscBeFcxeOvEOFvxIyCAmk9g
        br/2uuEORvrMKQBYIzv34dwh09rjKZ0=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-mH8wnJ_2N1evXtyu-O11Nw-1; Tue, 21 Mar 2023 05:36:54 -0400
X-MC-Unique: mH8wnJ_2N1evXtyu-O11Nw-1
Received: by mail-pj1-f71.google.com with SMTP id oa14-20020a17090b1bce00b0023d1b58d3baso4844677pjb.4
        for <linux-leds@vger.kernel.org>; Tue, 21 Mar 2023 02:36:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679391413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XfRC8Ita4hAlia+SkZ/pQsZ8qxnj9B8pouZMmuvyE0Q=;
        b=2b7ZBpKJ96lZjORH+gBvz9vxSPl1Tt/gxacQHO3+o0AlZBUXMmnVYtrsHnYLr3eg2G
         rDeY0nzGmheL/Gqy3qsEi8JqgTmBmY7makZNMnJRtVr1uryQBUEwsRWcwE4xEFFgJV23
         UvurOFhxYybLwOh5ss/jof3uuRnbmkqdAyz1XbOyV2H29rngCscdDHeOaESl41iImJ6J
         mIiCvQ41VbRkOsFBnL74n2TL7Jr0iyPnSL1MDtRjmXkkEFPGcKpkJg0YrGzAQmc/yN7R
         5UpOKF+re0N9NSgyRz6BOoqXlfWiZdaDoncD0eZUoKIPNWf1XnHsCpxqSH9e5UiD3OIi
         sEOg==
X-Gm-Message-State: AO0yUKV7xBRyZD4YSOX6a0rIQHayMRqeFNQM9+R4r9aPjadMyWaNeAmE
        4J6cPgJK401EBnLn9fPqU3R9jtkIo7HFst5Nqq3pi7diV+H3r4svdjHSpZ9p7BDV030Taqemq5W
        1qf9c+Q5mu1rCGPPSFOAug7blprNNWSGLNTvZnQ==
X-Received: by 2002:a65:4148:0:b0:503:25f0:9cc5 with SMTP id x8-20020a654148000000b0050325f09cc5mr450824pgp.2.1679391413485;
        Tue, 21 Mar 2023 02:36:53 -0700 (PDT)
X-Google-Smtp-Source: AK7set+yEpuJSPlUg9YtTf7pBwF+pFo21vE1vsHCheSHadGxI0oX1zWAUYHSBO02WJAw3XvEbkmIT4R3ZJXkVaMekrk=
X-Received: by 2002:a65:4148:0:b0:503:25f0:9cc5 with SMTP id
 x8-20020a654148000000b0050325f09cc5mr450812pgp.2.1679391413063; Tue, 21 Mar
 2023 02:36:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230310095635.813262-1-hpa@redhat.com> <20230310095635.813262-4-hpa@redhat.com>
 <82eaa100-c334-fb02-f956-5515e9b3d79d@ideasonboard.com>
In-Reply-To: <82eaa100-c334-fb02-f956-5515e9b3d79d@ideasonboard.com>
From:   Kate Hsuan <hpa@redhat.com>
Date:   Tue, 21 Mar 2023 17:36:41 +0800
Message-ID: <CAEth8oF1SLhxBOvUK6=P7Pjof9F5cRRenQJ45D2cQ3k6N6tjQw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] leds: tps68470: Add LED control for tps68470
To:     Dan Scally <dan.scally@ideasonboard.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Mar 20, 2023 at 10:24=E2=80=AFPM Dan Scally <dan.scally@ideasonboar=
d.com> wrote:
>
> Hi Kate - sorry just noticed one more thing...
>
> On 10/03/2023 09:56, Kate Hsuan wrote:
> > There are two LED controllers, LEDA indicator LED and LEDB flash LED fo=
r
> > tps68470. LEDA can be enabled by setting TPS68470_ILEDCTL_ENA. Moreover=
,
> > tps68470 provides four levels of power status for LEDB. If the
> > properties called "ti,ledb-current" can be found, the current will be
> > set according to the property values. These two LEDs can be controlled
> > through the LED class of sysfs (tps68470-leda and tps68470-ledb).
> >
> > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> > ---
> >   drivers/leds/Kconfig         |  12 +++
> >   drivers/leds/Makefile        |   1 +
> >   drivers/leds/leds-tps68470.c | 182 ++++++++++++++++++++++++++++++++++=
+
> >   3 files changed, 195 insertions(+)
> >   create mode 100644 drivers/leds/leds-tps68470.c
> >
> > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> > index 9dbce09eabac..fd26036b3c61 100644
> > --- a/drivers/leds/Kconfig
> > +++ b/drivers/leds/Kconfig
> > @@ -827,6 +827,18 @@ config LEDS_TPS6105X
> >         It is a single boost converter primarily for white LEDs and
> >         audio amplifiers.
> >
> > +config LEDS_TPS68470
> > +     tristate "LED support for TI TPS68470"
> > +     depends on LEDS_CLASS
> > +     depends on INTEL_SKL_INT3472
> > +     help
> > +       This driver supports TPS68470 PMIC with LED chip.
> > +       It provide two LED controllers, including an indicator LED
> > +       and a flash LED.
> > +
> > +       To compile this driver as a module, choose M and it will be
> > +       called leds-tps68470
> > +
> >   config LEDS_IP30
> >       tristate "LED support for SGI Octane machines"
> >       depends on LEDS_CLASS
> > diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> > index d30395d11fd8..b284bc0daa98 100644
> > --- a/drivers/leds/Makefile
> > +++ b/drivers/leds/Makefile
> > @@ -84,6 +84,7 @@ obj-$(CONFIG_LEDS_TURRIS_OMNIA)             +=3D leds=
-turris-omnia.o
> >   obj-$(CONFIG_LEDS_WM831X_STATUS)    +=3D leds-wm831x-status.o
> >   obj-$(CONFIG_LEDS_WM8350)           +=3D leds-wm8350.o
> >   obj-$(CONFIG_LEDS_WRAP)                     +=3D leds-wrap.o
> > +obj-$(CONFIG_LEDS_TPS68470)          +=3D leds-tps68470.o
>
>
> Alphabetical order here too please :)
>
Thank you. I updated this. :)

--=20
BR,
Kate

