Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0AB53CCE56
	for <lists+linux-leds@lfdr.de>; Mon, 19 Jul 2021 09:17:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234648AbhGSHT7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 19 Jul 2021 03:19:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234617AbhGSHT7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 19 Jul 2021 03:19:59 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F18B6C061766
        for <linux-leds@vger.kernel.org>; Mon, 19 Jul 2021 00:16:59 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:80b1:eb38:fde3:179e])
        by andre.telenet-ops.be with bizsmtp
        id WvGt250040UDlMe01vGtJ9; Mon, 19 Jul 2021 09:16:55 +0200
Received: from geert (helo=localhost)
        by ramsan.of.borg with local-esmtp (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m5NWG-000kQw-VC; Mon, 19 Jul 2021 09:16:52 +0200
Date:   Mon, 19 Jul 2021 09:16:52 +0200 (CEST)
From:   Geert Uytterhoeven <geert@linux-m68k.org>
X-X-Sender: geert@ramsan.of.borg
To:     Amy Parker <apark0006@student.cerritos.edu>
cc:     pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] swap led_brightness from enum to typedef
In-Reply-To: <9b5902665dcc4c0fca7546987303e348d8657f59.1626383424.git.apark0006@student.cerritos.edu>
Message-ID: <alpine.DEB.2.22.394.2107190912320.178229@ramsan.of.borg>
References: <cover.1626383424.git.apark0006@student.cerritos.edu> <9b5902665dcc4c0fca7546987303e348d8657f59.1626383424.git.apark0006@student.cerritos.edu>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

 	Hi Amy,

On Thu, 15 Jul 2021, Amy Parker wrote:
> This commit changes how led_brightness, declared in header file
> include/linux/leds.h, works throughout the kernel, and updates other
> files in accordance.
>
> The TODO located at drivers/leds/TODO requests:
>
> * Get rid of led_brightness
>
> It is really an integer, as maximum is configurable. Get rid of it, or
> make it into typedef or something.
>
> This patch changes the declaration of led_brightness from an enum to a
> typedef. In order to hold the currently existing enum values, macro
> definitions are provided. Files which use led_brightness are updated to
> conform to the new types.
>
> Signed-off-by: Amy Parker <apark0006@student.cerritos.edu>

Thanks for your patch!

> 207 files changed, 437 insertions(+), 438 deletions(-)

This touches a lot of files, so we better get it right.

> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -26,12 +26,11 @@ struct device_node;
>  */
>
> /* This is obsolete/useless. We now support variable maximum brightness. */
> -enum led_brightness {
> -	LED_OFF		= 0,
> -	LED_ON		= 1,
> -	LED_HALF	= 127,
> -	LED_FULL	= 255,
> -};
> +typedef u8 led_brightness;

In general, typedefs are frowned upon in the kernel, but there can be a
good reason to use one.
What if the maximum brightness is larger than 255?
Using "unsigned int" sounds better to me, but let's wait for Pavel...

> +#define LED_OFF 0
> +#define LED_ON 1
> +#define LED_HALF 127
> +#define LED_FULL 255

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
