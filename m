Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C2133473FF
	for <lists+linux-leds@lfdr.de>; Wed, 24 Mar 2021 09:55:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233582AbhCXIzI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 24 Mar 2021 04:55:08 -0400
Received: from mail-vk1-f176.google.com ([209.85.221.176]:36848 "EHLO
        mail-vk1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230437AbhCXIyx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 24 Mar 2021 04:54:53 -0400
Received: by mail-vk1-f176.google.com with SMTP id d82so5286907vkd.3;
        Wed, 24 Mar 2021 01:54:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xRxwIC3bM0aWnGeWfgHlFRedOLEA/dGDm4UbRmEj3Vw=;
        b=CIkBqMn1zVHVPgG8CAO/fAhEx5yL3/1d+jK8LMF0xay7R77PCRcMFaR2Sx/T9/T09+
         /FVCIWFpMGtcEPLkwFGM7BNmv4smxVew11zgJQS64ycDuqAPfRm0K7lw7JetWI2d5kdi
         GMOAIrvMGj1GXcVm9LENs0DFtYbMRrDRSfkub/SJMtsGk6+HB1RZ34gihM0qNzZwXcux
         GC6SAQDrvUo/yBT7NiswKsv4CQM1211Uo2/8JsYdBFHURcIs9pk7Q3pojSCV3R9Ss6AR
         fgw6LDn+Z26qjLCfhO34MRQhZHWD2sXbNs5McTLUBe0LeD97I3XF/ng361eBnkZB6GuO
         8ZBQ==
X-Gm-Message-State: AOAM5311N0txRf7Lu699q3eb3Y3ZcYqCM/572oxYvyBjadmR3OPBH7dc
        4Wok2zIJrguv7Ef/5V9EK01I3xZEsZ1PqvWgfbxEX615y0Y=
X-Google-Smtp-Source: ABdhPJzMDF6Nt1AF/bI08S3WTSedZ75tpHSB9bs9VB4XV/vIslxfCLJOjjnhguNbqq5W3XrjdDnyZdfuy6oLhuNoxdM=
X-Received: by 2002:a1f:2502:: with SMTP id l2mr1032890vkl.5.1616576092193;
 Wed, 24 Mar 2021 01:54:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210228124106.135812-1-konrad.dybcio@somainline.org>
 <20210228124106.135812-2-konrad.dybcio@somainline.org> <20210322161810.biagj2qro66rv4gt@maple.lan>
 <20210323083935.GF2916463@dell>
In-Reply-To: <20210323083935.GF2916463@dell>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 24 Mar 2021 09:54:40 +0100
Message-ID: <CAMuHMdUamD4rAY1Sn-3Fb9Xf1B9g0FY0Pob8rAFsFR0ZcNZ0rw@mail.gmail.com>
Subject: Re: [PATCH 2/2] video: backlight: qcom-wled: Add PMI8994 compatible
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Daniel Thompson <daniel.thompson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, Jingoo Han <jingoohan1@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        linux-leds <linux-leds@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Lee,

On Tue, Mar 23, 2021 at 9:40 AM Lee Jones <lee.jones@linaro.org> wrote:
> On Mon, 22 Mar 2021, Daniel Thompson wrote:
> > On Sun, Feb 28, 2021 at 01:41:05PM +0100, Konrad Dybcio wrote:
> > > Add a compatible for PMI8994 WLED. It uses the V4 of WLED IP.
> > >
> > > Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> >
> > Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
>
> Why are you Reviewing/Acking a patch that was applied on the 10th?

Only 12 days later?!?

It's not uncommon to receive acks for patches after they have been
applied upstream. But it is if the patch was applied 10 years and 9
months ago!
https://lore.kernel.org/linux-m68k/F5513AE92A5A1047AC2F91AEBB9202680288CBBA3983@E2K7-MS2.ds.strath.ac.uk/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
