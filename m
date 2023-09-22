Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DA9D7AB05E
	for <lists+linux-leds@lfdr.de>; Fri, 22 Sep 2023 13:17:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233512AbjIVLRE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 22 Sep 2023 07:17:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230156AbjIVLRE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 22 Sep 2023 07:17:04 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAD26CA
        for <linux-leds@vger.kernel.org>; Fri, 22 Sep 2023 04:16:58 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3F73C433C7;
        Fri, 22 Sep 2023 11:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695381418;
        bh=QT5O7/kfb/gaCVF7M6/tTux1PfknB5+vtoV0TxuTvlU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Wz7ySW3FaryTwP5M5E2N2PAv/zv9ug62100Bn87mtf5D7+51+wNBtyjpf0LaxXsx3
         2HRgrXPQqOHiMv0pqSAGdBM6hy+oy7aLSWL/fc6AAkq4B6Atl7zGs8RweqF8S5mDme
         36BA9gegoXRZPIIKywm9OE58egseZsp3yHs5jBA0t1hR0bFa4lutGD4+C6YZrhqq3A
         4YDwp1W4+Xa8feE2IneBFPAWU9mL0oGwHyDK7gq5G4RPtlRtRGC62Iso/S8t/jOJay
         uErGSir5mUDR8p/C4+yzXrtdFwTNga/L+hPhcSwj9DJp6ELVpElQjhrP2Wsdp2gsMZ
         L6u6SRLzIEcAw==
Date:   Fri, 22 Sep 2023 13:16:54 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Lee Jones <lee@kernel.org>
Cc:     linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: turris-omnia: Fix unused variable
Message-ID: <20230922131654.2172a184@dellmb>
In-Reply-To: <20230922065919.GA3660432@google.com>
References: <20230921205025.20303-1-kabel@kernel.org>
        <20230922065919.GA3660432@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 22 Sep 2023 07:59:19 +0100
Lee Jones <lee@kernel.org> wrote:

> On Thu, 21 Sep 2023, Marek Beh=C3=BAn wrote:
>=20
> > The variable ret is not used in this function.
> >=20
> > Fixes: 28350bc0ac77 ("leds: turris-omnia: Do not use SMBUS calls")
> > Closes: https://lore.kernel.org/linux-leds/202309212215.Yl5VQaSm-lkp@in=
tel.com/T/#u
> > Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>
> > ---
> >  drivers/leds/leds-turris-omnia.c | 1 -
> >  1 file changed, 1 deletion(-) =20
>=20
> I already fixed and squashed this.
>=20
> How was this missed when you tested the set?

I am not sure, but it is possible that I've refactored that function
from my original (return 0 on success) to your proposed (return number
of written bytes on success) and did not notice the warning. I am sure
I tested that the result works. Maybe I switched to another terminal
where I was testing it too fast and did not notice the warning.

Sorry about this.

Anyway, I have a question. Several days ago I also sent for review
a new driver for other feautres the Turris Omnia MCU provides (GPIO,
watchdog, wakeup+poweroff).
There, I also refactored the _write and _read functions as you
suggested (to return the number of bytes written/read).
On review, Andy Shevchenko requested [1] to refactor it to my original
(return 0 on success). I mentioned to him [2] your request, to which he
replied [3]:
  This is strange. For example, regmap APIs never returns amount of
  data written or read. I think it's solely depends on the API. It might
  be useful for i=C2=B2c APIs, in case you can do something about it. but if
  you have wrappers on top of that already (meaning not using directly
  the i2c_*() calls, I dunno the positive return is anyhow useful.
Since I agree with him, taking this into account, would you accept a
patch that returns those function to how I originally wrote them
(return 0 on success)?

Thanks.

Marek

[1]
https://lore.kernel.org/linux-gpio/ZQmUFPvIx91+ps6k@smile.fi.intel.com/
[2]
https://lore.kernel.org/linux-gpio/ZQnn+Gi0xVlsGCYA@smile.fi.intel.com/
[3]
https://lore.kernel.org/linux-gpio/ZQnn+Gi0xVlsGCYA@smile.fi.intel.com/
