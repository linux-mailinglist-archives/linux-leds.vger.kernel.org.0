Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCB4624A825
	for <lists+linux-leds@lfdr.de>; Wed, 19 Aug 2020 23:06:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727093AbgHSVGC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 19 Aug 2020 17:06:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726841AbgHSVGA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 19 Aug 2020 17:06:00 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30B0CC061383
        for <linux-leds@vger.kernel.org>; Wed, 19 Aug 2020 14:06:00 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id y2so17939928ljc.1
        for <linux-leds@vger.kernel.org>; Wed, 19 Aug 2020 14:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dFTOnPtDPtEvUDpUSHyqI2ZnkphwbLJTVI5Opdc/0TE=;
        b=kQ6qOHnWDOmwJ0vlEkI3ORG5pFju8yQvcEnR7IiYJOjCIe0AnY7hNruws/YVPoBUfv
         X6nfxs7V5ggO0J+DPHNkmL6zLu2Ww4vBt7TC65pIZ6wb1c5B2ItTQfI1ICjoCd7YwfJX
         PsidhmNFtkJKjRafF3tEbcWPpx8GuH0aSJGxM555yQdyJfKlVE86j0iQ5aEfRLagVYXx
         lCGmBjmfj1GfKaw/2Vt4bLcHtdITO3DkJD+JhUEGFVNoLrc/Orz9o7ekh2xCyJsgr2tH
         cg1e0bnicalm3I7Q1lXqNpTRTbP7skvyU1x1eRdm0SGlcOzDvQDfxL0B+uPHAM6l5z2A
         ZzRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dFTOnPtDPtEvUDpUSHyqI2ZnkphwbLJTVI5Opdc/0TE=;
        b=JwES70JCebQaH+720rDbH5VXNvRA7kGz8X65zBEX9W0SAD7+fM1XPoS9juYfbuWpOh
         ExNuGSGyNUS3CEaAC1avL0a7AiEx7WhZBLRdkNZ6lr+Lq8lXTVjnXN8vb9Jlyak9d1tI
         eTVelHdACtf12zLGuPmI/WQyQuGKBEj5qHNyU9xLUk2k8W0DCw7cVF3SzBm8cAdl8pYT
         kzitN1d8OBM10IrzZMa65ZsavVNavLT26FshcPBux1SmV0tpZLeWGNYTvfHNAIiIvD72
         f/O7h1iEopFm/gT1N64z2zUfijc1+aGTW2WuFTX8sNpIbDxogfb6DMfX3zldpzk6q9hq
         uxYQ==
X-Gm-Message-State: AOAM531ezyHgURSndcbMGp2i2LGZ/i4o2VlFimzQeAO1cPN8Yy/ueXCQ
        7QHWlQI3TTOOHLMKbrkdRtrdXRfIEn7zey2op+2GPQ==
X-Google-Smtp-Source: ABdhPJxJuuL0E5As02w+E0Y6Qv7IfQ8YJeKtg4XnoyFF7kGJWq96/akkY89gebYJVjnCTCDKMsYsDpG2PW6zUVAt3qs=
X-Received: by 2002:a2e:4e09:: with SMTP id c9mr39538ljb.283.1597871158426;
 Wed, 19 Aug 2020 14:05:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200812090711.2644688-1-linus.walleij@linaro.org> <e8d27b57-ac17-29e4-0e43-b72d7447d43a@gmail.com>
In-Reply-To: <e8d27b57-ac17-29e4-0e43-b72d7447d43a@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 19 Aug 2020 23:05:47 +0200
Message-ID: <CACRpkdYcKthp9_482ptL7YSitN-YUU4_u57ra25Ko4_-102JaQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: leds: Add DT binding for Richtek RT8515
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        newbytee@protonmail.com, Stephan Gerhold <stephan@gerhold.net>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Aug 13, 2020 at 11:06 PM Jacek Anaszewski
<jacek.anaszewski@gmail.com> wrote:

> > +  led:
> > +    type: object
> > +    $ref: common.yaml#
(...)
> > +        led {
> > +            function = LED_FUNCTION_FLASH;
> > +            color = <LED_COLOR_ID_WHITE>;
> > +            flash-max-timeout-us = <250000>;
>
> Constraints for this property are needed above.

Can you elaborate on what you expect this to look like?
The property is from common.yaml, so should that be
extended with a constraint?

Yours,
Linus Walleij
