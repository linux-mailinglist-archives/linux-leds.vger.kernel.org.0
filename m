Return-Path: <linux-leds+bounces-7271-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEcXHkAMsWldqAIAu9opvQ
	(envelope-from <linux-leds+bounces-7271-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2026 07:31:28 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C0E25CD9F
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2026 07:31:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DB7E2302F431
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2026 06:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A9891A6814;
	Wed, 11 Mar 2026 06:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="Pwz8FQLM"
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9793A59;
	Wed, 11 Mar 2026 06:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773210686; cv=pass; b=Q7R0FzHsptOiT2G/RBMQeuX8dLX0P6n9VOVFo6F7To9QtGB7eompiFE30uiVGHSMFTAvgCJ/PS+E6oOcpTvupcPnMG1TkCFxZcwyGlRHbdWLkwhyjgXK/QyG4EMGPKot3Qhm0j2vC3sWkmxh+63V5x3jGAL2nlR0Aae2/6RxM+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773210686; c=relaxed/simple;
	bh=cX9vwpU5PeeQtHDidcZ25pt1kuEfySRZaLwd3/yp6bE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IQLdIG5+eGqrE+EZqcLq6dvMdaB4OENFpB40InLgqgDLts5oQ3e8fKNe/CHntD5HI9rPCMCZKw770stOn42JQTFQ8dhmp7/FMeLBgF96v8oHEsqy90tkyRyqI5LrfZv8Ce2UkYkkJkcsmbZLFivqH7UnOE3QTIaIhL9KQ8Hfryo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=Pwz8FQLM; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1773210649; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aeiaEx9TKMBLZ92qEhV2Js2+p0/lYJ9Ck52znS3bo5phrVLBT2UYcgB9kv+HBgzqOUyJLnzkjLnbIOrMkbH19YfwccV/IsxeAzu3SNJEOUAZmUG4g+FPkb2Ki82j+kQEnkPhqvjvw60xwDEohTstX3HF269q9uVglB6djFni0ic=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773210649; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=P/zpN74k6VvKPUOQ7RN1eUbbSimS09Syfy1Ya/YYk78=; 
	b=lKRzEYD8kbNA8IafJkwhHS03DIn3GHqq/JaeVSKOcouL0ktU628WLtgtlrD2Xvmq/7FN2qcZ5thbfUt9zH2CI35LlknT0oA8PulgyCvU/UGCcU8vt0cLWesFxERPU89ClB3U9Tj3a9DeLezqfBaAvpjOtPpWS9RndKVRzdsVm+s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773210649;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=P/zpN74k6VvKPUOQ7RN1eUbbSimS09Syfy1Ya/YYk78=;
	b=Pwz8FQLM8XsvnGkxoq6CRqlAN7yoGA4styIUlAnhemhcYcu+A5r6DbZxZ3r7ja6b
	EuMZeIENI99Vg2/Nk0zznmwm0iEYQUaoaFnFzysLDpHd2ZrH1aoKFKKhhFM4fcKrL8T
	rPUDVtgQ3ZYbImWS/ryzXxiEwe23UIf4aQR1HoOY=
Received: by mx.zohomail.com with SMTPS id 1773210646764431.928200045445;
	Tue, 10 Mar 2026 23:30:46 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id CE291180598; Wed, 11 Mar 2026 07:30:33 +0100 (CET)
Date: Wed, 11 Mar 2026 07:30:33 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Ion Agorria <ion@agorria.com>, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v5 6/7] power: supply: Add driver for ASUS Transformer
 battery
Message-ID: <abELVIzUrWmno8cX@venus>
References: <20260304185751.83494-1-clamor95@gmail.com>
 <20260304185751.83494-7-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dajxxrhcax5ezbff"
Content-Disposition: inline
In-Reply-To: <20260304185751.83494-7-clamor95@gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.1.1.4.3/273.195.15
X-ZohoMailClient: External
X-Rspamd-Queue-Id: E1C0E25CD9F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7271-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qmqm.pl:email,collabora.com:dkim,collabora.com:email]
X-Rspamd-Action: no action


