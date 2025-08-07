Return-Path: <linux-leds+bounces-5203-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0680EB1DEF0
	for <lists+linux-leds@lfdr.de>; Thu,  7 Aug 2025 23:41:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DD5417828B
	for <lists+linux-leds@lfdr.de>; Thu,  7 Aug 2025 21:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05D3B23535F;
	Thu,  7 Aug 2025 21:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="NRzAOoRv"
X-Original-To: linux-leds@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CA121E08B;
	Thu,  7 Aug 2025 21:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754602875; cv=none; b=ahIQZb/Sq3EZsPdYp5WLbc1lTAFSx4o1PkaxTYycDzHzypMQchB3kcgjgYKQMMCFJvno1uSONXOVl7Myrn6FYPZ9F2xbL/TuMp9duHNW9xCN+7UPGL2r36YCYi6p5+YEuBHAIAmfPUIUJD5Qc+0wjnviXy1EU7iYGC7sWXQJhsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754602875; c=relaxed/simple;
	bh=cXqM5gD6Mo+hyClIWPcFbhJR/YkC1nSwbKBF2DqWaow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s8azKFtla9ngt8EMPXXc3edqkMTTMYBT8iIL352aVBhIgM2Ec59mNXru0UT4W3PA6Gc+cfNNOySBAZl69SUNXJe4tye/ue9+XXOKpLj/Y9eXvnPb0heFrp0ZCiHV19yF1Ykc1zkqME7q5FijJ3jorRXiEAXCxcqtGHMY/4j3oKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=NRzAOoRv; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=aD1yMUZ3KDpwCaBKtljTbiBmqXW5mc9WhwaVhgSkbXA=; b=NRzAOoRv/BbjP3VTzTERG6MZ9I
	i6kge7eA2XZwrrMT9juShx1B0Sown58W3xfBtCaWSJmm488DYwNzJdxxjowSmhKgevFneY5FHYSEb
	WmP82OYYJOjhCmbybsf0l6NM0Xac9dh9qcdGWA4IIrF1XYQpHdzEva9Eh84VUjKkQUneZq/5AGUUS
	4S3Is4rNt10QwD7sDcm7IqJ18/5LT1RCgMlcR8Lqtu5j9DRcNHOdsvRnk8sb0Y/QWJuAb1APPlnb1
	7qtBy66cYlljjJadYJ2EwWv3i8AfXvtKMQ/QzcdqSKJefUxUcgKnoo77mz79FgT+vibqNyS5HbHmQ
	DS35VwLw==;
