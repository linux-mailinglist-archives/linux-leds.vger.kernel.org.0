Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2779538656A
	for <lists+linux-leds@lfdr.de>; Mon, 17 May 2021 22:08:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240428AbhEQUJv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 17 May 2021 16:09:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238228AbhEQUJg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 17 May 2021 16:09:36 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7062AC06138E;
        Mon, 17 May 2021 13:08:18 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id c20so11058451ejm.3;
        Mon, 17 May 2021 13:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FPQpPkineiPmOw2bdcHutS4i1NfXxZpf/y7WCO0sLws=;
        b=m30KpS05l2vCC41X/iSl7gdZ6Llls/0MRrXJp91bWT6xsFG1liRpHtVW6AMFQlpPVu
         tIGyeKLISAL5LJCvy8gz1iJraKvU4HQbjF95dAUJafw6u3sxLQIoZulyn6S8PlnFFVv3
         QevP8TSNBy1aZ5rXm1kEPB4i4LFj9YNl9+eJ9SnHF/VRP/oExxFnrvFvyj5wXsxITY61
         WHN3lYZFx6D3OEYpsuZTYlKRXWUnAu4noKWgvoX928hvEB0fYLYi88oKNbxqgeizPrXN
         GjknArAPPV4RNln3Nb/T4VUecfU6sWo3ICSUhKSblTQ1m1auKBwKBLcHiQcwtvX1WS4d
         zG7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FPQpPkineiPmOw2bdcHutS4i1NfXxZpf/y7WCO0sLws=;
        b=i8lQ7X/CbpBFFgiq739C3kP7iyzjgcpFR5gNvhNcmxLf2MTEMqBXdy9pM5l5K7sMDR
         p9vBPpKGnnXcSmme2yplzLE/rfATSEsUzi05styIa81oI+fQTk8q0/WoLDXuS1KaIUDj
         DMDy77MaSGao1/3IB6eV5x7d+kS1MpuqJTaaziLHNoGUwlVpA6cW5kRmv2CyP3uV0lhW
         HR/Pprx+HgOTXwokz5bvy2zAJi3G2kREfLafAST8UQPyZZU6E1Wr2LAD2Q0/j1pHjkfE
         Q+udxRI1+mgyDbz40GF3EGLKuaNdmZ9JQZtWPUZ2V9XSaevbrWhviMT7POLv2HqWQBP2
         DzCQ==
X-Gm-Message-State: AOAM531Zcl8jK15kHfcdUNHSVHdhxEuYw2JprkREpl3Zf1AVcWaJe99m
        irBd3S7xWsx1wI7ZcKa2UiFkIRkdYZfl30BgPaI=
X-Google-Smtp-Source: ABdhPJzjlQao+FlWA/u+k5w1aTOIgcJSpc4UjIQ+FK7vnybDLv6iqkd/6zSfKKUIOoyo3k9D8hIrLHCVAZPxcxHGFYM=
X-Received: by 2002:a17:906:b853:: with SMTP id ga19mr1714092ejb.386.1621282097074;
 Mon, 17 May 2021 13:08:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210511204834.2675271-1-dougdev334@gmail.com>
 <20210511204834.2675271-3-dougdev334@gmail.com> <20210513022036.GA890569@robh.at.kernel.org>
 <CABa6EMYdY9WBN0+edgcEFc0uiBmWUDert7nXCN+FWeRMG=0S6A@mail.gmail.com> <20210516183135.GA26985@duo.ucw.cz>
In-Reply-To: <20210516183135.GA26985@duo.ucw.cz>
From:   Doug Zobel <dougdev334@gmail.com>
Date:   Mon, 17 May 2021 15:07:41 -0500
Message-ID: <CABa6EMaEFLKrrhnH2+3wEEGJkWH7fQQpQrKRh=KHR6KfSgTsnA@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt: bindings: lp55xx: Add predefined LED pattern
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Rob Herring <robh@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

> Take a look at the pattern trigger. That's the way to change patterns
> at runtime, no need for firmware loading.

Thanks for the pointer.  That looks like it could work.  I would need
to add support for the lp5562 to run the patterns in hardware.  The
only problem I see is in synchronizing the 3 color channels.  Since
the pattern triggers are associated with each individual channel, I
don't see a clean way to run a multi-chanel (RGB) pattern and keep it
in sync.  I was thinking I could restart all 3 channels' programs
anytime a channel program is changed.  This would assure they start in
sync.  However that would cause glitches in the patterns if they are
being used as 3 independent (non-RGB) patterns.

> I may even have compiler from that interface to the bytecode lp55xx
> uses. Some assembly will be required. Doing so with the RGB LED will
> be even more fun.

If you have some previous work on this, I could use it.  Otherwise
I'll just write my own bytecode generator.  As far as I know the
lp5562 is the only lp55xx controller which supports on chip
programming.  So I would add the support in the lp5562 driver.

> We'll want to deprecate the firmware loading interface at some point.

If I add support for running the pattern triggers in lp5562 hardware,
then this will now be the 3rd method (firmware &
lp5562_run_predef_led_pattern() are the other two) for loading custom
patterns onto the chip.  Will this be a problem?

-Doug
