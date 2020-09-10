Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C666264582
	for <lists+linux-leds@lfdr.de>; Thu, 10 Sep 2020 13:51:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730358AbgIJLvp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 10 Sep 2020 07:51:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729455AbgIJLsz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 10 Sep 2020 07:48:55 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3A6FC0617A0;
        Thu, 10 Sep 2020 04:35:11 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id j34so4088504pgi.7;
        Thu, 10 Sep 2020 04:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OAIIi6uo3XgXFJ7QsLwLusqGAN4H6rcenY71bNI/1l8=;
        b=rW+wPK6uNUbrUcprGE+bQuCpqDWnZ0VJbYkiOw/LceoiimtmO+K5zGaJ8VH0fntmp+
         60B98AoB2KqakAI4TCQ0uZ4WWLuPJehYgr5Srs+vOTsO7s8hRxHwTPM9ARbWajgphq2B
         eWF9fHapKu16Jsi6TEfaoFS4dpvFBS9QK41CJGk+o7RlAABDvo/dM9b4B650BS9FLS4p
         yMJaz5yYQL0WEuCDL8GAudTrpDIShQA3TuQLtjqRDVN0d9IrSXJcdxiN51NAOtaJEQnw
         oxKzVKa1VyeWniKn9nW3b/8r4kUc1kNt9Z6dWm93DAtQAozF65v8SL+LPP/lanfG6nC1
         uJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OAIIi6uo3XgXFJ7QsLwLusqGAN4H6rcenY71bNI/1l8=;
        b=AVRtOUlyEtkWC05Ly0x2EA/ZMpiF9mfyFgBbhgy6OabeH/qYVZS46eBG2J9AC5inPk
         x79tqJKgL/bl8QfbN7+XB/nLXQ/a8bRsDlU3bn+1cS+Whr+Y948kquUtpW2PieL/TMkL
         /q+A9RvrXJ8tmhxdoqZOMnHKaAFhPx9rXSYIio3FrgyR143GSML4x3CJdz1/dbCE0y2u
         3YTa5+6TemGf88r1/7E7aMQqYkXz/DGPsE/TLt3bZxFeXWje+HsDWWAm1/dKWCvjpSr5
         e8gd1EWNSt9a3ETSCw3Tkb8HtTPOBN7f1NbnYsXCdO4EfuyUC4PoCnhCkSVUZsP/Hqop
         Hxeg==
X-Gm-Message-State: AOAM531VgFbtO40dx9PjEYnrxLbOd9r8Uurn+XvPBkfWbfluZqRVkIaq
        SvN1I7on697jT5TALTrHfacCfqwGMR1vM2zdA7o=
X-Google-Smtp-Source: ABdhPJyA7xJQIZk5VHdsH5jeJ1GijVp07O14SJTxho9owohQ9HM6j6M0zAQbtOSB3XzQ6HyGQ+uJhc1FwEQ8T7FSZbs=
X-Received: by 2002:a63:ec4c:: with SMTP id r12mr4042041pgj.74.1599737711469;
 Thu, 10 Sep 2020 04:35:11 -0700 (PDT)
MIME-Version: 1.0
References: <1599474459-20853-1-git-send-email-gene.chen.richtek@gmail.com>
 <1599474459-20853-2-git-send-email-gene.chen.richtek@gmail.com>
 <CAHp75VdLDvoQicP1nLnjOiit6qjaw9n7+LuJ-J3MtaoHUOa_2g@mail.gmail.com>
 <CAE+NS35FETQ9ASJeYP=Sa8dm7ohRBcdAwUioCAnHPY2TiD4pNA@mail.gmail.com> <20200910081814.GB28357@amd>
In-Reply-To: <20200910081814.GB28357@amd>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 10 Sep 2020 14:34:54 +0300
Message-ID: <CAHp75Vds75jP47Fy78gxrg05J-CYQ7yD_EiDqizKkcW5rHL_RA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] leds: mt6360: Add LED driver for MT6360
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Gene Chen <gene.chen.richtek@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
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
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Sep 10, 2020 at 11:18 AM Pavel Machek <pavel@ucw.cz> wrote:

...

> > > > +enum {
> > > > +       MT6360_LED_ISNK1 = 0,
> > > > +       MT6360_LED_ISNK2,
> > > > +       MT6360_LED_ISNK3,
> > > > +       MT6360_LED_ISNK4,
> > > > +       MT6360_LED_FLASH1,
> > > > +       MT6360_LED_FLASH2,
> > >
> > > > +       MT6360_MAX_LEDS,
> > >
> > > No comma for terminator entry.
> > >
> >
> > ACK
>
> Actually, that comma is fine. Its absence would be fine, too.

It is slightly better not to have to prevent (theoretical) rebase or
other similar issues when a new item can go behind the terminator. In
such a case compiler can easily tell you if something is wrong.

> > > > +};

...

> > > > +static const struct of_device_id __maybe_unused mt6360_led_of_id[] = {
> > > > +       { .compatible = "mediatek,mt6360-led", },
> > >
> > > > +       {},
> > >
> > > No need comma.
> >
> > ACK
>
> It is also no hurting comma.

Same explanation. It doesn't hurt per se, but its absence might serve a purpose.

-- 
With Best Regards,
Andy Shevchenko