--dajxxrhcax5ezbff
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 6/7] power: supply: Add driver for ASUS Transformer
 battery
MIME-Version: 1.0

Hi,

On Wed, Mar 04, 2026 at 08:57:50PM +0200, Svyatoslav Ryhel wrote:
> From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
>=20
> Driver implements one battery cell per EC controller and supports reading
> of battery status for ASUS Transformer's pad and mobile dock.
>=20
> Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> ---
>  drivers/power/supply/Kconfig                  |  11 +
>  drivers/power/supply/Makefile                 |   1 +
>  .../supply/asus-transformer-ec-battery.c      | 272 ++++++++++++++++++
>  3 files changed, 284 insertions(+)
>  create mode 100644 drivers/power/supply/asus-transformer-ec-battery.c
>=20
> diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfig
> index 81fadb0695a9..3c46b412632d 100644
> --- a/drivers/power/supply/Kconfig
> +++ b/drivers/power/supply/Kconfig
> @@ -122,6 +122,17 @@ config BATTERY_CHAGALL
>  	  This driver can also be built as a module. If so, the module will be
>  	  called chagall-battery.
> =20
> +config BATTERY_ASUS_TRANSFORMER_EC
> +	tristate "Asus Transformer's battery driver"
> +	depends on MFD_ASUS_TRANSFORMER_EC
> +	help
> +	  Say Y here to enable support APM status emulation using
> +	  battery class devices.

^^^

You forgot to drop that when you used the APM_POWER config entry as
template. Otherwise the driver LGTM:

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Greetings,

-- Sebastian

