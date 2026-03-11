Return-Path: <linux-leds+bounces-7272-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LmDGI4QsWmYqQIAu9opvQ
	(envelope-from <linux-leds+bounces-7272-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2026 07:49:50 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCC525D065
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2026 07:49:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 46EFF303779F
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2026 06:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2293D295DAC;
	Wed, 11 Mar 2026 06:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="VClz9EN0"
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2BE22A4E9;
	Wed, 11 Mar 2026 06:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773211668; cv=pass; b=XpBFR2zxstTdSp+MulWTftxQoLyJakLpI/MvtVQQyb818D0jkkruBTRLcbH8xkZ23OC0Yx1vI0xfSLabbbd5xPZqUg4wn1x2yts+zEzUkZkMG0B7X19Tn2wFj9naJhpQGimP5PG81fbPDZluuYIWNGlTKOLbBeHsS8QrNgoKA9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773211668; c=relaxed/simple;
	bh=FKPdQS1kAL5GzAGxsOOqHF523QzR8eQxwpUhprV/2Bc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OyAnO/hsM8cKpbxrqKReSKo602qgwky6KSuGNYZeDi3ztbFc2ZWPH6fFKfNuKzZ4SRlHLFiQ6MDrw+LvEOyo8mg2MUC8rDiD1RAmJF7Et+dMRYe2br/c9DGKDnuU+KBtqlkDpCoUwc+5/H1uHiSY5JzQG3gmX6FwQVYeW9XNEi4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=VClz9EN0; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1773211645; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kSEPi79f05bL4Z/d5Va0KL3oq7BtzAUFeEKzuMC38etbMKkchnlAcH7uJbO5r0gPyCx3BNQa0+XJF1YOYsKtKjy3E6tGL/qJL7wlhHSKroBtB7DcRIR0u5NYzWuZpmcaAoI7OZAkdn64WRnTmPODgRq2r3nEh3nXcsD4pjSLRds=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773211645; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lEuIoF9PNhBVz4cS+xJGwYdb+hvBLtjUx+y1eAnvPis=; 
	b=fxVDKO5erC4gPIQuQY2hbavIMmhqQxHF9sH5Do+o+gp/MlWRgvsNr0XaOQ5mK8Leo7r5VsIKe/UGE84trNashv6KG9whnYP6nmaoHcnEGNpDQlSssFzokLXG98XTxAw/RzmAoZn+SkDqsgA7mtGnleOADhI+8sDgsQLR53f2K+s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773211645;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=lEuIoF9PNhBVz4cS+xJGwYdb+hvBLtjUx+y1eAnvPis=;
	b=VClz9EN0d2uxhmKqp0YBQOzmAHLiP4KZt1awjnbxEBJQ+VbFCU54dn0UV/FjfqhS
	lPPx5pHknn+1tc29EoWfuPWT5TkdiuY2e7v4XgA+/uTil0gynm73IP9s25PgRbOwh5O
	Io9MFGRnA6y1WANBrWDWz4jjFcMNT02jfXuf4MRc=
Received: by mx.zohomail.com with SMTPS id 1773211642087392.0240935116626;
	Tue, 10 Mar 2026 23:47:22 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 187F6180598; Wed, 11 Mar 2026 07:47:15 +0100 (CET)
Date: Wed, 11 Mar 2026 07:47:15 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Ion Agorria <ion@agorria.com>, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v5 7/7] power: supply: Add charger driver for Asus
 Transformers
Message-ID: <abEP0XIe_ireBfZi@venus>
References: <20260304185751.83494-1-clamor95@gmail.com>
 <20260304185751.83494-8-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qmtcg6v6npfz76lo"
Content-Disposition: inline
In-Reply-To: <20260304185751.83494-8-clamor95@gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.1.1.4.3/273.195.15
X-ZohoMailClient: External
X-Rspamd-Queue-Id: CCCC525D065
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7272-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,agorria.com,rere.qmqm.pl,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sebastian.reichel@collabora.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qmqm.pl:email]
X-Rspamd-Action: no action


--qmtcg6v6npfz76lo
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 7/7] power: supply: Add charger driver for Asus
 Transformers
MIME-Version: 1.0

