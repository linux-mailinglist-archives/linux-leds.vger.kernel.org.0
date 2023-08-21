Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41E7D7826BA
	for <lists+linux-leds@lfdr.de>; Mon, 21 Aug 2023 12:01:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234544AbjHUKBn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 21 Aug 2023 06:01:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232433AbjHUKBm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 21 Aug 2023 06:01:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C7DACA
        for <linux-leds@vger.kernel.org>; Mon, 21 Aug 2023 03:01:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 966CC61450
        for <linux-leds@vger.kernel.org>; Mon, 21 Aug 2023 10:01:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 072B6C433C7;
        Mon, 21 Aug 2023 10:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692612099;
        bh=rAM/XX7ZvFaol9h3aPBqGQJavtSgldNAPhftBzv+5TY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=lPNmXi8KWwVj8otBVg3pzDgbaJs/nCImkuSgsKpgHgE0c9nCuKrmPpqphWLj9+8Aa
         rk5nBHTrZeLgvad8d5L/wimi8VCSAqBSoKwcoXXDrDVxDYKrNWVJ6oo7mhtcTktXtA
         N8C0R3DDJyVbvaCHPK64lACdLYd2+MWAhfGfex/yhaDI54hm2V+/wy6sq6DimRA7/l
         RIvKHX464C7YK7obEONgdfi/SoLKx1G83Cn+g6s5M49zTkg5xvAaF5KHh7Slmgxehu
         EkU0SR9r5rE6oyjs8UHJ0g7uecJEoUvjKhsndzs4FwgUtbaKRezr37g1+l2AnYWYhi
         Bun115/sFnfyw==
Date:   Mon, 21 Aug 2023 12:01:36 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Lee Jones <lee@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Subject: Re: [PATCH v3 2/6] leds: turris-omnia: do not use SMBUS calls
Message-ID: <20230821120136.130cc916@dellmb>
In-Reply-To: <20230818080854.GO986605@google.com>
References: <20230802160748.11208-1-kabel@kernel.org>
        <20230802160748.11208-3-kabel@kernel.org>
        <20230818080854.GO986605@google.com>
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

On Fri, 18 Aug 2023 09:08:54 +0100
Lee Jones <lee@kernel.org> wrote:

> On Wed, 02 Aug 2023, Marek Beh=C3=BAn wrote:
>=20
> > The leds-turris-omnia driver uses three function for I2C access:
> > - i2c_smbus_write_byte_data() and i2c_smbus_read_byte_data(), which
> >   cause an emulated SMBUS transfer,
> > - i2c_master_send(), which causes an ordinary I2C transfer.
> >=20
> > The Turris Omnia MCU LED controller is not semantically SMBUS, it
> > operates as a simple I2C bus. It does not implement any of the SMBUS
> > specific features, like PEC, or procedure calls, or anything. Moreover
> > the I2C controller driver also does not implement SMBUS, and so the
> > emulated SMBUS procedure from drivers/i2c/i2c-core-smbus.c is used for
> > the SMBUS calls, which gives an unnecessary overhead.
> >=20
> > When I first wrote the driver, I was unaware of these facts, and I
> > simply used the first function that worked.
> >=20
> > Drop the I2C SMBUS calls and instead use simple I2C transfers.
> >=20
> > Fixes: 089381b27abe ("leds: initial support for Turris Omnia LEDs")
> > Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>
> > ---
> >  drivers/leds/leds-turris-omnia.c | 56 +++++++++++++++++++++++++-------
> >  1 file changed, 44 insertions(+), 12 deletions(-)
> >=20
> > diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turri=
s-omnia.c
> > index bbd610100e41..bb2a2b411a56 100644
> > --- a/drivers/leds/leds-turris-omnia.c
> > +++ b/drivers/leds/leds-turris-omnia.c
> > @@ -2,7 +2,7 @@
> >  /*
> >   * CZ.NIC's Turris Omnia LEDs driver
> >   *
> > - * 2020 by Marek Beh=C3=BAn <kabel@kernel.org>
> > + * 2020, 2023 by Marek Beh=C3=BAn <kabel@kernel.org>
> >   */
> > =20
> >  #include <linux/i2c.h>
> > @@ -41,6 +41,40 @@ struct omnia_leds {
> >  	struct omnia_led leds[];
> >  };
> > =20
> > +static int omnia_cmd_write(const struct i2c_client *client, u8 cmd, u8=
 val)
> > +{
> > +	u8 buf[2] =3D { cmd, val };
> > +	int ret;
> > +
> > +	ret =3D i2c_master_send(client, buf, sizeof(buf));
> > +
> > +	return ret < 0 ? ret : 0; =20
>=20
> You don't need to normalise to zero here.
>=20
> The checks below all appear adequate to accept >0 as success.

The intended semantics of the new functions omnia_cmd_write()
and omnia_cmd_read() are that they inform about success. No other
information is required.

If I do not normalize to zero and simply return ret, on success, the
omnia_cmd_write() function would return the number of bytes written
over I2C, since that is what i2c_master_send(). But the code below that
uses these function is not interested in that information.

Moreover if I do this, one would expect similar semantics in the other
function introduced by this patch, omnia_cmd_read(). I do normalization
to zero here as well:

> > +	ret =3D i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
> > +	if (likely(ret =3D=3D ARRAY_SIZE(msgs)))
> > +		return reply;
> > +	else if (ret < 0)
> > +		return ret;
> > +	else
> > +		return -EIO;
> > +}

But how to do similar semantics here? i2c_transfer() returns the number
of successful I2C transfers, not the number of bytes read + written.

This is why I chose the semantics that I did: that both of these
functions should return zero on success, and negative errno on error.
This is a standard thing in Linux sources.

So, if you do insist on dropping the normalization to zero, I will do
it. But I do not agree with it...

Please reply if you do insist.

> > @@ -179,8 +212,7 @@ static ssize_t brightness_store(struct device *dev,=
 struct device_attribute *a,
> >  	if (brightness > 100)
> >  		return -EINVAL;
> > =20
> > -	ret =3D i2c_smbus_write_byte_data(client, CMD_LED_SET_BRIGHTNESS,
> > -					(u8)brightness);
> > +	ret =3D omnia_cmd_write(client, CMD_LED_SET_BRIGHTNESS, brightness);
> > =20
> >  	return ret < 0 ? ret : count; =20
>=20
> What's count here?  Is it bytes written?
>=20
> If so, can you simplify again and just return ret.

Device attribute _store method must always return count on success.
Count is the number of bytes written into the sysfs file. This has
nothing to do with the return value of omnia_cmd_write().

I can't return ret. If I did, on success, omnia_cmd_write() returns 0,
or it would return 2 if I dropped the normalization to zero as you
suggested above. None of these are related to the actual value I need
to return, which can be 2, 3 or 4. Consider the following command

  $ echo 100 >/sys/class/leds/<LED>/device/brightness

This would invoke calling the brightness_store() function with count=3D4,
because the buffer is 4 bytes long: "100\n". If I return ret, the
userspace would think that not all 4 bytes were written, and it would
try to write the remainign bytes again, invoking the function agagin...

Marek
