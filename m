Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 884A26F6C95
	for <lists+linux-leds@lfdr.de>; Thu,  4 May 2023 15:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229606AbjEDNIk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 4 May 2023 09:08:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230312AbjEDNIe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 4 May 2023 09:08:34 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 170D046A9
        for <linux-leds@vger.kernel.org>; Thu,  4 May 2023 06:08:31 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-94f1d0d2e03so77142666b.0
        for <linux-leds@vger.kernel.org>; Thu, 04 May 2023 06:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683205709; x=1685797709;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lF2VxUHF7gYv+YxnkkJciztyUh6yNtLiwyUFIKcnkxw=;
        b=rJ02HRTFG/FlETjTOoREHb4MNLFoZ9a2fWTvupIE+HOMZByFi036Qtj6i2XJ2nr48Q
         WqoxcEOMXHSSsWjSTrg737R95vJRhKUIBGRQM6QZ1j5vb2DJsAa5KncF5AMsRa4j+51E
         SdX2P7j9+CNw4zQIF55pvs45AcBdp1OfpcTwV2mQ+r+xL7z8bTZyG6bAwekrqkyr7xe5
         FfFhy034RFutP9zLOaHVH6wluKD9wA4kKNzhsCt3Luhi7gTIBYMk91vzptaOPj4qp0wJ
         E//OnVGSYKq6Te4KfjAMj7YZWlykuk29st2AlZhW8hxEB/oSoQuRCs7+yHwR7/uFn62p
         6uKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683205709; x=1685797709;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lF2VxUHF7gYv+YxnkkJciztyUh6yNtLiwyUFIKcnkxw=;
        b=LT/9bStJe0byy/gPKFgXlWeP0idLMgzeLz05HCQs+LzkIj4iqGfFpYuNXshq26heMu
         t0pfK0mWVwZX+VpGLjOBDYN1z2fGhla/fXp7GZ5Mhc2SINqZbpJYC55YtQFHA+aOKEdc
         PGlD4RbZy+PNOFWux2S/5BxoFYZRwdv98z2v1sDbAaBotpqSVznoM+6tKQcTR82XkJt+
         JFXbe9QyZpGvdEA/TWrh6Q2se2wOFiUVqnmCqQaOEmrrVyaxjkULxlLedzWDyEREb2IP
         7inoOshwxadub8IDfV4tfaGFkEyznuwwqpKOiYuOJ3InCofj33ioBZleQG2uixZSiaz6
         Ed8w==
X-Gm-Message-State: AC+VfDwBBZHX9GfHM/dJkW5ILhwi93Eu5KDT5P7qePbdvt90sCiiEsXL
        HtYwh9r5bhpWpClkeBT+xH0=
X-Google-Smtp-Source: ACHHUZ4bQ24wAGYukfwuU+2wDHUkMomh3MHa9gjE2sM0Dul46ugeW53T7NSgnV8CfCpQhcbXmQkQ6g==
X-Received: by 2002:a17:907:7204:b0:94e:6b12:caab with SMTP id dr4-20020a170907720400b0094e6b12caabmr7103885ejc.51.1683205709283;
        Thu, 04 May 2023 06:08:29 -0700 (PDT)
Received: from localhost.localdomain (212-59-15-122.static.zebra.lt. [212.59.15.122])
        by smtp.gmail.com with ESMTPSA id gq18-20020a170906e25200b0094eeda0df09sm18817859ejb.179.2023.05.04.06.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 06:08:28 -0700 (PDT)
Received: from jek by localhost.localdomain with local (Exim 4.96)
        (envelope-from <jekhor@gmail.com>)
        id 1puYh9-00BeF5-1C;
        Thu, 04 May 2023 16:08:27 +0300
Date:   Thu, 4 May 2023 16:08:27 +0300
From:   Yauhen Kharuzhy <jekhor@gmail.com>
To:     Lee Jones <lee@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH 0/4] Fix oops about sleeping in led_trigger_blink()
Message-ID: <ZFOuS/zKzH92SvOT@jeknote.loshitsa1.net>
References: <20230412215855.593541-1-hdegoede@redhat.com>
 <20230420113653.GD970483@google.com>
 <9ba72334-6c3a-e8cd-0692-b30278c4a88d@redhat.com>
 <20230420135635.GE996918@google.com>
 <bce6c285-60a7-d7ca-d9ea-202f3ef63d4d@redhat.com>
 <20230426143439.GQ50521@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230426143439.GQ50521@google.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Apr 26, 2023 at 03:34:39PM +0100, Lee Jones wrote:
> On Tue, 25 Apr 2023, Hans de Goede wrote:
> 
> > Hi Lee,
> > 
> > On 4/20/23 15:56, Lee Jones wrote:
> > > On Thu, 20 Apr 2023, Hans de Goede wrote:
> > > 
> > >> Hi Lee,
> > >>
> > >> On 4/20/23 13:36, Lee Jones wrote:
> > >>> On Wed, 12 Apr 2023, Hans de Goede wrote:
> > >>>
> > >>>> Hi All,
> > >>>>
> > >>>> Here is a patch series to fix an oops about sleeping in led_trigger_blink()
> > >>>> + one other small bugfix.
> > >>>>
> > >>>> Patches 1-3 should arguably have a:
> > >>>>
> > >>>> Fixes: 0b9536c95709 ("leds: Add ability to blink via simple trigger")
> > >>>>
> > >>>> tag, but Fixes tags tend to lead to patches getting automatically added
> > >>>> to the stable series and I would prefer to see this series get some
> > >>>> significant testing time in mainline first, so I have chosen to omit
> > >>>> the tag.
> > >>>
> > >>> With subjects with the word "fix" in it, they will be hoovered up by the
> > >>> Stable auto-picker anyway.
> > >>
> > >> Ok, in that case patch 3 should have:
> > >>
> > >> Fixes: 0b9536c95709 ("leds: Add ability to blink via simple trigger")
> > >>
> > >> Patches 1-2 are more preparation patches for this. Patch 2 does
> > >> fix another race, but I'm not sure we ever hit that.
> > >>
> > >> Can you add the fixes tag while merging these, or do you
> > >> want a v2 of this series ?
> > > 
> > > I'm holding out for either a Pavel review or some Tested-by's suggested
> > > by Jacek.
> > 
> > Hmm, ok. I have asked Yauhen to give this a test since they have hit
> > the oops/backtrace fixed by path 3/4 while testing the new leds-cht-wcove
> > driver too.
> > 
> > But Yauhen has the same hw as me (I have already tested this on
> > 3 different laptop models).
> > 
> > Note that Jacek did already give his Reviewed-by:
> > 
> > Reviewed-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> > 
> > I think the bug this fixes was never an issue before because only
> > very few triggers use regular blinking (rather then one-shot
> > blinking which always uses the sw-blink implementation).
> > 
> > To hit this you need to use one of the few triggers which
> > actually use regular-blinking in combination with a
> > driver which supports hw-blinking and where its blink_set
> > callbavck may sleep. It looks to me like no-one has hit
> > this combination before. Which is why there are no bug reports
> > for the issue and which also is why finding testers is going
> > to be tricky.
> > 
> > I think that the best thing to do here is add this series to -next
> > early in the upcoming cycle, so that it gets the maximum testing
> > time possible in -next.
> 
> Agree.  Let's revisit this once the merge-window closes.

Tested-by: Yauhen Kharuzhy <jekhor@gmail.com>

For entire series.


-- 
Yauhen Kharuzhy
