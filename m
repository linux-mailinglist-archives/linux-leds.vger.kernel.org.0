Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E565F5BFCB7
	for <lists+linux-leds@lfdr.de>; Wed, 21 Sep 2022 13:05:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbiIULFx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 21 Sep 2022 07:05:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229706AbiIULFv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 21 Sep 2022 07:05:51 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B79E7B1D3
        for <linux-leds@vger.kernel.org>; Wed, 21 Sep 2022 04:05:49 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 6D9EC1C0001; Wed, 21 Sep 2022 13:05:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1663758348;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=fy0/v/8ASNWn0FxesNveigrvSd8p5+Rzga2ouWzFbTw=;
        b=cuw1nsjVdWR1bBKvOEVyxyrplu2PGLRf12jlqXxMpxhZs0TaLzQSuOZdrMbzo506r9Y0rc
        3DKrQzxWf8B2Hh0Tspg4mz8BQsyeWzRbq1TgYSF8E3lac/E1wo1RjPlk/Pb1c4iJMkPelv
        UyKis7KCyyoI55DJOmSfLAhsIMIdlxc=
Date:   Wed, 21 Sep 2022 13:05:47 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Ian Pilcher <arequipeno@gmail.com>
Cc:     linux-leds@vger.kernel.org, kabel@kernel.org, lee.jones@linaro.org
Subject: Re: [PATCH v11 1/2] docs: Add block device (blkdev) LED trigger
 documentation
Message-ID: <20220921110547.GC22654@duo.ucw.cz>
References: <20220915205018.447014-1-arequipeno@gmail.com>
 <20220915205018.447014-2-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="O3RTKUHj+75w1tg5"
Content-Disposition: inline
In-Reply-To: <20220915205018.447014-2-arequipeno@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--O3RTKUHj+75w1tg5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Add Documentation/ABI/testing/sysfs-class-led-trigger-blkdev to
> document:
>=20
>   * /sys/class/leds/<led>/blink_time
>   * /sys/class/leds/<led>/check_interval
>   * /sys/class/leds/<led>/blink_on_{read,write,discard,flush}
>   * /sys/class/leds/<led>/link_dev_by_path
>   * /sys/class/leds/<led>/unlink_dev_by_path
>   * /sys/class/leds/<led>/linked_devices
>=20

> +What:		/sys/class/leds/<led>/check_interval
> +Date:		September 2022
> +Contact:	Ian Pilcher <arequipeno@gmail.com>
> +Description:
> +		Frequency (in milliseconds) with which block devices linked to
> +		this LED will be checked for activity and the LED will
> +		(potentially) be blinked.

Frequency -> interval.

> +What:		/sys/class/leds/<led>/link_dev_by_path
> +Date:		September 2022
> +Contact:	Ian Pilcher <arequipeno@gmail.com>
> +Description:
> +		Associate a block device with this LED by writing the path to
> +		the device special file (e.g. /dev/sda) to this attribute.
> +		Symbolic links are followed.

Following symbolic links to paths written to file is "interesting".

> +What:		/sys/class/leds/<led>/linked_devices
> +Date:		September 2022
> +Contact:	Ian Pilcher <arequipeno@gmail.com>
> +Description:
> +		Directory containing links to all block devices that are
> +		associated with this LED.  (Note that the names of the
> +		symbolic links in this directory are *kernel* names, which
> +		may not match the device special file paths written to
> +		link_device and unlink_device.)

As is mismatch between kernel names here and what names the other file
expects.

Can we get something more reasonable?

Thanks,
									Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--O3RTKUHj+75w1tg5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYyrwCwAKCRAw5/Bqldv6
8iK/AKCxWJLR3a2s5OgzsqCUhm32ngrfnACbB9YmRKHQDWCW2Vo9HVtMhPpjB+4=
=/iao
-----END PGP SIGNATURE-----

--O3RTKUHj+75w1tg5--
