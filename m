Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DB326FDD40
	for <lists+linux-leds@lfdr.de>; Wed, 10 May 2023 13:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230047AbjEJL5h (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 10 May 2023 07:57:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230031AbjEJL5h (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 10 May 2023 07:57:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9314D30FB
        for <linux-leds@vger.kernel.org>; Wed, 10 May 2023 04:57:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 29569648F0
        for <linux-leds@vger.kernel.org>; Wed, 10 May 2023 11:57:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BD13C433EF;
        Wed, 10 May 2023 11:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683719855;
        bh=hTuqlhOrZ4Y92WY5BRQw+Yu8GwclAVFXittNgIZcqJc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aYV2PXh5rws8Js2C565zFLzKk3KCzYsTolZViHJNhseEdkXLU3FjE6kKGpwfRy8JP
         ReOaBNMRg2eU33G7aDQhwYw3UNkVpWDpolLJqExe6v0lyo6LvgrVCKsKroMvyX+Bk1
         tcJQV0O7dKw1hKboOCmHSqrQO5g399YNXECPYItuPaUVofCU/Oz0Zq8B3WIBFVqUOb
         YXb1JpEeDRvSZaSSFwBmLMS3EsmKH3zLjoNQR0knmj0jV/OlfhBBv8qZ/doFWwqzrq
         WHhvskUBgOx3ns0HxzZNPq5nWGOKbXGVPrJ0vd7XiNmfU9vSeQYEW4/lgpT3QYfAIt
         czqL7c8U55mzQ==
Date:   Wed, 10 May 2023 12:57:30 +0100
From:   Lee Jones <lee@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH 1/4] leds: Change led_trigger_blink[_oneshot]() delay
 parameters to pass-by-value
Message-ID: <20230510115730.GA8963@google.com>
References: <20230412215855.593541-1-hdegoede@redhat.com>
 <20230412215855.593541-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230412215855.593541-2-hdegoede@redhat.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 12 Apr 2023, Hans de Goede wrote:

> led_blink_set[_oneshot]()'s delay_on and delay_off function parameters
> are pass by reference, so that hw-blink implementations can report
> back the actual achieved delays when the values have been rounded
> to something the hw supports.
> 
> This is really only interesting for the sysfs API / the timer trigger.
> Other triggers don't really care about this and none of the callers of
> led_trigger_blink[_oneshot]() do anything with the returned delay values.
> 
> Change the led_trigger_blink[_oneshot]() delay parameters to pass-by-value,
> there are 2 reasons for this:
> 
> 1. led_cdev->blink_set() may sleep, while led_trigger_blink() may not.
> So on hw where led_cdev->blink_set() sleeps the call needs to be deferred
> to a workqueue, in which case the actual achieved delays are unknown
> (this is a preparation patch for the deferring).
> 
> 2. Since the callers don't care about the actual achieved delays, allowing
> callers to directly pass a value leads to simpler code for most callers.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/leds/led-triggers.c              | 16 ++++++++--------
>  drivers/leds/trigger/ledtrig-disk.c      |  9 +++------
>  drivers/leds/trigger/ledtrig-mtd.c       |  8 ++------
>  drivers/net/arcnet/arcnet.c              |  8 ++------
>  drivers/power/supply/power_supply_leds.c |  5 +----
>  drivers/usb/common/led.c                 |  4 +---
>  include/linux/leds.h                     | 16 ++++++++--------
>  net/mac80211/led.c                       |  2 +-
>  net/mac80211/led.h                       |  8 ++------
>  net/netfilter/xt_LED.c                   |  3 +--
>  10 files changed, 29 insertions(+), 50 deletions(-)

Just came to apply this and realised that you have touched other
subsystems without Cc'ing the appropriate maintainers.

Please can you [RESEND] this set and include them please?

-- 
Lee Jones [李琼斯]
