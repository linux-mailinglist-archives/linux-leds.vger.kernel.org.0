Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 231107030F5
	for <lists+linux-leds@lfdr.de>; Mon, 15 May 2023 17:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242057AbjEOPGe (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 15 May 2023 11:06:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241705AbjEOPGc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 15 May 2023 11:06:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE506269D
        for <linux-leds@vger.kernel.org>; Mon, 15 May 2023 08:06:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 57AE9617E0
        for <linux-leds@vger.kernel.org>; Mon, 15 May 2023 15:06:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B95EC433EF;
        Mon, 15 May 2023 15:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684163172;
        bh=RX2MfB4j6Px4bqQtraHjTg86xdb/XT5q3soUzyS39c0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CWyNYUmxNKFrvCqF8vc0JDEWXdGonR7oTNVkIw2lcai6piVM5uBxTqUymNuxQySaQ
         d0HLhxLaJn6xRMpWiNxsPxZajb+n83RT9FdosXd9zgln61CJnBeXJogKIZe92S9GkH
         xtxA4OF5wPUTTgFxcGMJgmth0r0UYDC2zVScGrnKl14fM3Ksfl3g36xMI8ct1mVSHi
         NaYPDvlf+g3uyfvxahBSQ9ZpFIRfHquF0Rfa7XmkhX8HJFQTowMs06warmLQduCp4F
         k835WorsY414wxOXqgH03sz/z9BMC/cgRD8ijQxyZO1jQzpr68//hYECEn+OaaIC+e
         JZuCdbNhaxpbg==
Date:   Mon, 15 May 2023 16:06:07 +0100
From:   Lee Jones <lee@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Yauhen Kharuzhy <jekhor@gmail.com>, linux-leds@vger.kernel.org
Subject: Re: [PATCH v3 1/5] leds: Add Intel Cherry Trail Whiskey Cove PMIC
 LED driver
Message-ID: <20230515150607.GH10825@google.com>
References: <20230430195952.862527-1-hdegoede@redhat.com>
 <20230430195952.862527-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230430195952.862527-2-hdegoede@redhat.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, 30 Apr 2023, Hans de Goede wrote:

> From: Yauhen Kharuzhy <jekhor@gmail.com>
> 
> Add support for LEDs connected to the Intel Cherry Trail Whiskey Cove
> PMIC. Charger and general-purpose LEDs are supported. Hardware blinking
> is implemented, breathing is not.
> 
> This driver was tested with Lenovo Yoga Book notebook.
> 
> Changes by Hans de Goede (in response to review of v2):
> - Since the PMIC is connected to the battery any changes we make to
>   the LED settings are permanent, even surviving reboot / poweroff.
>   Save LED1 register settings on probe() and if auto-/hw-control was
>   enabled on probe() restore the settings on remove() and shutdown().
> - Delay switching LED1 to software control mode to first brightness write.
> - Use dynamically allocated drvdata instead of a global drvdata variable.
> - Ensure the LED is on when activating blinking.
> - Fix CHT_WC_LED_EFF_BREATHING val ((3 << 1) rather then BIT(3)).
> 
> Link: https://lore.kernel.org/r/20190212205901.13037-2-jekhor@gmail.com
> Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
> Co-developed-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v3:
> - Some comment tweaks and s/LED_OFF/0/
> - Refuse to load on the Yoga Tab 3 as it turns out the LED1 driver output
>   is connected to a haptic feedback motor there (and LED2 is unused)
> 
> Changes in v2:
> - Update comment about YB1 kernel source usage for register info
> - Replace "cht-wc::" LED name prefix with "platform::"
> - Add leds-cht-wcove to list of drivers using "platform::charging" in
>   Documentation/leds/well-known-leds.txt
> - Bail from cht_wc_leds_brightness_set() on first error
> - Make default blink 1Hz, like sw-blink default blink
> ---
>  Documentation/leds/well-known-leds.txt |   2 +-
>  drivers/leds/Kconfig                   |  11 +
>  drivers/leds/Makefile                  |   1 +
>  drivers/leds/leds-cht-wcove.c          | 380 +++++++++++++++++++++++++
>  4 files changed, 393 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/leds/leds-cht-wcove.c

Applied, thanks

-- 
Lee Jones [李琼斯]
