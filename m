Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D1166E9664
	for <lists+linux-leds@lfdr.de>; Thu, 20 Apr 2023 15:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230023AbjDTN4l (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 20 Apr 2023 09:56:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbjDTN4l (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 20 Apr 2023 09:56:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FD785B97
        for <linux-leds@vger.kernel.org>; Thu, 20 Apr 2023 06:56:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E0F5764926
        for <linux-leds@vger.kernel.org>; Thu, 20 Apr 2023 13:56:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D8A6C433EF;
        Thu, 20 Apr 2023 13:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681998999;
        bh=3LXVJeIyfLxmsGnzVpqXltM9447jWQhDdfdDY7R6lTI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QPM0fVsAD5xsAWxrXiKZSbU4J/476R/YtXIKSR9VDWMKGIVOfLSAgS2zgmNsinVQE
         3ADOsoTZnC6xHmg3dsDwUgbAgSrqavADnBtr2BU3CazZQwnqAvM6FV1AVZHcpHC7XW
         sA6kD6WHrwYDJmGb/ahWLGlBWjEcHe8cmWXaPHTIr3icFVwI7IPkbruv9mizS8u1NE
         Rx9lHwGukshRJqLx+zq1h+MQVR4TWwobMdaVEOJggg3BtLQ+V7WnHgowGQCg1clHs+
         uJtANiBCUcnHcaBuXjdK6B/qpFKTTnkXZP6G4oo8FrEWtRxs8a7S+2Pq/Xifvrtd3/
         db0WbnuZCwaeg==
Date:   Thu, 20 Apr 2023 14:56:35 +0100
From:   Lee Jones <lee@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH 0/4] Fix oops about sleeping in led_trigger_blink()
Message-ID: <20230420135635.GE996918@google.com>
References: <20230412215855.593541-1-hdegoede@redhat.com>
 <20230420113653.GD970483@google.com>
 <9ba72334-6c3a-e8cd-0692-b30278c4a88d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ba72334-6c3a-e8cd-0692-b30278c4a88d@redhat.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 20 Apr 2023, Hans de Goede wrote:

> Hi Lee,
> 
> On 4/20/23 13:36, Lee Jones wrote:
> > On Wed, 12 Apr 2023, Hans de Goede wrote:
> > 
> >> Hi All,
> >>
> >> Here is a patch series to fix an oops about sleeping in led_trigger_blink()
> >> + one other small bugfix.
> >>
> >> Patches 1-3 should arguably have a:
> >>
> >> Fixes: 0b9536c95709 ("leds: Add ability to blink via simple trigger")
> >>
> >> tag, but Fixes tags tend to lead to patches getting automatically added
> >> to the stable series and I would prefer to see this series get some
> >> significant testing time in mainline first, so I have chosen to omit
> >> the tag.
> > 
> > With subjects with the word "fix" in it, they will be hoovered up by the
> > Stable auto-picker anyway.
> 
> Ok, in that case patch 3 should have:
> 
> Fixes: 0b9536c95709 ("leds: Add ability to blink via simple trigger")
> 
> Patches 1-2 are more preparation patches for this. Patch 2 does
> fix another race, but I'm not sure we ever hit that.
> 
> Can you add the fixes tag while merging these, or do you
> want a v2 of this series ?

I'm holding out for either a Pavel review or some Tested-by's suggested
by Jacek.

-- 
Lee Jones [李琼斯]
