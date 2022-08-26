Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9B1A5A230C
	for <lists+linux-leds@lfdr.de>; Fri, 26 Aug 2022 10:32:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343636AbiHZIcD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 26 Aug 2022 04:32:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343619AbiHZIcC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 26 Aug 2022 04:32:02 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE300D3EFA
        for <linux-leds@vger.kernel.org>; Fri, 26 Aug 2022 01:32:00 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id kk26so1770376ejc.11
        for <linux-leds@vger.kernel.org>; Fri, 26 Aug 2022 01:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=O3a2ywKetAiTPlrs9lT8+YShy/yttp6DQHGKIy61pD0=;
        b=Kq09X+u9u6zfdlCM2VAWNO0BBCZvzu2TxeBvYSWTLT7NI+B7hmI3SvzU7w355GY9RH
         9Q46AsVFVbtQ2W96A1j7F/0LzlqEPMXi+wYhaZIjSgzHZMRvy9d3KSHx+QhDCcICDZMF
         P74yYd/HLduNFacztnkz1dVz0kyR+KIYYLQXuvZ8pJg5MjEfFkNi9XBT1uqhKLrQ/WgF
         kUI2Pfqvgc/iZ6hu6CKlHPvVPuFSQGzES4iMmO4IXWCICkOJob952iWdTkC9vM2wY7cp
         n85umVjV8PGmGqUs4SMQw3DEDLfW6ij2CrjJrhG6ezu5RgZHCRtJNkwrzf+Y2gUyyq3X
         V2+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=O3a2ywKetAiTPlrs9lT8+YShy/yttp6DQHGKIy61pD0=;
        b=Lb67+3BowMvWyAZ0otLvaIq5OrdroeYWdS09oWITJ59k2BNYArtd7O1dHewNSU78Ty
         Q8b9ghilEh+GhXRNyCHY1wzBMfOuHtCAsfcoO7ytYmURHXZUbuEfrpA2jRIez84DaTEe
         JS1GrykJZlUtF0of9fP8Eu0CnSR03kOGuiOYlf+8348JlcR1ylfItkZgg51Tb5oJW3Z4
         wevLuTsbbKZCPlA6X0MQFK2u9a9iOhoBIk3Oxj5LtwN1Z2rbe3cywqNz59D6pBvVPEad
         3SO7d2BN9e1icqU1wxP6C+NmmJ0KzlPAzoLARCJD+Xs/r7n/UbBeEtu/qWhtjKwqmHlU
         dNpQ==
X-Gm-Message-State: ACgBeo08slWy7+MJnMygiGt1DCYYmxZDDq+kOcFWz2tvIP8h3TFbCTiQ
        xE4RvUrubQYTe6TuwvVuQfRUMqGbSzjFjpZNiFm1Sw==
X-Google-Smtp-Source: AA6agR4GOyrhcuahIpbw96Io6rSfYfT+CpDB61ITbseXVm8BFNhxgBy45DU3Tf7NEjhIlvx2NVjaMcRMmsD+Ya8kNGw=
X-Received: by 2002:a17:906:58c8:b0:6fe:91d5:18d2 with SMTP id
 e8-20020a17090658c800b006fe91d518d2mr4921280ejs.190.1661502719056; Fri, 26
 Aug 2022 01:31:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220811153908.31283-1-henning.schild@siemens.com>
 <20220811153908.31283-3-henning.schild@siemens.com> <CAHp75VdWdzsT9wc9BNNKTJ3-eBn3uWdCFXqE2TT+CiJnoTOQYw@mail.gmail.com>
 <20220822152133.5e8f257e@md1za8fc.ad001.siemens.net> <CAHp75VfzOxW6KOW8ObSnqoFiaggkCWgWccrV9wV3x7BJFJR3fg@mail.gmail.com>
In-Reply-To: <CAHp75VfzOxW6KOW8ObSnqoFiaggkCWgWccrV9wV3x7BJFJR3fg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 26 Aug 2022 10:31:47 +0200
Message-ID: <CACRpkdYiLuLCG=mCk0UwpTH-Z1iTeGjdqUd6c6e6COvEzRKO0Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] gpio-f7188x: use unique labels for banks/chips
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Henning Schild <henning.schild@siemens.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Pavel Machek <pavel@ucw.cz>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Lee Jones <lee@kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Sheng-Yuan Huang <syhuang3@nuvoton.com>,
        Tasanakorn Phaipool <tasanakorn@gmail.com>,
        "simon.guinot@sequanux.org" <simon.guinot@sequanux.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Aug 22, 2022 at 11:37 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Aug 22, 2022 at 4:21 PM Henning Schild
> <henning.schild@siemens.com> wrote:
> > Am Fri, 12 Aug 2022 10:39:08 +0200
> > schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:
> > > On Thursday, August 11, 2022, Henning Schild
> > > <henning.schild@siemens.com> wrote:
> > >
> > > > So that drivers building on top can find those pins with GPIO_LOOKUP
> > > > helpers.
> > >
> > > Missed given tag. Do we need to bother reviewing your patches?
> >
> > Sorry but i have no idea what you are talking about, please help me
> > out. Whatever i did miss seems to be pretty relevant it seems.
>
> If I remember correctly somebody gave you an Acked-by (or
> Reviewed-by?) tag in previous versions of the series. I don't see it
> included.

I think I added a Reviewed-by but it came in probably after this
version was posted due to me being slow on processing my
inbox, so this one is likely on me.

Yours,
Linus Walleij
