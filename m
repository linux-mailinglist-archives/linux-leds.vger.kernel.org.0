Return-Path: <linux-leds+bounces-6723-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPDiOaXJc2mQygAAu9opvQ
	(envelope-from <linux-leds+bounces-6723-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 23 Jan 2026 20:19:01 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 940587A17F
	for <lists+linux-leds@lfdr.de>; Fri, 23 Jan 2026 20:19:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97377303661F
	for <lists+linux-leds@lfdr.de>; Fri, 23 Jan 2026 19:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC24B2777FC;
	Fri, 23 Jan 2026 19:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="aNN61IBL"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA2025C802
	for <linux-leds@vger.kernel.org>; Fri, 23 Jan 2026 19:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769195887; cv=none; b=ELZ30rq3ktEIhCPQe59b7YFZmbrU+lTIcYgTFHbLzppfGCdeVegpEUTsWd616oWxM15c+YWXLZifXCoX1p+nRyeKzyU8zr+IgI5EkFVW4VEaqCV87nXqiaNUd/1HkXhmjYQ3bTBp0750P8mEMG3lw/QSML1iuhJhcd1ZfmMbn7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769195887; c=relaxed/simple;
	bh=KkKlOaZI84FRMwvPHRCgWD174QDeULhQsKbE9MmepDc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WXNEPy1vt0G5jsOAo6r16JM98Xak7pGs+I6eoD6uyZPMYKaO13qEoyW00/AC0YH4SsmgdOLjrYteb6Dpp7jS4OHC5fe+6TNc9RDq2Nx6vRORy7OBfrceC6DZl/t2CHR777y8rHHF8cQ/QW/UnZ56/CHijXmH9XTHqdEoYm+Re/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=aNN61IBL; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id F3FA624002A
	for <linux-leds@vger.kernel.org>; Fri, 23 Jan 2026 20:18:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1769195884; bh=EkhUtgoic/y3ldPfdUhjFsRmPv7Pnl1iCuE+wtj3oxc=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=aNN61IBL2yBG1YahLJI58AMlKKAJL/tP1nTodjTsNeIKg+hQyEGfQ/OcCyMKgUScq
	 pxidYUKwa4csyXD805pv2CM0+7OkRDnOjYP9WAUMUI+B60rU2Ov1YypWOwOHdKoWOY
	 +XV2WaCK084DcA6KhDNDh2lqSd8UwYooCdwFpaZ3Gp+aBCdqZTswZ62HsdVa3mtJKF
	 8fhj0wu8Ajyv3z2nrwUXhZNfjzvJm23agr/NPHj3+yQ1iJMDfxsen/6ItFhMI4dAPU
	 eGwYoZfcqU4VLIEemLVowygQKixxAbUs0ed1Qf2xh4GdbfnFFu+rTZcWATfiDJbGMW
	 97rS0whlMicRA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4dySPh6DKwz6tvd;
	Fri, 23 Jan 2026 20:18:00 +0100 (CET)
Message-ID: <9d75b9bcfd18f2e2073f201375458af7bf5f1dc7.camel@posteo.de>
Subject: Re: [PATCH RFC 3/4] leds: add delay_on, delay_off and invert
 attributes to disk trigger
From: Markus Probst <markus.probst@posteo.de>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 John Garry	 <john.g.garry@oracle.com>, Jason Yan <yanaijie@huawei.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, "Martin K.
 Petersen" <martin.petersen@oracle.com>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-ide@vger.kernel.org, linux-scsi@vger.kernel.org
Date: Fri, 23 Jan 2026 19:18:03 +0000
In-Reply-To: <20260123-ledtrig_disk_-v1-3-07004756467b@posteo.de>
References: <20260123-ledtrig_disk_-v1-0-07004756467b@posteo.de>
	 <20260123-ledtrig_disk_-v1-3-07004756467b@posteo.de>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-znz3lQKgoCTyMhe+g0XG"
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[posteo.de,none];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[posteo.de:s=2017];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6723-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,oracle.com,huawei.com,HansenPartnership.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[posteo.de:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[markus.probst@posteo.de,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.de:email,posteo.de:dkim,posteo.de:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 940587A17F
X-Rspamd-Action: no action


--=-znz3lQKgoCTyMhe+g0XG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-01-23 at 19:05 +0000, Markus Probst wrote:
> Add delay_on, delay_off and invert device attributes to leds using the
> disk trigger.
>=20
> Signed-off-by: Markus Probst <markus.probst@posteo.de>
> ---
>  drivers/leds/trigger/ledtrig-disk.c | 194 ++++++++++++++++++++++++++++++=
+++---
>  1 file changed, 182 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/leds/trigger/ledtrig-disk.c b/drivers/leds/trigger/l=
edtrig-disk.c
> index e9b87ee944f2..ed5ef83a5b35 100644
> --- a/drivers/leds/trigger/ledtrig-disk.c
> +++ b/drivers/leds/trigger/ledtrig-disk.c
> @@ -9,31 +9,201 @@
> =20
>  #include <linux/kernel.h>
>  #include <linux/init.h>
> +#include <linux/list.h>
>  #include <linux/leds.h>
> +#include "../leds.h"
> =20
> -#define BLINK_DELAY 30
> +#define DEFAULT_BLINK_DELAY 30
> =20
> -DEFINE_LED_TRIGGER(ledtrig_disk);
> -DEFINE_LED_TRIGGER(ledtrig_disk_read);
> -DEFINE_LED_TRIGGER(ledtrig_disk_write);
> +struct ledtrig_disk_data {
> +	unsigned long delay_on;
> +	unsigned long delay_off;
> +	unsigned int invert;
> +};
> +
> +static ssize_t led_delay_on_show(struct device *dev,
> +		struct device_attribute *attr, char *buf)
> +{
> +	struct led_classdev *led_cdev =3D led_trigger_get_led(dev);
> +	struct ledtrig_disk_data *disk_data =3D led_get_trigger_data(led_cdev);
> +
> +	return sprintf(buf, "%lu\n", disk_data->delay_on);
> +}
> +
> +static ssize_t led_delay_on_store(struct device *dev,
> +		struct device_attribute *attr, const char *buf, size_t size)
> +{
> +	struct led_classdev *led_cdev =3D led_trigger_get_led(dev);
> +	struct ledtrig_disk_data *disk_data =3D led_get_trigger_data(led_cdev);
> +	unsigned long state;
> +	ssize_t ret;
> +
> +	ret =3D kstrtoul(buf, 10, &state);
> +	if (ret)
> +		return ret;
> +
> +	disk_data->delay_on =3D state;
> +
> +	return size;
> +}
> +
> +static ssize_t led_delay_off_show(struct device *dev,
> +		struct device_attribute *attr, char *buf)
> +{
> +	struct led_classdev *led_cdev =3D led_trigger_get_led(dev);
> +	struct ledtrig_disk_data *disk_data =3D led_get_trigger_data(led_cdev);
> +
> +	return sprintf(buf, "%lu\n", disk_data->delay_off);
> +}
> +
> +static ssize_t led_delay_off_store(struct device *dev,
> +		struct device_attribute *attr, const char *buf, size_t size)
> +{
> +	struct led_classdev *led_cdev =3D led_trigger_get_led(dev);
> +	struct ledtrig_disk_data *disk_data =3D led_get_trigger_data(led_cdev);
> +	unsigned long state;
> +	ssize_t ret;
> +
> +	ret =3D kstrtoul(buf, 10, &state);
> +	if (ret)
> +		return ret;
> +
> +	disk_data->delay_off =3D state;
> +
> +	return size;
> +}
> +
> +static ssize_t led_invert_show(struct device *dev,
> +		struct device_attribute *attr, char *buf)
> +{
> +	struct ledtrig_disk_data *disk_data =3D
> +		led_trigger_get_drvdata(dev);
> +
> +	return sprintf(buf, "%u\n", disk_data->invert);
> +}
> +
> +static ssize_t led_invert_store(struct device *dev,
> +		struct device_attribute *attr, const char *buf, size_t size)
> +{
> +	struct led_classdev *led_cdev =3D led_trigger_get_led(dev);
> +	struct ledtrig_disk_data *disk_data =3D led_get_trigger_data(led_cdev);
> +	unsigned long state;
> +	int ret;
> +
> +	ret =3D kstrtoul(buf, 0, &state);
> +	if (ret)
> +		return ret;
> +
> +	led_set_brightness_nosleep(led_cdev, state ? LED_FULL : LED_OFF);
> +	disk_data->invert =3D !!state;
> +
> +	return size;
> +}
> +
> +static DEVICE_ATTR(delay_on, 0644, led_delay_on_show, led_delay_on_store=
);
> +static DEVICE_ATTR(delay_off, 0644, led_delay_off_show, led_delay_off_st=
ore);
> +static DEVICE_ATTR(invert, 0644, led_invert_show, led_invert_store);
> +
> +static struct attribute *ledtrig_disk_attrs[] =3D {
> +	&dev_attr_delay_on.attr,
> +	&dev_attr_delay_off.attr,
> +	&dev_attr_invert.attr,
> +	NULL
> +};
> +ATTRIBUTE_GROUPS(ledtrig_disk);
> +
> +static void pattern_init(struct led_classdev *led_cdev, struct ledtrig_d=
isk_data *disk_data)
> +{
> +	unsigned int size =3D 0;
> +
> +	u32 *pattern __free(kfree) =3D led_get_default_pattern(led_cdev, &size)=
;
> +	if (!pattern)
> +		return;
> +
> +	if (size !=3D 3) {
> +		dev_warn(led_cdev->dev,
> +			 "Expected 3 but got %u values for delays + invert pattern\n",
> +			 size);
> +		return;
> +	}
> +
> +	disk_data->delay_on =3D pattern[0];
> +	disk_data->delay_off =3D pattern[1];
> +	disk_data->invert =3D !!pattern[2];
> +}
> +
> +static int ledtrig_disk_activate(struct led_classdev *led_cdev)
> +{
> +	struct ledtrig_disk_data *disk_data;
> +
> +	disk_data =3D kzalloc(sizeof(*disk_data), GFP_KERNEL);
> +	if (!disk_data)
> +		return -ENOMEM;
> +
> +	disk_data->delay_on =3D DEFAULT_BLINK_DELAY;
> +	disk_data->delay_off =3D DEFAULT_BLINK_DELAY;
> +
> +	led_set_trigger_data(led_cdev, disk_data);
> +
> +	if (led_cdev->flags & LED_INIT_DEFAULT_TRIGGER) {
> +		pattern_init(led_cdev, disk_data);
> +		/*
> +		 * Mark as initialized even on pattern_init() error because
> +		 * any consecutive call to it would produce the same error.
> +		 */
> +		led_cdev->flags &=3D ~LED_INIT_DEFAULT_TRIGGER;
> +	}
> +
> +	led_set_brightness_nosleep(led_cdev, disk_data->invert ? LED_FULL : LED=
_OFF);
> +
> +	return 0;
> +}
> +
> +static struct led_trigger ledtrig_disk =3D {
> +	.name =3D "disk-activity",
> +	.activate =3D ledtrig_disk_activate,
> +	.groups =3D ledtrig_disk_groups,
> +};
> +static struct led_trigger ledtrig_disk_read =3D {
> +	.name =3D "disk-read",
> +	.activate =3D ledtrig_disk_activate,
> +	.groups =3D ledtrig_disk_groups,
> +};
> +static struct led_trigger ledtrig_disk_write =3D {
> +	.name =3D "disk-write",
> +	.activate =3D ledtrig_disk_activate,
> +	.groups =3D ledtrig_disk_groups,
> +};
> +
> +static void ledtrig_disk_blink_oneshot(struct led_trigger *trig)
> +{
> +	struct led_classdev *led_cdev;
> +	struct ledtrig_disk_data *disk_data;
> +
> +	rcu_read_lock();
> +	list_for_each_entry_rcu(led_cdev, &trig->led_cdevs, trig_list) {
> +		disk_data =3D led_get_trigger_data(led_cdev);
Also there is likely a race condition here, as there is a time gap
between the led being added to trig->led_cdevs and
ledtrig_disk_activate being run.

Is there a better way to avoid the race condition, than defining an own
list for each trigger?

Thanks
- Markus Probst

> +		led_blink_set_oneshot(led_cdev, &disk_data->delay_on, &disk_data->dela=
y_off,
> +				      disk_data->invert);
> +	}
> +	rcu_read_unlock();
> +}
> =20
>  void ledtrig_disk_activity(bool write)
>  {
> -	led_trigger_blink_oneshot(ledtrig_disk, BLINK_DELAY, BLINK_DELAY, 0);
> +	ledtrig_disk_blink_oneshot(&ledtrig_disk);
>  	if (write)
> -		led_trigger_blink_oneshot(ledtrig_disk_write,
> -					  BLINK_DELAY, BLINK_DELAY, 0);
> +		ledtrig_disk_blink_oneshot(&ledtrig_disk_write);
>  	else
> -		led_trigger_blink_oneshot(ledtrig_disk_read,
> -					  BLINK_DELAY, BLINK_DELAY, 0);
> +		ledtrig_disk_blink_oneshot(&ledtrig_disk_read);
>  }
>  EXPORT_SYMBOL(ledtrig_disk_activity);
> =20
>  static int __init ledtrig_disk_init(void)
>  {
> -	led_trigger_register_simple("disk-activity", &ledtrig_disk);
> -	led_trigger_register_simple("disk-read", &ledtrig_disk_read);
> -	led_trigger_register_simple("disk-write", &ledtrig_disk_write);
> +	led_trigger_register(&ledtrig_disk);
> +	led_trigger_register(&ledtrig_disk_read);
> +	led_trigger_register(&ledtrig_disk_write);
> =20
>  	return 0;
>  }

--=-znz3lQKgoCTyMhe+g0XG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmlzyVwbFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJEDR2H/jnrUPSRzAP/0Xl3Dy9j6tityy4ImxH
cMCxapiyXSrx3huV58S8jsOkxzwZP4WVh1it6TjAlCDHHhP1qpoF9yGhVUYU8rpR
s8OTSUH8EovshfJytBinfay8/QJgK7+X8cymQWmUVSRvTb6NckPp7it3H0d/Ld2n
nIKDRejxZD2eWbqBOKffp9bKRC3LbLykIPjhgFuMaHDSeJKPH9aCyoohri5iGI37
Vhud8T2DZn3iX/8WcI/XGFC53DT1F0w7NtFTFVlifDnQC4Mm3c2xkr4pQcb/p1Wz
QDPuWDViCjfEBezb70RPl0s2o2frLZdTn5oEzrpXUr5Ls3O4rocoFYMtWm6usfVn
1jV7H4EYMw9+iCwgPh1g7uGJv4eL7/oz87ITVovheXaDBOPwFE6qxP45W0SeG5ZH
/tbpOYVpI+NvAtBmkB3zsM/sqcfcKWGmi7KgG5wMKi0RLJSKpX9ockJkefyI4+OZ
scNwLaeTUh0CofKacTzXnfG+iU3Xji12iQ3AiciRigeXJkuTLcf9hyYVe3NxhH/i
e3yfs0foyrdSDaF3uk2YS7rhNv88e72H9kzqgkkUIasIVSv9M5eSWX83tM+WmSgS
i8LLlR+ewMRdD4io42PusQUh4oqhEgR7WoUtYouIIgsWisGnC8qnjJrtobVNgDTP
Fz2dLy0XmHfS/+RqfV3J32gn
=D6ke
-----END PGP SIGNATURE-----

--=-znz3lQKgoCTyMhe+g0XG--

