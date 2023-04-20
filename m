Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C7DC6E92ED
	for <lists+linux-leds@lfdr.de>; Thu, 20 Apr 2023 13:37:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233953AbjDTLhJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 20 Apr 2023 07:37:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230246AbjDTLhI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 20 Apr 2023 07:37:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B195E188
        for <linux-leds@vger.kernel.org>; Thu, 20 Apr 2023 04:36:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 428C360F09
        for <linux-leds@vger.kernel.org>; Thu, 20 Apr 2023 11:36:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88C82C433EF;
        Thu, 20 Apr 2023 11:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681990617;
        bh=HBa+4Qd8r37iNyV1UoWhvg5r6O+k3mmqVNYzn79DfMA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kCe31+AReufc61afU4wh+UEHVML/wQWkaMNg1EHqSNHS1HEQxI5eUhnIUBer0yB+l
         jfqET/2dgNXiiJDWOZShNAYq7x7knN9GndcDwkAfXeOlcmTJQrBNM7D+TF2RoCyOEg
         xoWfZjSGC1BvzJB1456dys3j2jLhoDwUdihTD2rS2K/sTkAvpu52a+jGDuvpwrF4c1
         VjG9iABoPjni8+xaA9TL9CAjdSauPGeCoLTUItY9V9b5f4UsEHPBAas0hgnTXZkV5T
         o/w7TxclpSO8yuYXJ7Zjlu69nYji0AfIeArrctsUz3CrOSYJVMazMaTcp/iPYhr0Qa
         XYrFSVWeQIZag==
Date:   Thu, 20 Apr 2023 12:36:53 +0100
From:   Lee Jones <lee@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH 0/4] Fix oops about sleeping in led_trigger_blink()
Message-ID: <20230420113653.GD970483@google.com>
References: <20230412215855.593541-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230412215855.593541-1-hdegoede@redhat.com>
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

> Hi All,
> 
> Here is a patch series to fix an oops about sleeping in led_trigger_blink()
> + one other small bugfix.
> 
> Patches 1-3 should arguably have a:
> 
> Fixes: 0b9536c95709 ("leds: Add ability to blink via simple trigger")
> 
> tag, but Fixes tags tend to lead to patches getting automatically added
> to the stable series and I would prefer to see this series get some
> significant testing time in mainline first, so I have chosen to omit
> the tag.

With subjects with the word "fix" in it, they will be hoovered up by the
Stable auto-picker anyway.

> Hans de Goede (4):
>   leds: Change led_trigger_blink[_oneshot]() delay parameters to
>     pass-by-value
>   leds: Fix set_brightness_delayed() race
>   leds: Fix oops about sleeping in led_trigger_blink()
>   leds: Clear LED_INIT_DEFAULT_TRIGGER when clearing current trigger
> 
>  drivers/leds/led-core.c                  | 81 ++++++++++++++++++++----
>  drivers/leds/led-triggers.c              | 17 ++---
>  drivers/leds/trigger/ledtrig-disk.c      |  9 +--
>  drivers/leds/trigger/ledtrig-mtd.c       |  8 +--
>  drivers/net/arcnet/arcnet.c              |  8 +--
>  drivers/power/supply/power_supply_leds.c |  5 +-
>  drivers/usb/common/led.c                 |  4 +-
>  include/linux/leds.h                     | 43 ++++++++++---
>  net/mac80211/led.c                       |  2 +-
>  net/mac80211/led.h                       |  8 +--
>  net/netfilter/xt_LED.c                   |  3 +-
>  11 files changed, 125 insertions(+), 63 deletions(-)
> 
> -- 
> 2.39.1
> 

-- 
Lee Jones [李琼斯]