Hi,

On Wed, Mar 04, 2026 at 08:57:51PM +0200, Svyatoslav Ryhel wrote:
> From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
>=20
> Add support for charger detection capabilities found in the embedded
> controller of ASUS Transformer devices.
>=20
> Suggested-by: Maxim Schwalm <maxim.schwalm@gmail.com>
> Suggested-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/power/supply/Kconfig                  |  11 +
>  drivers/power/supply/Makefile                 |   1 +
>  .../supply/asus-transformer-ec-charger.c      | 193 ++++++++++++++++++
>  3 files changed, 205 insertions(+)
>  create mode 100644 drivers/power/supply/asus-transformer-ec-charger.c
>=20
> diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfig
> index 3c46b412632d..56800aab82f9 100644
> --- a/drivers/power/supply/Kconfig
> +++ b/drivers/power/supply/Kconfig
> @@ -497,6 +497,17 @@ config CHARGER_88PM860X
>  	help
>  	  Say Y here to enable charger for Marvell 88PM860x chip.
> =20
> +config CHARGER_ASUS_TRANSFORMER_EC
> +	tristate "Asus Transformer's charger driver"
> +	depends on MFD_ASUS_TRANSFORMER_EC
> +	help
> +	  Say Y here to enable support AC plug detection on Asus Transformer
> +	  Dock.
> +
> +	  This sub-driver supports charger detection mechanism found in Asus
> +	  Transformer tablets and mobile docks and controlled by special
> +	  embedded controller.
> +
>  config CHARGER_PF1550
>  	tristate "NXP PF1550 battery charger driver"
>  	depends on MFD_PF1550
> diff --git a/drivers/power/supply/Makefile b/drivers/power/supply/Makefile
> index aa5e6b05b018..24679f09bb61 100644
> --- a/drivers/power/supply/Makefile
> +++ b/drivers/power/supply/Makefile
> @@ -68,6 +68,7 @@ obj-$(CONFIG_CHARGER_RT9471)	+=3D rt9471.o
>  obj-$(CONFIG_CHARGER_RT9756)	+=3D rt9756.o
>  obj-$(CONFIG_BATTERY_TWL4030_MADC)	+=3D twl4030_madc_battery.o
>  obj-$(CONFIG_CHARGER_88PM860X)	+=3D 88pm860x_charger.o
> +obj-$(CONFIG_CHARGER_ASUS_TRANSFORMER_EC)	+=3D asus-transformer-ec-charg=
er.o
>  obj-$(CONFIG_CHARGER_PF1550)	+=3D pf1550-charger.o
>  obj-$(CONFIG_BATTERY_RX51)	+=3D rx51_battery.o
>  obj-$(CONFIG_AB8500_BM)		+=3D ab8500_bmdata.o ab8500_charger.o ab8500_fg=
=2Eo ab8500_btemp.o ab8500_chargalg.o
> diff --git a/drivers/power/supply/asus-transformer-ec-charger.c b/drivers=
/power/supply/asus-transformer-ec-charger.c
> new file mode 100644
> index 000000000000..de01f0bf2fd7
> --- /dev/null
> +++ b/drivers/power/supply/asus-transformer-ec-charger.c
> @@ -0,0 +1,193 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#include <linux/err.h>
> +#include <linux/mfd/asus-transformer-ec.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/power_supply.h>
> +#include <linux/property.h>
> +
> +struct asus_ec_charger_data {
> +	struct notifier_block nb;
> +	const struct asusec_info *ec;
> +	struct power_supply *psy;
> +	struct power_supply_desc psy_desc;
> +};
> +
> +static enum power_supply_property asus_ec_charger_properties[] =3D {
> +	POWER_SUPPLY_PROP_USB_TYPE,
> +	POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR,
> +	POWER_SUPPLY_PROP_ONLINE,
> +	POWER_SUPPLY_PROP_MODEL_NAME,
> +};
> +
> +static int asus_ec_charger_get_property(struct power_supply *psy,
> +					enum power_supply_property psp,
> +					union power_supply_propval *val)
> +{
> +	struct asus_ec_charger_data *priv =3D power_supply_get_drvdata(psy);
> +	enum power_supply_usb_type psu;
> +	int ret;
> +	u64 ctl;
> +
> +	ret =3D asus_ec_get_ctl(priv->ec, &ctl);
> +	if (ret)
> +		return ret;
> +
> +	switch (ctl & (ASUSEC_CTL_FULL_POWER_SOURCE | ASUSEC_CTL_DIRECT_POWER_S=
OURCE)) {
> +	case ASUSEC_CTL_FULL_POWER_SOURCE:
> +		psu =3D POWER_SUPPLY_USB_TYPE_CDP;	/* DOCK */
> +		break;
> +	case ASUSEC_CTL_DIRECT_POWER_SOURCE:
> +		psu =3D POWER_SUPPLY_USB_TYPE_SDP;	/* USB */
> +		break;
> +	case 0:
> +		psu =3D POWER_SUPPLY_USB_TYPE_UNKNOWN;	/* no power source connected */
> +		break;
> +	default:
> +		psu =3D POWER_SUPPLY_USB_TYPE_ACA;	/* power adapter */
> +		break;
> +	}
> +
> +	switch (psp) {
> +	case POWER_SUPPLY_PROP_ONLINE:
> +		val->intval =3D psu !=3D POWER_SUPPLY_USB_TYPE_UNKNOWN;
> +		return 0;
> +
> +	case POWER_SUPPLY_PROP_USB_TYPE:
> +		val->intval =3D psu;
> +		return 0;
> +
> +	case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
> +		if (ctl & ASUSEC_CTL_TEST_DISCHARGE)
> +			val->intval =3D POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE;
> +		else if (ctl & ASUSEC_CTL_USB_CHARGE)
> +			val->intval =3D POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO;
> +		else
> +			val->intval =3D POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE;
> +		return 0;
> +
> +	case POWER_SUPPLY_PROP_MODEL_NAME:
> +		val->strval =3D priv->ec->model;
> +		return 0;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int asus_ec_charger_set_property(struct power_supply *psy,
> +					enum power_supply_property psp,
> +					const union power_supply_propval *val)
> +{
> +	struct asus_ec_charger_data *priv =3D power_supply_get_drvdata(psy);
> +
> +	switch (psp) {
> +	case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
> +		switch ((enum power_supply_charge_behaviour)val->intval) {
> +		case POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO:
> +			return asus_ec_update_ctl(priv->ec,
> +				ASUSEC_CTL_TEST_DISCHARGE | ASUSEC_CTL_USB_CHARGE,
> +				ASUSEC_CTL_USB_CHARGE);
> +
> +		case POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE:
> +			return asus_ec_clear_ctl_bits(priv->ec,
> +				ASUSEC_CTL_TEST_DISCHARGE | ASUSEC_CTL_USB_CHARGE);
> +
> +		case POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE:
> +			return asus_ec_update_ctl(priv->ec,
> +				ASUSEC_CTL_TEST_DISCHARGE | ASUSEC_CTL_USB_CHARGE,
> +				ASUSEC_CTL_TEST_DISCHARGE);
> +		default:
> +			return -EINVAL;
> +		}
> +
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int asus_ec_charger_property_is_writeable(struct power_supply *ps=
y,
> +						 enum power_supply_property psp)
> +{
> +	switch (psp) {
> +	case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static const struct power_supply_desc asus_ec_charger_desc =3D {
> +	.name =3D "asus-ec-charger",
> +	.type =3D POWER_SUPPLY_TYPE_USB,
> +	.charge_behaviours =3D BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO) |
> +			     BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE) |
> +			     BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE),
> +	.usb_types =3D BIT(POWER_SUPPLY_USB_TYPE_UNKNOWN) |
> +		     BIT(POWER_SUPPLY_USB_TYPE_SDP) |
> +		     BIT(POWER_SUPPLY_USB_TYPE_CDP) |
> +		     BIT(POWER_SUPPLY_USB_TYPE_ACA),
> +	.properties =3D asus_ec_charger_properties,
> +	.num_properties =3D ARRAY_SIZE(asus_ec_charger_properties),
> +	.get_property =3D asus_ec_charger_get_property,
> +	.set_property =3D asus_ec_charger_set_property,
> +	.property_is_writeable =3D asus_ec_charger_property_is_writeable,
> +	.no_thermal =3D true,
> +};
> +
> +static int asus_ec_charger_notify(struct notifier_block *nb,
> +				  unsigned long action, void *data)
> +{
> +	struct asus_ec_charger_data *priv =3D
> +		container_of(nb, struct asus_ec_charger_data, nb);
> +
> +	switch (action) {
> +	case ASUSEC_SMI_ACTION(POWER_NOTIFY):
> +	case ASUSEC_SMI_ACTION(ADAPTER_EVENT):
> +		power_supply_changed(priv->psy);
> +		break;
> +	}
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static int asus_ec_charger_probe(struct platform_device *pdev)
> +{
> +	struct asus_ec_charger_data *priv;
> +	struct device *dev =3D &pdev->dev;
> +	struct power_supply_config cfg =3D { };
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, priv);
> +	priv->ec =3D cell_to_ec(pdev);
> +
> +	cfg.fwnode =3D dev_fwnode(dev->parent);
> +	cfg.drv_data =3D priv;
> +
> +	memcpy(&priv->psy_desc, &asus_ec_charger_desc, sizeof(priv->psy_desc));
> +	priv->psy_desc.name =3D devm_kasprintf(dev, GFP_KERNEL, "%s-charger",
> +					     priv->ec->name);
> +
> +	priv->psy =3D devm_power_supply_register(dev, &priv->psy_desc, &cfg);
> +	if (IS_ERR(priv->psy))
> +		return dev_err_probe(dev, PTR_ERR(priv->psy),
> +				     "Failed to register power supply\n");
> +
> +	priv->nb.notifier_call =3D asus_ec_charger_notify;
> +
> +	return devm_asus_ec_register_notifier(pdev, &priv->nb);
> +}
> +
> +static struct platform_driver asus_ec_charger_driver =3D {
> +	.driver.name =3D "asus-transformer-ec-charger",
> +	.probe =3D asus_ec_charger_probe,
> +};
> +module_platform_driver(asus_ec_charger_driver);
> +
> +MODULE_AUTHOR("Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>");
> +MODULE_DESCRIPTION("ASUS Transformer Pad battery charger driver");
> +MODULE_LICENSE("GPL");
> --=20
> 2.51.0
>=20
>=20

--qmtcg6v6npfz76lo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmmxD+sACgkQ2O7X88g7
+podww//byhMut5QowPXYoEA+zrzTo/CjDkEy5O5p3QY/kDSEuvZtKsHUYjK81+E
0nyHWC+LtyC3pcOEkdZ4no1F3R22F7/KSjzYBMxupMOWzVmT4R0TzKd9ckxvY7jK
i4S4Sv+QcNRYm8yQqEh9fqubCNHRaM/gX9z+CSRBKj/9T06h/8z6DFP5mS0JXUON
AMCTvvs2XeN6pV4PqBSZKrWklra6em1M6pj0PgZJrTsS+cqIIxIaS0ddQuZi1An4
fvDQkUankTWq3akPjR2gZQxV7mDO4ZTJrYBaOA6eRQ0gvWbAlEjJVGZc+qg7MoYP
T1OQwC018rgUB6054RUjig6RoJAWGhmZ/jHF+wH/Y3T9ASlRLKt69Pp9WhMCSqTu
JnKgGn5Qfc9Cv2lRMdda3CRh0v9IbIfH6VGs4yssAbOURTr4yPifA8ExF0x7NLE9
cowgPyHrLHCutxScFzbuHEVlz7CPp83BTD7dcWQI+BPsWFYmh6y09rfgqSkudRJS
K+GV/UxQdUsQmsBIfOlbhy8vapkiH3zq5uQzlTUuBt8PY1v+MSOgUxVt1rimQVqe
dtaAndH4hNkiRQBMC/FZ+3r4fokUxkqXsg5pqpc484dkjnArMHqQLaEw6Aj0Xn0b
FwbvRAH9Bq+ZfYiIC4A9SY7tYjmluxJKJYT+yoMm9/soSV059yc=
=ELEi
-----END PGP SIGNATURE-----

--qmtcg6v6npfz76lo--