> +	  This sub-driver supports battery cells found in Asus Transformer
> +	  tablets and mobile docks and controlled by special embedded
> +	  controller.
> +
>  config BATTERY_CPCAP
>  	tristate "Motorola CPCAP PMIC battery driver"
>  	depends on MFD_CPCAP && IIO
> diff --git a/drivers/power/supply/Makefile b/drivers/power/supply/Makefile
> index 41c400bbf022..aa5e6b05b018 100644
> --- a/drivers/power/supply/Makefile
> +++ b/drivers/power/supply/Makefile
> @@ -22,6 +22,7 @@ obj-$(CONFIG_TEST_POWER)	+=3D test_power.o
>  obj-$(CONFIG_BATTERY_88PM860X)	+=3D 88pm860x_battery.o
>  obj-$(CONFIG_CHARGER_ADP5061)	+=3D adp5061.o
>  obj-$(CONFIG_BATTERY_ACT8945A)	+=3D act8945a_charger.o
> +obj-$(CONFIG_BATTERY_ASUS_TRANSFORMER_EC)	+=3D asus-transformer-ec-batte=
ry.o
>  obj-$(CONFIG_BATTERY_AXP20X)	+=3D axp20x_battery.o
>  obj-$(CONFIG_CHARGER_AXP20X)	+=3D axp20x_ac_power.o
>  obj-$(CONFIG_BATTERY_CHAGALL)	+=3D chagall-battery.o
> diff --git a/drivers/power/supply/asus-transformer-ec-battery.c b/drivers=
/power/supply/asus-transformer-ec-battery.c
> new file mode 100644
> index 000000000000..aefcd3fed6fe
> --- /dev/null
> +++ b/drivers/power/supply/asus-transformer-ec-battery.c
> @@ -0,0 +1,272 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#include <linux/array_size.h>
> +#include <linux/devm-helpers.h>
> +#include <linux/err.h>
> +#include <linux/mfd/asus-transformer-ec.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/power_supply.h>
> +#include <linux/property.h>
> +#include <linux/unaligned.h>
> +
> +#define ASUSEC_BATTERY_DATA_FRESH_MSEC		5000
> +
> +#define ASUSEC_BATTERY_DISCHARGING		0x40
> +#define ASUSEC_BATTERY_FULL_CHARGED		0x20
> +#define ASUSEC_BATTERY_NOT_CHARGING		0x10
> +
> +#define TEMP_CELSIUS_OFFSET			2731
> +
> +struct asus_ec_battery_data {
> +	const struct asusec_info *ec;
> +	struct power_supply *battery;
> +	struct power_supply_desc psy_desc;
> +	struct delayed_work poll_work;
> +	struct mutex battery_lock; /* for data refresh */
> +	unsigned long batt_data_ts;
> +	int last_state;
> +	u8 batt_data[DOCKRAM_ENTRY_BUFSIZE];
> +};
> +
> +static int asus_ec_battery_refresh(struct asus_ec_battery_data *priv)
> +{
> +	int ret =3D 0;
> +
> +	guard(mutex)(&priv->battery_lock);
> +
> +	if (time_before(jiffies, priv->batt_data_ts))
> +		return ret;
> +
> +	ret =3D asus_dockram_read(priv->ec->dockram, ASUSEC_DOCKRAM_BATT_CTL,
> +				priv->batt_data);
> +	if (ret < 0)
> +		return ret;
> +
> +	priv->batt_data_ts =3D jiffies +
> +		msecs_to_jiffies(ASUSEC_BATTERY_DATA_FRESH_MSEC);
> +
> +	return ret;
> +}
> +
> +static enum power_supply_property asus_ec_battery_properties[] =3D {
> +	POWER_SUPPLY_PROP_STATUS,
> +	POWER_SUPPLY_PROP_VOLTAGE_MAX,
> +	POWER_SUPPLY_PROP_CURRENT_MAX,
> +	POWER_SUPPLY_PROP_TEMP,
> +	POWER_SUPPLY_PROP_VOLTAGE_NOW,
> +	POWER_SUPPLY_PROP_CURRENT_NOW,
> +	POWER_SUPPLY_PROP_CAPACITY,
> +	POWER_SUPPLY_PROP_CHARGE_NOW,
> +	POWER_SUPPLY_PROP_TIME_TO_EMPTY_NOW,
> +	POWER_SUPPLY_PROP_TIME_TO_FULL_NOW,
> +	POWER_SUPPLY_PROP_PRESENT,
> +};
> +
> +static const unsigned int asus_ec_battery_prop_offs[] =3D {
> +	[POWER_SUPPLY_PROP_STATUS] =3D 1,
> +	[POWER_SUPPLY_PROP_VOLTAGE_MAX] =3D 3,
> +	[POWER_SUPPLY_PROP_CURRENT_MAX] =3D 5,
> +	[POWER_SUPPLY_PROP_TEMP] =3D 7,
> +	[POWER_SUPPLY_PROP_VOLTAGE_NOW] =3D 9,
> +	[POWER_SUPPLY_PROP_CURRENT_NOW] =3D 11,
> +	[POWER_SUPPLY_PROP_CAPACITY] =3D 13,
> +	[POWER_SUPPLY_PROP_CHARGE_NOW] =3D 15,
> +	[POWER_SUPPLY_PROP_TIME_TO_EMPTY_NOW] =3D 17,
> +	[POWER_SUPPLY_PROP_TIME_TO_FULL_NOW] =3D 19,
> +};
> +
> +static int asus_ec_battery_get_value(struct asus_ec_battery_data *priv,
> +				     enum power_supply_property psp)
> +{
> +	int ret, offs;
> +
> +	if (psp >=3D ARRAY_SIZE(asus_ec_battery_prop_offs))
> +		return -EINVAL;
> +
> +	offs =3D asus_ec_battery_prop_offs[psp];
> +	if (!offs)
> +		return -EINVAL;
> +
> +	ret =3D asus_ec_battery_refresh(priv);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (offs >=3D priv->batt_data[0])
> +		return -ENODATA;
> +
> +	return get_unaligned_le16(priv->batt_data + offs);
> +}
> +
> +static int asus_ec_battery_get_property(struct power_supply *psy,
> +					enum power_supply_property psp,
> +					union power_supply_propval *val)
> +{
> +	struct asus_ec_battery_data *priv =3D power_supply_get_drvdata(psy);
> +	int ret;
> +
> +	switch (psp) {
> +	case POWER_SUPPLY_PROP_PRESENT:
> +		val->intval =3D 1;
> +		break;
> +
> +	default:
> +		ret =3D asus_ec_battery_get_value(priv, psp);
> +		if (ret < 0)
> +			return ret;
> +
> +		val->intval =3D (s16)ret;
> +
> +		switch (psp) {
> +		case POWER_SUPPLY_PROP_STATUS:
> +			if (ret & ASUSEC_BATTERY_FULL_CHARGED)
> +				val->intval =3D POWER_SUPPLY_STATUS_FULL;
> +			else if (ret & ASUSEC_BATTERY_NOT_CHARGING)
> +				val->intval =3D POWER_SUPPLY_STATUS_NOT_CHARGING;
> +			else if (ret & ASUSEC_BATTERY_DISCHARGING)
> +				val->intval =3D POWER_SUPPLY_STATUS_DISCHARGING;
> +			else
> +				val->intval =3D POWER_SUPPLY_STATUS_CHARGING;
> +			break;
> +
> +		case POWER_SUPPLY_PROP_TEMP:
> +			val->intval -=3D TEMP_CELSIUS_OFFSET;
> +			break;
> +
> +		case POWER_SUPPLY_PROP_CHARGE_NOW:
> +		case POWER_SUPPLY_PROP_CURRENT_NOW:
> +		case POWER_SUPPLY_PROP_CURRENT_MAX:
> +		case POWER_SUPPLY_PROP_VOLTAGE_NOW:
> +		case POWER_SUPPLY_PROP_VOLTAGE_MAX:
> +			val->intval *=3D 1000;
> +			break;
> +
> +		case POWER_SUPPLY_PROP_TIME_TO_EMPTY_NOW:
> +		case POWER_SUPPLY_PROP_TIME_TO_FULL_NOW:
> +			val->intval *=3D 60;
> +			break;
> +
> +		default:
> +			break;
> +		}
> +
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static void asus_ec_battery_poll_work(struct work_struct *work)
> +{
> +	struct asus_ec_battery_data *priv =3D
> +		container_of(work, struct asus_ec_battery_data, poll_work.work);
> +	int state;
> +
> +	state =3D asus_ec_battery_get_value(priv, POWER_SUPPLY_PROP_STATUS);
> +	if (state < 0)
> +		return;
> +
> +	if (state & ASUSEC_BATTERY_FULL_CHARGED)
> +		state =3D POWER_SUPPLY_STATUS_FULL;
> +	else if (state & ASUSEC_BATTERY_DISCHARGING)
> +		state =3D POWER_SUPPLY_STATUS_DISCHARGING;
> +	else
> +		state =3D POWER_SUPPLY_STATUS_CHARGING;
> +
> +	if (priv->last_state !=3D state) {
> +		priv->last_state =3D state;
> +		power_supply_changed(priv->battery);
> +	}
> +
> +	/* continuously send uevent notification */
> +	schedule_delayed_work(&priv->poll_work,
> +			      msecs_to_jiffies(ASUSEC_BATTERY_DATA_FRESH_MSEC));
> +}
> +
> +static const struct power_supply_desc asus_ec_battery_desc =3D {
> +	.name =3D "asus-ec-battery",
> +	.type =3D POWER_SUPPLY_TYPE_BATTERY,
> +	.properties =3D asus_ec_battery_properties,
> +	.num_properties =3D ARRAY_SIZE(asus_ec_battery_properties),
> +	.get_property =3D asus_ec_battery_get_property,
> +	.external_power_changed =3D power_supply_changed,
> +};
> +
> +static int asus_ec_battery_probe(struct platform_device *pdev)
> +{
> +	struct asus_ec_battery_data *priv;
> +	struct device *dev =3D &pdev->dev;
> +	struct power_supply_config cfg =3D { };
> +	int ret;
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	mutex_init(&priv->battery_lock);
> +
> +	priv->ec =3D cell_to_ec(pdev);
> +	priv->batt_data_ts =3D jiffies - 1;
> +	priv->last_state =3D POWER_SUPPLY_STATUS_UNKNOWN;
> +
> +	cfg.fwnode =3D dev_fwnode(dev->parent);
> +	cfg.drv_data =3D priv;
> +
> +	memcpy(&priv->psy_desc, &asus_ec_battery_desc, sizeof(priv->psy_desc));
> +	priv->psy_desc.name =3D devm_kasprintf(dev, GFP_KERNEL, "%s-battery",
> +					     priv->ec->name);
> +
> +	priv->battery =3D devm_power_supply_register(dev, &priv->psy_desc, &cfg=
);
> +	if (IS_ERR(priv->battery))
> +		return dev_err_probe(dev, PTR_ERR(priv->battery),
> +				     "Failed to register power supply\n");
> +
> +	ret =3D devm_delayed_work_autocancel(dev, &priv->poll_work,
> +					   asus_ec_battery_poll_work);
> +	if (ret)
> +		return ret;
> +
> +	schedule_delayed_work(&priv->poll_work,
> +			      msecs_to_jiffies(ASUSEC_BATTERY_DATA_FRESH_MSEC));
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused asus_ec_battery_suspend(struct device *dev)
> +{
> +	struct asus_ec_battery_data *priv =3D dev_get_drvdata(dev);
> +
> +	cancel_delayed_work_sync(&priv->poll_work);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused asus_ec_battery_resume(struct device *dev)
> +{
> +	struct asus_ec_battery_data *priv =3D dev_get_drvdata(dev);
> +
> +	schedule_delayed_work(&priv->poll_work,
> +			      msecs_to_jiffies(ASUSEC_BATTERY_DATA_FRESH_MSEC));
> +
> +	return 0;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(asus_ec_battery_pm_ops,
> +			 asus_ec_battery_suspend, asus_ec_battery_resume);
> +
> +static struct platform_driver asus_ec_battery_driver =3D {
> +	.driver =3D {
> +		.name =3D "asus-transformer-ec-battery",
> +		.pm =3D &asus_ec_battery_pm_ops,
> +	},
> +	.probe =3D asus_ec_battery_probe,
> +};
> +module_platform_driver(asus_ec_battery_driver);
> +
> +MODULE_AUTHOR("Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>");
> +MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
> +MODULE_DESCRIPTION("ASUS Transformer's battery driver");
> +MODULE_LICENSE("GPL");
> --=20
> 2.51.0
>=20
>=20

--dajxxrhcax5ezbff
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmmxDAYACgkQ2O7X88g7
+po+cxAApJP60xFP4lgJWpzfcXQ68AKAfCI7lBpMGY5r3AhjzldDsngMGup8mXhc
KLlIQKqNr37fovYYoFeuhwayhsf8E6pbpgnkIPpTGHyo5ycv4TFEv/YMSEN5mN+x
x/ztm3/5Ph6klEpiBxfnIykplq5wwGQLa+LN+/QuMrcDCTv6r5nAakctRuQn46dg
upYxr2MsJZ3HAjmm1H9kSQM7TdQKAMkARfLHx4P4zsMs8Ybt9QFQa7T10tbKGo6M
lovOopMQemQO9YNyaEUgK90TQpp/ND0WN1RX4Z2/dcZ4aqNeMu2lnaHyzDp8UO3C
tajCmIVgUPP2k2nq24Zzx0VWLakAzYEeH0xd26pE5EOmCg2KfbjT88oDibSewOAB
0NLpipGczQMbx/rBJxMl56F50RcC3eCFqN5smh/BkhRLvjDBYAz6MKJtIVu7tkL7
UTbmBGNRESjdJezg3pRfiVaVeCfpXsT95NTvqgPNy/du77gv3xdDLgV2zIIG5pDF
ZkE7TukLm6ibJzDX+XAcGsJqh7bNwmBlbErguEWcLm1pzEFnWsRkAWt8NogaWAFy
alRztM2pyvhp6fyW8cQMFLXHWNsI/mij66FML3TYH/GjncsllD91WtDW3I2gqh1a
8NXLkzMjTYEVm/dnBGWEi6JqpRJLLCICuj7bq/uL+86bVZvOBeQ=
=XnEF
-----END PGP SIGNATURE-----

--dajxxrhcax5ezbff--

