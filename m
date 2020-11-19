Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 246AD2B8CA6
	for <lists+linux-leds@lfdr.de>; Thu, 19 Nov 2020 08:58:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725816AbgKSHzo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 19 Nov 2020 02:55:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725813AbgKSHzo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 19 Nov 2020 02:55:44 -0500
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB7B2C0613CF;
        Wed, 18 Nov 2020 23:55:43 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id o25so5393001oie.5;
        Wed, 18 Nov 2020 23:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UqEZgdNvcjcXXhIWHNeHNBTdkcGqiFCGGG3iro71gmQ=;
        b=ZNsRHcafuF4aLywVyyfUtcjcUxqUIvHfl5jTABeV5GkI6jkOtmN4u8INwrzXI8Dh5Y
         1OYCAV+ovERlvxaarRt7FnjbFDuqATZpRjCQZ8xmXtnb7BeMr76HmkqRiHQHMAE+OeBv
         shH5OediHlDPTmmLKhBsPevO6sNsStYNlfxVrf3AlgpXZpUHZcxaVlFnQwLT2wIRpfiY
         0Q4SxZiO/Pc/ICjuT3YQq1awhGMm7R2iXz77/A+OgZIfJy9Tl60YsNA6yfcwWovWOBbV
         K/33gErJrnxbWcvCLNsADfUjtXzHsUV5mFbe64OjKEaTM4Tnnc41l1hyQWw59OWc9Ta/
         oRJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UqEZgdNvcjcXXhIWHNeHNBTdkcGqiFCGGG3iro71gmQ=;
        b=GM8b1RMWHvjmZqE1zouZVOHseyuzzOPl36BYdouMsIk2nZGJM7aIyNiq8woZrocYvp
         bYz864pydGAwI1zMYoPq6+dDlfZbG7IoqaJMLu10k3ShYO19DXXEMWOmqOUsSfFmGQvA
         ZfrGeC9khHPu45wW0kqG7RiRYmOEbhTi79U9sFoisj+ROwScNtG/BzGcOLqvV611M9m/
         bzY4Wi52JcMLGmyxJrbvSW3Pj+wy34Sb77G4shBBg05FJIcxJh51iXwFDs8lhI00OHs9
         k3KFfavszcBs7retpw+P2LX+BHsBfoGPCkc0CqgpM6tKFIYfPLhoPtVxLGWpbAmFm7l3
         If1A==
X-Gm-Message-State: AOAM5338Por54RGvVNLrO8mI5jgkKfPvwj8XRNqJADXMm6ER7rGh0yvw
        +c/E4Z2MO5bG7boSgEb7SW0HCyIkkR9Y96gSlVk=
X-Google-Smtp-Source: ABdhPJwVys4NN090PM4lDhnegSTeQWHr/UROay2glVQJ86PSq2eo5JMDrAwD/fpQm6omSHvSUuDiO/2DdJl03wKW/zE=
X-Received: by 2002:aca:4783:: with SMTP id u125mr2154242oia.23.1605772543224;
 Wed, 18 Nov 2020 23:55:43 -0800 (PST)
MIME-Version: 1.0
References: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605696462-391-3-git-send-email-gene.chen.richtek@gmail.com>
 <20201118213712.GA22371@amd> <CAE+NS36rnHzhdk5Os+vL=uK225HJT-bUHSRJ6KccaOHc-kCjpA@mail.gmail.com>
 <20201119074416.GA27576@amd>
In-Reply-To: <20201119074416.GA27576@amd>
From:   Gene Chen <gene.chen.richtek@gmail.com>
Date:   Thu, 19 Nov 2020 15:55:32 +0800
Message-ID: <CAE+NS3430=-WynyXQr+8MghmtmiCR+2VeTt4aD5cT8UmA+1Qrg@mail.gmail.com>
Subject: Re: [PATCH v7 2/5] dt-bindings: leds: Add LED_COLOR_ID_MOONLIGHT definitions
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
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
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel Machek <pavel@ucw.cz> =E6=96=BC 2020=E5=B9=B411=E6=9C=8819=E6=97=A5 =
=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=883:44=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi!
>
> > > > From: Gene Chen <gene_chen@richtek.com>
> > > >
> > > > Add LED_COLOR_ID_MOONLIGHT definitions
> > >
> > > Why is moonlight a color? Camera flashes are usually white, no?
> > >
> > > At least it needs a comment...
> > >
> > > Best regards,
> > >                                                                 Pavel
> > >
> >
> > Moonlight has more current level(150mA) from general RGB LED (24mA).
> > It can be used as night-light and usually use color AMBER.
> > Camera flashes are usually use two flash LED. One is YELLOW, and one
> >is WHITE.
>
> From what I seen, night-lights are usually differetent "temperatures"
> of white. Cool white + warm white.
>
> I believe "warm white" would be easier to understand than
> "moonlight"...
>

ACK, I will change color "LED_COLOR_ID_WHITE"

> Best regards,
>                                                                 Pavel
>
> --
> http://www.livejournal.com/~pavelmachek
