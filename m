Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A03C43FAD97
	for <lists+linux-leds@lfdr.de>; Sun, 29 Aug 2021 20:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231461AbhH2SAB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 29 Aug 2021 14:00:01 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:51626 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbhH2SAB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 29 Aug 2021 14:00:01 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 06DA41C0B76; Sun, 29 Aug 2021 19:59:07 +0200 (CEST)
Date:   Sun, 29 Aug 2021 19:59:07 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado 
        <nfraprado@collabora.com>, Dan Murphy <dmurphy@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-leds@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Brian Masney <masneyb@onstation.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Russell King <linux@armlinux.org.uk>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, ~lkcamp/patches@lists.sr.ht,
        =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@collabora.com>,
        kernel@collabora.com
Subject: Re: [PATCH v3 2/5] leds: Add driver for QCOM SPMI Flash LEDs
Message-ID: <20210829175906.GA663@amd>
References: <20210803162641.1525980-1-nfraprado@collabora.com>
 <20210803162641.1525980-3-nfraprado@collabora.com>
 <b1060e9a-f78e-fbe9-bde3-2b4d89cbc73e@gmail.com>
 <20210824214515.ekjpvaymkgxltlzp@notapiano>
 <278ea1e8-8b21-457d-78d7-fbb32544fe0a@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="/9DWx/yDrRhgMJTb"
Content-Disposition: inline
In-Reply-To: <278ea1e8-8b21-457d-78d7-fbb32544fe0a@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi both!

Please trim your replies (removing code you are not commenting
on). Scolling 600 lines to find where discussion is is not fun.

Best regards,
								Pavel

> >>>+static int qcom_flash_torch_on(struct qcom_flash_led *led)
> >>>+{
> >>>+	int rc, error;
> >>>+	struct qcom_flash_device *leds_dev =3D led_to_leds_dev(led);
> >>>+	struct device *dev =3D leds_dev->dev;
> >>>+
> >>>+	if (leds_dev->peripheral_subtype =3D=3D QCOM_FLASH_SUBTYPE_DUAL) {
> >>>+		rc =3D qcom_flash_torch_regulator_on(leds_dev);
> >>>+		if (rc)
> >>>+			goto error_reg_write;
> >>>+	} else if (leds_dev->peripheral_subtype =3D=3D QCOM_FLASH_SUBTYPE_SI=
NGLE) {
> >>>+		rc =3D qcom_flash_fled_regulator_on(leds_dev);
> >>
> >>Why for torch mode you need to enable fled regulator?
> >
> >Based on [1], apparently the hardware present in the Single variant of t=
he PMIC
> >has some limitation that requires the use of the flash regulator and the=
 value
> >QCOM_FLASH_ENABLE_ALL to enable the LEDs for the torch mode. The Dual va=
riant on
> >the other hand can just use the torch regulator and enables the LEDs with
> >QCOM_FLASH_ENABLE_MODULE.
> >
> >[1] https://github.com/AICP/kernel_lge_hammerhead/commit/0f47c747c074993=
655d0bfebd045e8ddd228fe4c
> >
> >I'm honestly not sure what the impact is on using the different regulato=
rs and
> >enable values. I have tested enabling the Dual PMIC with different enabl=
e values
> >and all seemed to work the same, so must be some hardware detail.
> >
> >I left that Single codepath in the hope that it is useful for devices th=
at have
> >that variant of the hardware, but I have only actually tested the Dual P=
MIC,
> >which is the one present on the Nexus 5.
>=20
> Thanks for the explanation. Just wanted to confirm that it was not
> a mistake.
>=20
> >>
> >>>+		if (rc)
> >>>+			goto error_flash_set;
> >>>+
> >>>+		/*
> >>>+		 * Write 0x80 to MODULE_ENABLE before writing
> >>>+		 * 0xE0 in order to avoid a hardware bug caused
> >>>+		 * by register value going from 0x00 to 0xE0.
> >>>+		 */
> >>>+		rc =3D qcom_flash_masked_write(leds_dev,
> >>>+					     QCOM_FLASH_ADDR_ENABLE_CONTROL,
> >>>+					     QCOM_FLASH_ENABLE_MODULE_MASK,
> >>>+					     QCOM_FLASH_ENABLE_MODULE);
> >>>+		if (rc) {
> >>>+			dev_err(dev, "Enable reg write failed(%d)\n", rc);
> >>>+			goto error_flash_set;
> >>>+		}
> >>>+	}
> >>>+
> >>>+	rc =3D qcom_flash_torch_reg_enable(leds_dev, true);
> >>>+	if (rc)
> >>>+		goto error_reg_write;
> >>>+
> >>>+	rc =3D qcom_flash_masked_write(leds_dev, QCOM_FLASH_ADDR_ENABLE_CONT=
ROL,
> >>>+				     QCOM_FLASH_ENABLE_MASK,
> >>>+				     leds_dev->torch_enable_cmd);
> >>>+	if (rc) {
> >>>+		dev_err(dev, "Enable reg write failed(%d)\n", rc);
> >>>+		goto error_reg_write;
> >>>+	}
> >>>+
> >>>+	rc =3D qcom_flash_masked_write(leds_dev, QCOM_FLASH_ADDR_LED_STROBE_=
CTRL,
> >>>+				     led->flash_strobe_cmd,
> >>>+				     led->flash_strobe_cmd);
> >>
> >>Just to make sure - the hardware requires strobe cmd to enable torch?
> >
> >Yes. The strobe value is the one that actually turns each of the LEDs on,
> >doesn't matter if it's on flash or torch mode. The difference in torch m=
ode is
> >actually just that the timeout on the LEDs is disabled (done by writing =
0x00
> >into the TORCH, 0xE4, register).
> >So for both modes, the LEDs are turned on by writing to the STROBE_CTRL,=
 0x47,
> >register. If torch is on they'll stay on indefinitely, while on flash mo=
de
> >they'll turn off after the timeout.
> >
> >Perhaps it's just a naming issue?
>=20
> I propose to add these comments next to the calls in question.


--=20
http://www.livejournal.com/~pavelmachek

--/9DWx/yDrRhgMJTb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmEryuoACgkQMOfwapXb+vITYACfTzmB/yQMp8pEyspMSXKVmTXc
00kAoIV7dtVg8PxzAHH9lUhUZiImRPmJ
=8kYL
-----END PGP SIGNATURE-----

--/9DWx/yDrRhgMJTb--
