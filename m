Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8B5E6DED4D
	for <lists+linux-leds@lfdr.de>; Wed, 12 Apr 2023 10:13:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229995AbjDLIN6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 12 Apr 2023 04:13:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229957AbjDLINx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 12 Apr 2023 04:13:53 -0400
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:191:4433::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C66B011A
        for <linux-leds@vger.kernel.org>; Wed, 12 Apr 2023 01:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
        Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
        Resent-Cc:Resent-Message-ID; bh=gHdoHrLP3B5uWEgvrWOI9/6u9e832i3d/czzGbQzMOo=;
        t=1681287231; x=1682496831; b=RmOyMI0KlFpmo9/81AuTXNj3Z99ugYh74qXSBNk0hjvrAMG
        tZ4Q3MbR/1ZR4DXH4OGV25v7r8snxquJBXFDvUypa0dd3ujRSKAsK3SD9ZAeWYeAueqsbqGU/MVmc
        dlldMvQHl11dzmMKfH7HOnssiy4z+VliHzvLzE9xkD4ojpHEkYWIAbXs9ltv45IKwz9ceiIUgx4/D
        RhcjH+ypinCeWLaeuhTi8D87u6kcLJMLFBCRvTAR9B8RmmM5LGRjDdYDFJe7yzoK90BdivzmLKIda
        +mtRTR8IrxsBVmJV2Y6AWCcf/rCEsrb65Ha16mweXt+Mph4ZeHDwSv8mLbZBDkNA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
        (Exim 4.96)
        (envelope-from <johannes@sipsolutions.net>)
        id 1pmVbu-00DYvp-2E;
        Wed, 12 Apr 2023 10:13:46 +0200
Message-ID: <0e0bf2a681db18c20eb9913b23d8ff2d5fddfe90.camel@sipsolutions.net>
Subject: Re: "leds: trigger: use RCU to protect the led_cdevs list" triggers
 RCU error checks
From:   Johannes Berg <johannes@sipsolutions.net>
To:     Hans de Goede <hdegoede@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>
Date:   Wed, 12 Apr 2023 10:13:45 +0200
In-Reply-To: <73428542-6aaf-5db3-9d67-f73cf1082695@redhat.com>
References: <600cc06e-081d-cd90-947d-f8988f1af194@redhat.com>
         <b449dda32e0f3bb0adeeda4fd0e1e7f58a29b43f.camel@sipsolutions.net>
         <73428542-6aaf-5db3-9d67-f73cf1082695@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

> So I just checked and the following LED drivers all have
> a blink_set() implementation which calls mutex_lock()
> and/or does I2C transfers:

<snip>

Yay ...

> And looking at: include/linux/leds.h
>=20
> Then the brightness_set callback is explicitly marked as
> "Must not sleep." (and there is a brightness_set_blocking
> which e.g. I2C drivers can use instead).
>=20
> So I believe that the intention has always been that
> a driver's blink_set callback is allowed to sleep.

I guess I wouldn't really go that far from the lack of a comment saying
it cannot sleep :-)


> With that said you seem to be right that there seems to
> be a long standing bug where led_trigger_blink[_oneshot]
> calls led_classdev.blink_set() in a context where it may
> not sleep.
>=20
> But that is more of a LED (trigger) core bug then an
> issue with the driver(s).

IMHO that's arguable, but I'm not going to quibble over it.

> Hmm, so the irqsave part of this was introduced by commit 27af8e2c90fb
> ("leds: trigger: fix potential deadlock with libata")=C2=A0

Indeed.

> but even before
> then I think sleeping here was not allowed, given that an rwlock is
> a spinlock variant the non irqsave version also leads to a section
> where sleeping is not allowed I believe.

Right. Which goes back to 0b9536c95709 ("leds: Add ability to blink via
simple trigger") where blinking was made possible from a trigger ...

> Further git archeology seems to indicate that this problem has existed
> for a long long time already. I guess I'm the first user of a trigger
> which calls led_trigger_blink[_oneshot] on a led_classdev with
> a hw blink_set() implementation which sleeps. Or at least I'm
> the first user to do so with various lock-debugging options
> enabled ...

Right...

> but this seems to be a (trigger) core bug
> so lets try to solve it there.
>=20

It's not so easy to fix I guess, other than maybe to defer to a
workqueue, but then you have the issue of cancelling?

Note that led_trigger_blink() also doesn't document when it's allowed to
be called, and at least in mac80211 (my code, yay) we're calling it from
a timer, so can't possibly sleep there. There's only one other caller in
the power supply code, but that can actually sleep.

I'd have a least thought of srcu if that timer weren't the case in
mac80211, but as is that doesn't help ...

So not sure. Clearly it's a long-standing issue, and given that many
drivers are affected probably better to fix it in the LED core, but I
don't really know my way around it very well either.

johannes