Received: from i53875a15.versanet.de ([83.135.90.21] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uk8MA-0002s9-89; Thu, 07 Aug 2025 23:41:02 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: linux-leds@vger.kernel.org, Marek Vasut <marex@denx.de>
Cc: Marek Vasut <marex@denx.de>, Andrew Lunn <andrew@lunn.ch>,
 Christian Marangi <ansuelsmth@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Lukasz Majewski <lukma@denx.de>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject:
 Re: [PATCH 2/2] leds: trigger: netdev: Introduce OF mode configuration using
 netdev-trigger-mode property
Date: Thu, 07 Aug 2025 23:41:01 +0200
Message-ID: <3258356.fEcJ0Lxnt5@diego>
In-Reply-To: <20250113002346.297481-2-marex@denx.de>
References:
 <20250113002346.297481-1-marex@denx.de>
 <20250113002346.297481-2-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Marek,

Am Montag, 13. Januar 2025, 01:23:38 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Marek Vasut:
> Introduce netdev trigger specific netdev-trigger-mode property which
> is used to configure the netdev trigger mode flags. Those mode flags
> define events on which the LED acts upon when the hardware offload is
> enabled. This is traditionally configured via sysfs, but that depends
> on userspace, which is available too late and makes ethernet PHY LEDs
> not work e.g. when NFS root is being mounted.
>=20
> For each LED with linux,default-trigger =3D "netdev" described in DT, the
> optional netdev-trigger-mode property supplies the default configuration
> of the PHY LED mode via DT. This property should be set to a subset of
> TRIGGER_NETDEV_* flags.
>=20
> For each LED with linux,default-trigger =3D "netdev" described in DT, the
> netdev trigger is activated during kernel boot. The trigger is extended
> the parse the netdev-trigger-mode property and set it as a default value
> of trigger_data->mode.
>=20
> It is not possible to immediately configure the LED mode, because the
> interface to which the PHY and the LED is connected to might not be
> attached to the PHY yet. The netdev_trig_notify() is called when the
> PHY got attached to interface, extend netdev_trig_notify() to detect
> the condition where the LED does have netdev trigger configured in DT
> but the mode was not yet configured and configure the baseline mode
> from the notifier. This can reuse most of set_device_name() except for
> the rtnl_lock() which cannot be claimed in the notifier, so split the
> relevant core code into set_device_name_locked() and call only the core
> code.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
>  drivers/leds/trigger/ledtrig-netdev.c | 51 ++++++++++++++++++++-------
>  1 file changed, 38 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger=
/ledtrig-netdev.c
> index c15efe3e50780..20dfc9506c0a6 100644
> --- a/drivers/leds/trigger/ledtrig-netdev.c
> +++ b/drivers/leds/trigger/ledtrig-netdev.c
> @@ -23,6 +23,7 @@
>  #include <linux/module.h>
>  #include <linux/netdevice.h>
>  #include <linux/mutex.h>
> +#include <linux/of.h>
>  #include <linux/phy.h>
>  #include <linux/rtnetlink.h>
>  #include <linux/timer.h>
> @@ -256,19 +257,9 @@ static ssize_t device_name_show(struct device *dev,
>  	return len;
>  }
> =20
> -static int set_device_name(struct led_netdev_data *trigger_data,
> -			   const char *name, size_t size)
> +static void set_device_name_locked(struct led_netdev_data *trigger_data,
> +				  const char *name, size_t size)
>  {
> -	if (size >=3D IFNAMSIZ)
> -		return -EINVAL;
> -
> -	cancel_delayed_work_sync(&trigger_data->work);
> -
> -	/*
> -	 * Take RTNL lock before trigger_data lock to prevent potential
> -	 * deadlock with netdev notifier registration.
> -	 */
> -	rtnl_lock();
>  	mutex_lock(&trigger_data->lock);
> =20
>  	if (trigger_data->net_dev) {
> @@ -298,6 +289,24 @@ static int set_device_name(struct led_netdev_data *t=
rigger_data,
>  		set_baseline_state(trigger_data);
> =20
>  	mutex_unlock(&trigger_data->lock);
> +}
> +
> +static int set_device_name(struct led_netdev_data *trigger_data,
> +			   const char *name, size_t size)
> +{
> +	if (size >=3D IFNAMSIZ)
> +		return -EINVAL;
> +
> +	cancel_delayed_work_sync(&trigger_data->work);
> +
> +	/*
> +	 * Take RTNL lock before trigger_data lock to prevent potential
> +	 * deadlock with netdev notifier registration.
> +	 */
> +	rtnl_lock();
> +
> +	set_device_name_locked(trigger_data, name, size);
> +
>  	rtnl_unlock();
> =20
>  	return 0;
> @@ -579,6 +588,20 @@ static int netdev_trig_notify(struct notifier_block =
*nb,
>  	    && evt !=3D NETDEV_CHANGENAME)
>  		return NOTIFY_DONE;
> =20
> +	if (evt =3D=3D NETDEV_REGISTER && !trigger_data->device_name[0] &&
> +	    led_cdev->hw_control_get && led_cdev->hw_control_set &&
> +	    led_cdev->hw_control_is_supported) {
> +		struct device *ndev =3D led_cdev->hw_control_get_device(led_cdev);
> +		if (ndev) {
> +			const char *name =3D dev_name(ndev);
> +
> +			trigger_data->hw_control =3D true;
> +
> +			cancel_delayed_work_sync(&trigger_data->work);
> +			set_device_name_locked(trigger_data, name, strlen(name));
> +		}
> +	}
> +

hmm, somehow this did not work for me as is, because the devicename
never makes it to the trigger. It seems because
	phy_led_hw_control_get_device()
of course only returns a device after the phy got attached somewhere and
NULL otherwise.

Testsystem is a Qnap TS233 NAS with RK3568 SoC using a dwmac on
6.16 kernel and 3 LEDs attached to the Motorcomm PHY.


On boot into regular Debian I see some separate steps, generating
events in the netdev trigger:

=2D dwmac probes and probes the phy
I see a number of expected NETDEV_REGISTER events


=2D systemd renames the interface to end0
[    6.502455] rk_gmac-dwmac fe2a0000.ethernet end0: renamed from eth0
[    6.509696] netdev_trig_notify evt 11

=2D dhclient end0
[   62.156033] rk_gmac-dwmac fe2a0000.ethernet end0: Register MEM_TYPE_PAGE=
_POOL RxQ-0
[   62.165292] phy_attach_direct
   ... only here phydev->attached_dev is set ...
[...]
[   62.240004] rk_gmac-dwmac fe2a0000.ethernet end0: configuring for phy/rg=
mii link mode
[   62.250517] netdev_trig_notify evt 1
[   65.315407] rk_gmac-dwmac fe2a0000.ethernet end0: Link is Up - 1Gbps/Ful=
l - flow control rx/tx
[   65.315415] netdev_trig_notify evt 4


changing from
	evt =3D=3D NETDEV_REGISTER
to
	evt =3D=3D NETDEV_UP
in the conditional up there, makes the device_name resolve work for me.
But right now, I have no clue if that is a bit no-no :-)

Or do we want a NETDEV_PHY_ATTACH (+_DETACH) event type ?


I'll try to poke things more
Heiko



>  	if (!(dev =3D=3D trigger_data->net_dev ||
>  	      (evt =3D=3D NETDEV_CHANGENAME && !strcmp(dev->name, trigger_data-=
>device_name)) ||
>  	      (evt =3D=3D NETDEV_REGISTER && !strcmp(dev->name, trigger_data->d=
evice_name))))
> @@ -689,6 +712,7 @@ static int netdev_trig_activate(struct led_classdev *=
led_cdev)
>  	struct led_netdev_data *trigger_data;
>  	unsigned long mode =3D 0;
>  	struct device *dev;
> +	u32 val;
>  	int rc;
> =20
>  	trigger_data =3D kzalloc(sizeof(struct led_netdev_data), GFP_KERNEL);
> @@ -706,7 +730,8 @@ static int netdev_trig_activate(struct led_classdev *=
led_cdev)
>  	trigger_data->net_dev =3D NULL;
>  	trigger_data->device_name[0] =3D 0;
> =20
> -	trigger_data->mode =3D 0;
> +	rc =3D of_property_read_u32(led_cdev->dev->of_node, "netdev-trigger-mod=
e", &val);
> +	trigger_data->mode =3D rc ? 0 : val;
>  	atomic_set(&trigger_data->interval, msecs_to_jiffies(NETDEV_LED_DEFAULT=
_INTERVAL));
>  	trigger_data->last_activity =3D 0;
> =20
>=20





