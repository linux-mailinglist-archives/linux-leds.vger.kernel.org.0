Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83F6231F7D4
	for <lists+linux-leds@lfdr.de>; Fri, 19 Feb 2021 12:03:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230268AbhBSLCw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 19 Feb 2021 06:02:52 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:48004 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbhBSLCV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 19 Feb 2021 06:02:21 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 0C7721C0B80; Fri, 19 Feb 2021 12:01:22 +0100 (CET)
Date:   Fri, 19 Feb 2021 12:01:21 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado 
        <nfraprado@protonmail.com>
Cc:     Dan Murphy <dmurphy@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-leds@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Brian Masney <masneyb@onstation.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Russell King <linux@armlinux.org.uk>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        lkcamp@lists.libreplanetbr.org, andrealmeid@collabora.com
Subject: Re: [PATCH v2 2/4] leds: Add driver for QCOM SPMI Flash LEDs
Message-ID: <20210219110121.GF19207@duo.ucw.cz>
References: <20210126140240.1517044-1-nfraprado@protonmail.com>
 <20210126140240.1517044-3-nfraprado@protonmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="8JPrznbw0YAQ/KXy"
Content-Disposition: inline
In-Reply-To: <20210126140240.1517044-3-nfraprado@protonmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--8JPrznbw0YAQ/KXy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2021-01-26 14:05:54, N=EDcolas F. R. A. Prado wrote:
> Add driver for the Qualcomm SPMI Flash LEDs. These are controlled
> through an SPMI bus and are part of the PM8941 PMIC. There are two LEDs
> present in the chip, and can be used independently as camera flash or
> together in torch mode to act as a lantern.

>  drivers/leds/Kconfig                |    8 +
>  drivers/leds/Makefile               |    1 +
>  drivers/leds/leds-qcom-spmi-flash.c | 1153 +++++++++++++++++++++++++++
>  3 files changed, 1162 insertions(+)

Ok, please make this go to drivers/leds/flash/


> +static int qcom_flash_fled_regulator_operate(struct qcom_flash_device *l=
eds_dev,
> +					     bool on)
> +{
> +	int rc;
> +
> +	if (!on)
> +		goto regulator_turn_off;
> +
> +	if (!leds_dev->flash_regulator_on) {
> +		if (leds_dev->flash_boost_reg) {
> +			rc =3D regulator_enable(leds_dev->flash_boost_reg);
> +			if (rc) {
> +				dev_err(&leds_dev->pdev->dev,
> +					"Regulator enable failed(%d)\n", rc);
> +				return rc;
> +			}
> +			leds_dev->flash_regulator_on =3D true;
> +		}
> +	}
> +
> +	return 0;
> +
> +regulator_turn_off:
> +	if (leds_dev->flash_regulator_on) {
> +		if (leds_dev->flash_boost_reg) {
> +			rc =3D qcom_flash_masked_write(leds_dev,
> +				FLASH_ENABLE_CONTROL,
> +				FLASH_ENABLE_MASK,
> +				FLASH_DISABLE_ALL);
> +			if (rc)
> +				dev_err(&leds_dev->pdev->dev,
> +					"Enable reg write failed(%d)\n", rc);
> +
> +			rc =3D regulator_disable(leds_dev->flash_boost_reg);
> +			if (rc) {
> +				dev_err(&leds_dev->pdev->dev,
> +					"Regulator disable failed(%d)\n", rc);
> +				return rc;
> +			}
> +			leds_dev->flash_regulator_on =3D false;
> +		}
> +	}
> +
> +	return 0;
> +}

Try to find a way to write this without gotos and with less
indentation. Separate functions may be useful.

> +static int qcom_flash_fled_set(struct qcom_flash_led *led, bool on)
> +{
> +	int rc, error;
> +	u8 curr;
> +	struct qcom_flash_device *leds_dev =3D led_to_leds_dev(led);
> +	struct device *dev =3D &leds_dev->pdev->dev;
> +
> +	/* dump flash registers */
> +	pr_debug("Regdump before\n");
> +	qcom_flash_dump_regs(leds_dev, flash_debug_regs,
> +			     ARRAY_SIZE(flash_debug_regs));

I believe this kind of debugging is not needed for production.

> +	/* Set led current */
> +	if (on) {
> +		if (led->torch_enable)
> +			curr =3D qcom_flash_current_to_reg(led->cdev.led_cdev.brightness);
> +		else
> +			curr =3D qcom_flash_current_to_reg(led->cdev.brightness.val);
> +
> +		if (led->torch_enable) {
> +			if (leds_dev->peripheral_subtype =3D=3D FLASH_SUBTYPE_DUAL) {
> +				rc =3D qcom_flash_torch_regulator_operate(leds_dev, true);
> +				if (rc) {
> +					dev_err(dev,
> +					"Torch regulator operate failed(%d)\n",
> +					rc);
> +					return rc;
> +				}

No need to goto here?

> +			} else if (leds_dev->peripheral_subtype =3D=3D FLASH_SUBTYPE_SINGLE) {
> +				rc =3D qcom_flash_fled_regulator_operate(leds_dev, true);
> +				if (rc) {
> +					dev_err(dev,
> +					"Flash regulator operate failed(%d)\n",
> +					rc);
> +					goto error_flash_set;
> +				}
> +
> +				/*
> +				 * Write 0x80 to MODULE_ENABLE before writing
> +				 * 0xE0 in order to avoid a hardware bug caused
> +				 * by register value going from 0x00 to 0xE0.
> +				 */
> +				rc =3D qcom_flash_masked_write(leds_dev,
> +					FLASH_ENABLE_CONTROL,
> +					FLASH_ENABLE_MODULE_MASK,
> +					FLASH_ENABLE_MODULE);
> +				if (rc) {
> +					dev_err(dev,
> +						"Enable reg write failed(%d)\n",
> +						rc);
> +					return rc;
> +				}
> +			}

Anyway, pleae find a way to split this function so that it is less
indented.

> +		/* TODO try to not busy wait*/
> +		mdelay(2);
> +		udelay(160);

What?

Best regards,
								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--8JPrznbw0YAQ/KXy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYC+agQAKCRAw5/Bqldv6
8pTEAKCHeRtdc2eT9XTnIYULLKer2Fp9vQCeP6NEUSRKyZZ3nHkxzeK++yowHTg=
=KYTA
-----END PGP SIGNATURE-----

--8JPrznbw0YAQ/KXy--
