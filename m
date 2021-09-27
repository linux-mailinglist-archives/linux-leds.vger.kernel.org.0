Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 533B1419D57
	for <lists+linux-leds@lfdr.de>; Mon, 27 Sep 2021 19:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236628AbhI0Rs4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Sep 2021 13:48:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237574AbhI0Rso (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 Sep 2021 13:48:44 -0400
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:191:4433::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22B12C04E3DF
        for <linux-leds@vger.kernel.org>; Mon, 27 Sep 2021 10:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
        Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
        Resent-Cc:Resent-Message-ID; bh=/lMSzC19MpAyps57TwL2c9cCcKYBTNtZgOH+La0O9gc=;
        t=1632764188; x=1633973788; b=jHmUshdIlrgd1G5vDAdwLbyoNVgzbQHi2cx9xTbEYgGdAdJ
        16uu/S7KhRkSDg5PXSY1iw8SRqPA0+81OiKzdlrUv0LwvtNLihCn/jjDVvTN2E4nmmFLp7yL9sniu
        WFqbZ1639UTGrHwm2jW2lrXsQBSUWFooUygL504edcawcjUPF+puZwwhI7jlS/LCfpGsm5+2EdS6r
        jmvOlcu07WsVg4xiOpJsdyClECmgcEDziFZoYcr63gAZsO3UPKnbdTmKLakj8raPlsn14NzeQ5nek
        L+/wktaQ42iQzfPVKonCKCE3Rx2km5quMnzEn82OwmOnUy+7P8hn2Az4UpR7XjWA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
        (Exim 4.95-RC2)
        (envelope-from <johannes@sipsolutions.net>)
        id 1mUuYC-00CWar-Gx;
        Mon, 27 Sep 2021 19:36:24 +0200
Message-ID: <044da7aa2a4300bada4ee7c8efb7f7b5ef425256.camel@sipsolutions.net>
Subject: Re: [PATCH] leds: trigger: Disable CPU trigger on PREEMPT_RT
From:   Johannes Berg <johannes@sipsolutions.net>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Pavel Machek <pavel@ucw.cz>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Date:   Mon, 27 Sep 2021 19:36:23 +0200
In-Reply-To: <20210927171802.uak3tbpqaig3mm7m@linutronix.de>
References: <20210924111501.m57cwwn7ahiyxxdd@linutronix.de>
         <20210927142345.GB18276@duo.ucw.cz> <87wnn2av6h.ffs@tglx>
         <20210927154451.GA17112@duo.ucw.cz>
         <20210927171802.uak3tbpqaig3mm7m@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-malware-bazaar: not-scanned
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 2021-09-27 at 17:18 +0000, Sebastian Andrzej Siewior wrote:
> On 2021-09-27 17:44:51 [+0200], Pavel Machek wrote:
> > 
> > Would you mind reading and responding to the rest of the email?
> 
> The patch you mentioned,
>   https://https://lkml.kernel.org/r/.kernel.org/all/20210915181601.99a68f5718be.I1a28b342d2d52cdeeeb81ecd6020c25cbf1dbfc0@changeid/
> 
> would remove the lock from led_trigger_event().
> Are there any guarantees how many callbacks maybe invoked and what kind
> of locks may be acquired?

In a way, the point of my patch is that after it we don't have to *care*
what locking happens in the callbacks.

The problem in our driver was that we did a spinlock without disabling
IRQs there in the callback, and that interacts badly with the rwlock in
the LED subsystem.

> Leaving kworker usage aside there are still things like spinlock_t usage
> in input_leds_brightness_set(), nic78bx_brightness_set() (from a quick
> grep) which have the same problems.

Looks like *everything* (that can work on ARM) and uses a spinlock would
have this problem? My patch doesn't address that at all. In fact, like I
said above, the entire point of the patch is to remove restrictions on
what the locking in the underlying LED driver can be.

johannes

