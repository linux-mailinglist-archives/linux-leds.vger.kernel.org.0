Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81F686DE50B
	for <lists+linux-leds@lfdr.de>; Tue, 11 Apr 2023 21:38:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbjDKTiJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 11 Apr 2023 15:38:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbjDKTiI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 11 Apr 2023 15:38:08 -0400
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:191:4433::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 056A34C21
        for <linux-leds@vger.kernel.org>; Tue, 11 Apr 2023 12:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
        Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
        Resent-Cc:Resent-Message-ID; bh=9aG83b7lABlYCVXwZUsspStuws6lBGgOiyhrjAW6KXg=;
        t=1681241886; x=1682451486; b=alN87aF2/pODdgpLtpBGseSH09fecSfZ8r2gkakW6NMVUgN
        oc57gCQps14zIN09Mz5VdFmjPUPz6PZPBlRlNf+Tcd6zc5jSswSfh8j067Uy+2lhlQkMxElEXZWix
        FAAJZ/Jv+d0wulOjigHgf9O2mvBFOO2AiIzn76h3pSSjd4RIH/rRcXbKsdWVh+y5sjCRDXY8LojML
        dnV0rB9u3M7tFOx8jAOJ4F25kl8IxPcxd8SrVHQyvQ0ow+FLdAzbDdUPIoAD6V/2d0Th0SLdYsI3T
        X96kXeQTxBztSk30sWlur6weiNhJT0V5S73y9qy6GmypkV6BP3nb6LpUnjQ7iwwQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
        (Exim 4.96)
        (envelope-from <johannes@sipsolutions.net>)
        id 1pmJoX-00CrZk-0s;
        Tue, 11 Apr 2023 21:38:01 +0200
Message-ID: <b449dda32e0f3bb0adeeda4fd0e1e7f58a29b43f.camel@sipsolutions.net>
Subject: Re: "leds: trigger: use RCU to protect the led_cdevs list" triggers
 RCU error checks
From:   Johannes Berg <johannes@sipsolutions.net>
To:     Hans de Goede <hdegoede@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>
Date:   Tue, 11 Apr 2023 21:38:00 +0200
In-Reply-To: <600cc06e-081d-cd90-947d-f8988f1af194@redhat.com>
References: <600cc06e-081d-cd90-947d-f8988f1af194@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

> Sorry to bring the bearer of bad news, but your commit 2a5a8fa8b23
> ("leds: trigger: use RCU to protect the led_cdevs list"),
> is causing the following RCU warning when used with blinking
> triggers on I2C LED controllers which support hw blinking.

Err, well, surely that is a pre-existing driver bug then?

> The specific problem is drivers/leds/led-triggers.c:
> led_trigger_blink_setup() which does:
>=20
>         rcu_read_lock();
>         list_for_each_entry_rcu(led_cdev, &trig->led_cdevs, trig_list) {
>                 if (oneshot)
>                         led_blink_set_oneshot(led_cdev, delay_on, delay_o=
ff,
>                                               invert);
>                 else
>                         led_blink_set(led_cdev, delay_on, delay_off);
>         }
>         rcu_read_unlock();
>=20
> And that led_blink_set() call then hits this path:
>=20
>         if (!test_bit(LED_BLINK_ONESHOT, &led_cdev->work_flags) &&
>             led_cdev->blink_set &&
>             !led_cdev->blink_set(led_cdev, delay_on, delay_off))
>                 return;
>=20
> Which calls directly into the LED controller driver

Sure, so far so good.

> which talks to the LED controller over I2C which may sleep.

Which seems to me was already wrong before my patch, since the code was:

       read_lock_irqsave(&trig->leddev_list_lock, flags);
       list_for_each_entry(led_cdev, &trig->led_cdevs, trig_list) {
               if (oneshot)
                       led_blink_set_oneshot(led_cdev, delay_on, delay_off,
                                             invert);
               else
                       led_blink_set(led_cdev, delay_on, delay_off);
       }
       read_unlock_irqrestore(&trig->leddev_list_lock, flags);


Surely, the code wasn't allowed to sleep in an _irqsave() section? You'd
just see a different check complain, rather than about RCU, I guess.


So maybe you're bringing bad news, but I don't think it's for me ;-) I
don't see cht_wc_leds_brightness_get() or a driver/module called
leds_cht_wcove even in linux-next, so I guess you should look wherever
you got _that_ from.

johannes
