Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8B6C7826D2
	for <lists+linux-leds@lfdr.de>; Mon, 21 Aug 2023 12:14:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234579AbjHUKOZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 21 Aug 2023 06:14:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234573AbjHUKOZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 21 Aug 2023 06:14:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6426FCE
        for <linux-leds@vger.kernel.org>; Mon, 21 Aug 2023 03:14:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F1AAC612C9
        for <linux-leds@vger.kernel.org>; Mon, 21 Aug 2023 10:14:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5335AC433C7;
        Mon, 21 Aug 2023 10:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692612862;
        bh=BETTOX42je7uf97OjYVUw/9pAoZsE1a2OKa/CZx4vEI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=JXS6ogdRP8FUE6FMxcHnff9SlgtGNuxkGO34Wt3cj1LpTZQBuhwM+qmD2nreiVBLU
         FydnncuM9U9zB4qrZJ6/R0353oZPlNrcR0Ju0VG+16j8TNfA9De1iMBW1MHU+BfamP
         3WlTxWgKrsvIG3K2gmU24beNPwo+r2JPazUnQokEEKWcK2QOwp8BTKW8BLguzDJTT1
         h1ChEVBnCtr2FysDeBYPA+YlrI4590WcBCk6wc1SbHfvNTqSzJ+sohXNvhbau73Nau
         HC+KZhUJuUQz376Qo3bV8L0LeDkMMa4ZOoY/hUUCZrMVclf2YWf56SOpKePac5DTcc
         Vp2K85vKmwjvg==
Date:   Mon, 21 Aug 2023 12:14:18 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Lee Jones <lee@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Subject: Re: [PATCH v3 4/6] leds: turris-omnia: make set_brightness() more
 efficient
Message-ID: <20230821121418.67155ca3@dellmb>
In-Reply-To: <20230818094255.GR986605@google.com>
References: <20230802160748.11208-1-kabel@kernel.org>
        <20230802160748.11208-5-kabel@kernel.org>
        <20230818094255.GR986605@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 18 Aug 2023 10:42:55 +0100
Lee Jones <lee@kernel.org> wrote:

> On Wed, 02 Aug 2023, Marek Beh=C3=BAn wrote:
>=20
> > Implement caching of the LED color and state values that are sent to MCU
> > in order to make the set_brightness() operation more efficient by
> > avoiding I2C transactions which are not needed. =20
>=20
> How many transactions does all of this extra code actually save?

Depends on how many transactions are requested by userspace wanting to
change LED brightness, but see below.

> > On Turris Omnia's MCU, which acts as the RGB LED controller, each LED
> > has a RGB color, and a ON/OFF state, which are configurable via I2C
> > commands CMD_LED_COLOR and CMD_LED_STATE.
> >=20
> > The CMD_LED_COLOR command sends 5 bytes and the CMD_LED_STATE command 2
> > bytes over the I2C bus, which operates at 100 kHz. With I2C overhead
> > this allows only ~1670 color changing commands and ~3200 state changing
> > commands per second. =20
>=20
> Only?  Seems like quite a lot.

I may have chosen the wrong argument here. Yes, 1670 color changing
commands are more than enough for a LED controller. This is not the
problem.

The problem is that the we need to be able to send other commands over
the same I2C bus, unrelated to the LED controller, and they need the
bandwidth. The MCU exposes an interrupt interface, and it can trigger
hundreds of interrupts per second. Each time we need to read the
interrupt state register. Whenever we are sending a LED color/state
changing command, the interrupt reading is waiting.

So this is the reason why I want to avoid unnecessary I2C transactions.

If I change the commit message to explain this, will you be satisfied?


> > Currently, every time LED brightness or LED multi intensity is changed,
> > we send a CMD_LED_STATE command, and if the computed color (brightness
> > adjusted multi_intensity) is non-zero, we also send a CMD_LED_COLOR
> > command.
> >=20
> > Consider for example the situation when we have a netdev trigger enabled
> > for a LED. The netdev trigger does not change the LED color, only the
> > brightness (either to 0 or to currently configured brightness), and so
> > there is no need to send the CMD_LED_COLOR command. But each change of
> > brightness to 0 sends one CMD_LED_STATE command, and each change of
> > brightness to max_brightness sends one CMD_LED_STATE command and one
> > CMD_LED_COLOR command:
> >     set_brightness(0)   ->  CMD_LED_STATE
> >     set_brightness(255) ->  CMD_LED_STATE + CMD_LED_COLOR
> >                                             (unnecessary)
> >=20
> > We can avoid the unnecessary I2C transactions if we cache the values of
> > state and color that are sent to the controller. If the color does not
> > change from the one previously sent, there is no need to do the
> > CMD_LED_COLOR I2C transaction, and if the state does not change, there
> > is no need to do the CMD_LED_STATE transaction.
> >=20
> > Because we need to make sure that out cached values are consistent with=
 =20
>=20
> Nit: "our"
>=20

Thanks, I will fix this.

> > +
> > +	/* send the color change command */ =20
>=20
> Nit: Please start comments with an upper case char.

OK, I will change it.

> > +	ret =3D i2c_master_send(client, cmd, 5);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	/* cache the RGB channel brightnesses */
> > +	for (int i =3D 0; i < OMNIA_LED_NUM_CHANNELS; ++i) =20
>=20
> Why the pre-increment?
>=20
> It's non-standard and doesn't appear to have any affect.

According to git grep, current Linux sources contain around 7606
occurances of pre-increment (++x) in for cycles:
  git grep '; ++[a-z_]\+)' | wc -l

and 81360 occurances of post-increment (x++):
  git grep '; [a-z_]\+++)' | wc -l

Yes, I admit that pre-increment is 10 times less frequent, but I do not
consider that to be non-standard.

If you insist on this, I will change it. But I consider this
non-consequential...

Please let me know whether you insist on it.

Marek
