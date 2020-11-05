Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17C902A7B54
	for <lists+linux-leds@lfdr.de>; Thu,  5 Nov 2020 11:11:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725827AbgKEKL2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 5 Nov 2020 05:11:28 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:46322 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725308AbgKEKL2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 5 Nov 2020 05:11:28 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 5D0EA1C0B85; Thu,  5 Nov 2020 11:11:24 +0100 (CET)
Date:   Thu, 5 Nov 2020 11:11:23 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>
Cc:     linux-leds@vger.kernel.org, dmurphy@ti.com,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, cheol.yong.kim@intel.com,
        qi-ming.wu@intel.com, malliamireddy009@gmail.com,
        yixin.zhu@intel.com
Subject: Re: [PATCH v1 2/2] leds: lgm: Add LED controller driver for LGM Soc
Message-ID: <20201105101123.GB7994@amd>
References: <c9c963a2d03fbd03bd21f71f3d776ac5800cf6cc.1604331498.git.mallikarjunax.reddy@linux.intel.com>
 <5372c8410909f7b6b020cd379980dbe4e30e31d3.1604331498.git.mallikarjunax.reddy@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="gj572EiMnwbLXET9"
Content-Disposition: inline
In-Reply-To: <5372c8410909f7b6b020cd379980dbe4e30e31d3.1604331498.git.mallikarjunax.reddy@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--gj572EiMnwbLXET9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index ed943140e1fd..6445b39fe4fc 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -886,6 +886,16 @@ config LEDS_SGM3140
>  	  This option enables support for the SGM3140 500mA Buck/Boost Charge
>  	  Pump LED Driver.
> =20
> +config LEDS_LGM_SSO
> +	tristate "LED support for Intel LGM SOC series"
> +	depends on LEDS_CLASS
> +	depends on MFD_SYSCON
> +	depends on OF
> +	help
> +          Parallel to serial conversion, which is also called SSO contro=
ller,
> +          can drive external shift register for LED outputs.
> +	  This enables LED support for Serial Shift Output Controller(SSO).

Something is wrong with indentation here.

> diff --git a/drivers/leds/leds-lgm-sso.c b/drivers/leds/leds-lgm-sso.c

Could we put it into drivers/leds/blink/ directory? You'll need to
create it.

> index 000000000000..f1bae1c6ed3c
> --- /dev/null
> +++ b/drivers/leds/leds-lgm-sso.c
> @@ -0,0 +1,881 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Intel LGM Soc LED SSO driver

Spell out LGM, SSO. Soc->SoC.

Pointer to documentation would be welcome here.

> +enum {
> +	US_SW =3D 0,
> +	US_GPTC =3D 1,
> +	US_FPID =3D 2
> +};

This is not really useful without additional comments.

> +static u32 sso_rectify_brightness(u32 brightness)
> +{
> +	if (brightness > LED_FULL)
> +		return LED_FULL;
> +	else
> +		return brightness;
> +}

Why?

> +static int sso_rectify_blink_rate(struct sso_led_priv *priv, u32 rate)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < MAX_FREQ_RANK; i++) {
> +		if (rate <=3D priv->freq[i])
> +			return i;
> +	}
> +
> +	return i - 1;
> +}

Can return -1. Is that expected?

> +
> +		desc->np =3D to_of_node(fwnode_child);
> +		if (fwnode_property_read_string(fwnode_child, "label",
> +						&desc->name)) {
> +			dev_err(dev, "LED no label name!\n");
> +			goto __dt_err;
> +		}

Can you use appropriate helper from the core? labels are getting
deprecated...


> +		if (fwnode_property_present(fwnode_child,
> +					    "retain-state-suspended"))
> +			desc->retain_state_suspended =3D 1;

Was this documented in the binding?

> +		if (fwnode_property_read_u32(fwnode_child, "intel,led-pin",
> +					     &prop)) {
> +			dev_err(dev, "Failed to find led pin id!\n");
> +			goto __dt_err;

Would not we normally use something like reg =3D <x> to indicate pin?

> +		if (fwnode_property_present(fwnode_child,
> +					    "intel,sso-hw-trigger"))
> +			desc->hw_trig =3D 1;

Should not that be selectable on runtime?

> +		if (fwnode_property_read_u32(fwnode_child,
> +					     "intel,sso-brightness", &prop))
> +			desc->brightness =3D priv->brightness;
> +		else
> +			desc->brightness =3D sso_rectify_brightness(prop);

Can you look at "default-state" property?

> +	ret =3D sso_gpio_gc_init(dev, priv);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}

Just return ret.

> +
> +	ret =3D clk_prepare_enable(priv->gclk);
> +	if (ret) {
> +		dev_err(dev, "Failed to prepate/enable sso gate clock!\n");
> +		return ret;
> +	}
> +
> +	priv->fpid_clk =3D devm_clk_get(dev, "fpid");
> +	if (IS_ERR(priv->fpid_clk)) {
> +		dev_err(dev, "Failed to get fpid clock!\n");
> +		return PTR_ERR(priv->fpid_clk);
> +	}

clk disable here?

> +	ret =3D clk_prepare_enable(priv->fpid_clk);
> +	if (ret) {
> +		dev_err(dev, "Failed to prepare/enable fpid clock!\n");
> +		return ret;
> +	}
> +	priv->fpid_clkrate =3D clk_get_rate(priv->fpid_clk);
> +
> +	priv->mmap =3D syscon_node_to_regmap(dev->of_node);
> +	if (IS_ERR(priv->mmap)) {
> +		dev_err(dev, "Failed to map iomem!\n");
> +		return PTR_ERR(priv->mmap);
> +	}

clk disable here? ... and probably elsewhere?

Best regards,
							Pavel
--=20
http://www.livejournal.com/~pavelmachek

--gj572EiMnwbLXET9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl+jz8sACgkQMOfwapXb+vL/kwCfZ1IFg1Bv2NnP5463LyMa5gFY
uyoAmwQlHlHT5DY5bVSK9pz3a05lJcS/
=0SMC
-----END PGP SIGNATURE-----

--gj572EiMnwbLXET9--
