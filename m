Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59B4F10386
	for <lists+linux-leds@lfdr.de>; Wed,  1 May 2019 02:38:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727368AbfEAAiF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 30 Apr 2019 20:38:05 -0400
Received: from mail.nic.cz ([217.31.204.67]:40950 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726115AbfEAAiF (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 30 Apr 2019 20:38:05 -0400
Received: from localhost (unknown [172.20.6.125])
        by mail.nic.cz (Postfix) with ESMTPS id 2069263157;
        Wed,  1 May 2019 02:38:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1556671083; bh=bewKT9KNebvX/ElR/ZHqxN4ZEldQgV+UjQiJ6PxU8EQ=;
        h=Date:From:To;
        b=C4mEGbxLmjwMVzXqWnS2JWdgeMljUyaSn8B/pCD4UrRcoJUEcQ7abOrQsb1Lokbbw
         2+SyrzjXZVjOJJgyX71nxQQrjZHnL3k/r53Q06PUNH2WM5jy5rAyJdcHCjvoRAJgv0
         KtsWXhr7mHp13z0W0Y+qGUiYapTmOedGm7DrG+O4=
Date:   Wed, 1 May 2019 02:38:02 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     <linux-leds@vger.kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH leds/for-next v2 2/2] leds: turris-omnia: Add support
 for 256 brightness values
Message-ID: <20190501023802.41f733ec@nic.cz>
In-Reply-To: <87eafec0-b074-689d-20b6-171a866745ea@ti.com>
References: <20190429212944.15643-1-marek.behun@nic.cz>
        <20190429212944.15643-3-marek.behun@nic.cz>
        <87eafec0-b074-689d-20b6-171a866745ea@ti.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.99.2 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Dan,

On Tue, 30 Apr 2019 14:46:09 -0500
Dan Murphy <dmurphy@ti.com> wrote:

> I am not seeing where or how this is done in the driver on probe.

In function omnia_led_register
https://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git/tree/drivers/leds/leds-turris-omnia.c?h=for-next#n107

> > +	u8 buf[5], state;  
...
> > +	buf[0] = CMD_LED_COLOR;
> > +	buf[1] = idx;
> > +	buf[2] = buf[3] = buf[4] = brightness;
> 
> Magic numbers

Hmm. Would these names be okay?
  CMD_LED_COLOR_LENGTH
  CMD_LED_COLOR_CMD
  CMD_LED_COLOR_LED_ID
  CMD_LED_COLOR_RED
  CMD_LED_COLOR_GREEN
  CMD_LED_COLOR_BLUE
If constants are used they have to indicate which command they apply to.
Or maybe a
  struct cmd_led_color {
    u8 cmd;
    u8 id;
    u8 red, green, blue;
  }
could be defined, but I think that this is used very sporadically in
the kernel.

> What happens if the LEDs are in HW triggered mode already?
> Should this not be checked especially if the driver is removed and re-installed the uP has
> this configured as HW mode.  Unless you reset the uP as well.

In current version of this driver on driver probe all LEDs are put into
SW mode. On driver remove they are put to HW mode. It is not possible
to read from the microcontroller in which mode they are.

> > +	led->cdev.max_brightness = 255;  
> 
> How about LED_FULL?

I thought about this but was not sure, for the same reason Pavel
mentioned: I wanted to indicate that this microcontroller supports 8bit
per channel. LED_FULL is a kernel specific macro and although it will
never change and is equal, it makes less (fewer?) sense to me to use it.
But I will change it in the next version per your request.

Marek
