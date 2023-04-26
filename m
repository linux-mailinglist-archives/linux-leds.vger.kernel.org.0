Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA0BC6EF689
	for <lists+linux-leds@lfdr.de>; Wed, 26 Apr 2023 16:35:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241341AbjDZOf3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 26 Apr 2023 10:35:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241460AbjDZOfR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 26 Apr 2023 10:35:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 511487ED3
        for <linux-leds@vger.kernel.org>; Wed, 26 Apr 2023 07:34:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E233E61A4D
        for <linux-leds@vger.kernel.org>; Wed, 26 Apr 2023 14:34:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47C4EC433D2;
        Wed, 26 Apr 2023 14:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682519684;
        bh=kSprdcI8MCj3HYsC1o1LCGOYS1LjTQa2QMztZlFG4MA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JFCAYKEZOQGRewdM/gNKPBHNnh8qwV8XdBTRqi76EPcARTogjKgXhSvVdFZHLa4Og
         JvlpTydWZIDnvBnj8oEuXa/oOYHq9QqsDXchO+yhpIeloO5sVVRAnKWu3MCRDwpoQn
         qeRjsX37fjeeQ/BmV9Q2nqOway10LxUyqsdJv4/+F4PGxzqrBGuL7a7Ey0xaAShBZf
         OKHB2vLDEi8m5VQEyvlMfPFCtmdXI3l3p6J/IXBRbH9xrI0+l9TNxZSYtrKjoyX9ke
         nVenTMDnwehQoGhsYa48PhSOm+dY+UftOXx26gNEoLogBsxVypqPmGeG+9uh+f3jml
         QKNSWCKeKcs+w==
Date:   Wed, 26 Apr 2023 15:34:39 +0100
From:   Lee Jones <lee@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-leds@vger.kernel.org, Yauhen Kharuzhy <jekhor@gmail.com>
Subject: Re: [PATCH 0/4] Fix oops about sleeping in led_trigger_blink()
Message-ID: <20230426143439.GQ50521@google.com>
References: <20230412215855.593541-1-hdegoede@redhat.com>
 <20230420113653.GD970483@google.com>
 <9ba72334-6c3a-e8cd-0692-b30278c4a88d@redhat.com>
 <20230420135635.GE996918@google.com>
 <bce6c285-60a7-d7ca-d9ea-202f3ef63d4d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bce6c285-60a7-d7ca-d9ea-202f3ef63d4d@redhat.com>
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, 25 Apr 2023, Hans de Goede wrote:

> Hi Lee,
> 
> On 4/20/23 15:56, Lee Jones wrote:
> > On Thu, 20 Apr 2023, Hans de Goede wrote:
> > 
> >> Hi Lee,
> >>
> >> On 4/20/23 13:36, Lee Jones wrote:
> >>> On Wed, 12 Apr 2023, Hans de Goede wrote:
> >>>
> >>>> Hi All,
> >>>>
> >>>> Here is a patch series to fix an oops about sleeping in led_trigger_blink()
> >>>> + one other small bugfix.
> >>>>
> >>>> Patches 1-3 should arguably have a:
> >>>>
> >>>> Fixes: 0b9536c95709 ("leds: Add ability to blink via simple trigger")
> >>>>
> >>>> tag, but Fixes tags tend to lead to patches getting automatically added
> >>>> to the stable series and I would prefer to see this series get some
> >>>> significant testing time in mainline first, so I have chosen to omit
> >>>> the tag.
> >>>
> >>> With subjects with the word "fix" in it, they will be hoovered up by the
> >>> Stable auto-picker anyway.
> >>
> >> Ok, in that case patch 3 should have:
> >>
> >> Fixes: 0b9536c95709 ("leds: Add ability to blink via simple trigger")
> >>
> >> Patches 1-2 are more preparation patches for this. Patch 2 does
> >> fix another race, but I'm not sure we ever hit that.
> >>
> >> Can you add the fixes tag while merging these, or do you
> >> want a v2 of this series ?
> > 
> > I'm holding out for either a Pavel review or some Tested-by's suggested
> > by Jacek.
> 
> Hmm, ok. I have asked Yauhen to give this a test since they have hit
> the oops/backtrace fixed by path 3/4 while testing the new leds-cht-wcove
> driver too.
> 
> But Yauhen has the same hw as me (I have already tested this on
> 3 different laptop models).
> 
> Note that Jacek did already give his Reviewed-by:
> 
> Reviewed-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> 
> I think the bug this fixes was never an issue before because only
> very few triggers use regular blinking (rather then one-shot
> blinking which always uses the sw-blink implementation).
> 
> To hit this you need to use one of the few triggers which
> actually use regular-blinking in combination with a
> driver which supports hw-blinking and where its blink_set
> callbavck may sleep. It looks to me like no-one has hit
> this combination before. Which is why there are no bug reports
> for the issue and which also is why finding testers is going
> to be tricky.
> 
> I think that the best thing to do here is add this series to -next
> early in the upcoming cycle, so that it gets the maximum testing
> time possible in -next.

Agree.  Let's revisit this once the merge-window closes.

-- 
Lee Jones [李琼斯]
