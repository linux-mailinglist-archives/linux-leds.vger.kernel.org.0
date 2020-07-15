Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05987221333
	for <lists+linux-leds@lfdr.de>; Wed, 15 Jul 2020 19:07:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725861AbgGORHc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 15 Jul 2020 13:07:32 -0400
Received: from lists.nic.cz ([217.31.204.67]:50594 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725838AbgGORHb (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 15 Jul 2020 13:07:31 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTPSA id AD5D413F695;
        Wed, 15 Jul 2020 19:07:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1594832848; bh=VJj/3rJKfaRGY2IQDV9pYisRvsVavLbXwD9XAifjC1M=;
        h=Date:From:To;
        b=qWr4UoxZ1GL7pNbGinsFPhwXkbtxUFnBb2k1jiXNlUcz83T/I9NKE4w79cSLTwETT
         HdcNg6Ha6A3MtRzYscXljrqts8jDkQV5Ftf2xT1xj9kGWBIueOahqAAdIsUnBguFbN
         5SqSB/xPY3oDvRpElqnhvcIvEan/U8+XAfumNHlk=
Date:   Wed, 15 Jul 2020 19:07:27 +0200
From:   Marek =?ISO-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Ondrej Jirman <megous@megous.com>, linux-kernel@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>
Subject: Re: [PATCH RFC] leds: Add support for per-LED device triggers
Message-ID: <20200715190727.4bb528dc@dellmb.labs.office.nic.cz>
In-Reply-To: <20200711100409.GA18901@amd>
References: <20200702144712.1994685-1-megous@megous.com>
        <20200711100409.GA18901@amd>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WHITELIST shortcircuit=ham autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, 11 Jul 2020 12:04:09 +0200
Pavel Machek <pavel@ucw.cz> wrote:

> What about this? Should address Marek's concerns about resource use...
> 
> Best regards,
>      	   	 				       		Pavel
> 

...

> @@ -280,7 +291,8 @@ int led_trigger_register(struct led_trigger *trig)
>  	down_write(&triggers_list_lock);
>  	/* Make sure the trigger's name isn't already in use */
>  	list_for_each_entry(_trig, &trigger_list, next_trig) {
> -		if (!strcmp(_trig->name, trig->name)) {
> +		if (!strcmp(_trig->name, trig->name) &&
> +		    (!_trig->private_led || _trig->private_led ==
> trig->private_led)) { up_write(&triggers_list_lock);
>  			return -EEXIST;
>  		}

Hi Pavel,

Your proposal does not add private_led member to struct led_trigger. I
think you forgot to change this from Ondrej's proposal.
This should instead check:
  the names are same and both trigger have the same type (either none
  or same). In that case return -EEXIST.

Also a couple of lines below there is code for enabling this trigger
for LEDs that have it set as default trigger. There should also be a
check whether the trigger is relevant.

In the linux/leds.h header the trigger_type in led_classdev should be
inside the CONFIG_LEDS_TRIGGERS block.

I will send new version with an example usage for a Marvell PHY driver.

Marek
