Return-Path: <linux-leds+bounces-7811-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNrOH1Ei6mnKuwIAu9opvQ
	(envelope-from <linux-leds+bounces-7811-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 23 Apr 2026 15:44:49 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FA8453346
	for <lists+linux-leds@lfdr.de>; Thu, 23 Apr 2026 15:44:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2F624301589A
	for <lists+linux-leds@lfdr.de>; Thu, 23 Apr 2026 13:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4108274B2B;
	Thu, 23 Apr 2026 13:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="opNepaJI"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D61275AFD;
	Thu, 23 Apr 2026 13:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776951380; cv=none; b=nSFo6TNeTwmQDPcbJwO1Xe8pQLMndfP8ZrYnq9iAo5fErzzulMt/HrtpJCnKPpk9rrVsceXPbK0HkmzlGAnOkNrZJ01qkS798OV3JpPg0r4FRJTZAazfgFjZf8ShMJ/ln8VtiRtodX78MK0+NOyrcjPkRImToxTJNsea+yqaoUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776951380; c=relaxed/simple;
	bh=1Yb8feAaCUu4+NXbPt23Rw28lOJT5o6vU1munLHGSjk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=IXw6xE2WT8F/yBpJP67wUF01YEF4ux15N7Kg15mzTJpZQZ1nC0v4rQosVj6ja+8y6UeRGimdV+S26DwPLhshVWN13DzoMdYE5R6dDu4AM0XZqVSuDMWDCBWerPPGUCrM47SyzSiwZCE0YT+Yx5pDZ9WZBDSCHm3pCP6zIpvmEgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=opNepaJI; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1776951374; x=1777556174; i=w_armin@gmx.de;
	bh=v20alD33RWbbc9ViTlrpy/fMUcifLFqjLZgi8AvolUY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=opNepaJI9TYFFJg5YfZfq5TgUsnrzj/xl5VeW8Eev1xXL3+fBDK1iyJVmf+B9W8/
	 YoB3sxZ9jgBMRxZS9WLjtcFKhVSigW5nc4EFUiMxMJTRyaGBzy51USWfIcdyWtf5j
	 CwoQbwxXESs0KQ3A5GzOiH0EgiMZZ8CSJ089w7MWanRHZyZxMYditAm3EdAxoL6B2
	 nSTKdeVS7cCLEM84TeHmclO1z6ExJB7OglcXIB4IT1OZ8Y/whHAKdb0AwPfPRaTQu
	 BFV7HwojFSIJlJztL6q3ur7GK7UlYRpiXgkdeaqwdGKqKEOZGg+zV+ZLZsnjzFUPX
	 x6P093VbgFIA9Q3bOg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MsHs0-1vMZoS1w3m-01351B; Thu, 23
 Apr 2026 15:36:14 +0200
Message-ID: <3820059c-5095-4b99-9a63-970670ae279d@gmx.de>
Date: Thu, 23 Apr 2026 15:36:13 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] leds: Introduce the multi_max_intensity sysfs
 attribute
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org, pavel@kernel.org
Cc: linux-kernel@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 linux-leds@vger.kernel.org, linux-doc@vger.kernel.org,
 jacek.anaszewski@gmail.com, pobrn@protonmail.com, m.tretter@pengutronix.de,
 wse@tuxedocomputers.com
References: <20260409210629.9934-1-W_Armin@gmx.de>
 <20260409210629.9934-2-W_Armin@gmx.de>
Content-Language: en-US
In-Reply-To: <20260409210629.9934-2-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/00FPJ6M01k6XrudS+gwt+uHRbEx+mjlk7MRKng3euRkL3yQwCL
 RV/Mk6HB7YhAfgU24BzSHNwxb/bZHjljCwOMQdolwuk2f1aXhafG6vn6hYQKLwp3yLOO3R6
 g63b56GarbA2yayV2q1YsvZ/2AEIfPPlgJniDZlQ2se2QAkNVCGbnTcHGvzqcCgTpCl0hIk
 5UrENXIHd/Icp5hl8kUyg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Pqf7oifHHZE=;w9FeGdR9cxH37vCg5d5Vx9IEJGu
 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
 zxmcBGYCib7SbiahTc=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lwn.net,linuxfoundation.org,gmail.com,protonmail.com,pengutronix.de,tuxedocomputers.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7811-lists,linux-leds=lfdr.de];
	DKIM_TRACE(0.00)[gmx.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmx.de];
	MAILSPIKE_FAIL(0.00)[2600:3c04:e001:36c::12fc:5321:server fail];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[W_Armin@gmx.de,linux-leds@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,gmx.de:email,gmx.de:dkim,gmx.de:mid,ti.com:email]
X-Rspamd-Queue-Id: F3FA8453346
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Am 09.04.26 um 23:06 schrieb Armin Wolf:
> Some multicolor LEDs support global brightness control in hardware,
> meaning that the maximum intensity of the color components is not
> connected to the maximum global brightness. Such LEDs cannot be
> described properly by the current multicolor LED class interface,
> because it assumes that the maximum intensity of each color component
> is described by the maximum global brightness of the LED.
>=20
> Fix this by introducing a new sysfs attribute called
> "multi_max_intensity" holding the maximum intensity values for the
> color components of a multicolor LED class device. Drivers can use
> the new max_intensity field inside struct mc_subled to tell the
> multicolor LED class code about those values. Intensity values written
> by userspace applications will be limited to this maximum value.
>=20
> Drivers for multicolor LEDs that do not support global brightness
> control in hardware might still want to use the maximum global LED
> brightness supplied via devicetree as the maximum intensity of each
> individual color component. Such drivers should set max_intensity
> to 0 so that the multicolor LED core can act accordingly.
>=20
> The lp50xx and ncp5623 LED drivers already use hardware-based control
> for the global LED brightness. Modify those drivers to correctly
> initalize .max_intensity to avoid being limited to the maximum global
> brightness supplied via devicetree.

WHat is you opinion on this, Pavel? Is it ok to extend the multicolor=20
LED interface this way?

Thanks,
Armin Wolf

> Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>
> Reviewed-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>   .../ABI/testing/sysfs-class-led-multicolor    | 19 ++++++--
>   Documentation/leds/leds-class-multicolor.rst  | 21 ++++++++-
>   drivers/leds/led-class-multicolor.c           | 47 ++++++++++++++++++-
>   drivers/leds/leds-lp50xx.c                    |  1 +
>   drivers/leds/rgb/leds-ncp5623.c               |  4 +-
>   include/linux/led-class-multicolor.h          | 30 +++++++++++-
>   6 files changed, 113 insertions(+), 9 deletions(-)
>=20
> diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor b/Docu=
mentation/ABI/testing/sysfs-class-led-multicolor
> index 16fc827b10cb..197da3e775b4 100644
> --- a/Documentation/ABI/testing/sysfs-class-led-multicolor
> +++ b/Documentation/ABI/testing/sysfs-class-led-multicolor
> @@ -16,9 +16,22 @@ Date:		March 2020
>   KernelVersion:	5.9
>   Contact:	Dan Murphy <dmurphy@ti.com>
>   Description:	read/write
> -		This file contains array of integers. Order of components is
> -		described by the multi_index array. The maximum intensity should
> -		not exceed /sys/class/leds/<led>/max_brightness.
> +		This file contains an array of integers. The order of components
> +		is described by the multi_index array. The maximum intensity value
> +		supported by each color component is described by the multi_max_inten=
sity
> +		file. Writing intensity values larger than the maximum value of a
> +		given color component will result in those values being clamped.
> +
> +		For additional details please refer to
> +		Documentation/leds/leds-class-multicolor.rst.
> +
> +What:		/sys/class/leds/<led>/multi_max_intensity
> +Date:		March 2026
> +KernelVersion:	7.1
> +Contact:	Armin Wolf <W_Armin@gmx.de>
> +Description:	read
> +		This file contains an array of integers describing the maximum
> +		intensity value for each intensity component.
>  =20
>   		For additional details please refer to
>   		Documentation/leds/leds-class-multicolor.rst.
> diff --git a/Documentation/leds/leds-class-multicolor.rst b/Documentatio=
n/leds/leds-class-multicolor.rst
> index c6b47b4093c4..68340644f80b 100644
> --- a/Documentation/leds/leds-class-multicolor.rst
> +++ b/Documentation/leds/leds-class-multicolor.rst
> @@ -25,10 +25,14 @@ color name to indexed value.
>   The ``multi_index`` file is an array that contains the string list of =
the colors as
>   they are defined in each ``multi_*`` array file.
>  =20
> -The ``multi_intensity`` is an array that can be read or written to for =
the
> +The ``multi_intensity`` file is an array that can be read or written to=
 for the
>   individual color intensities.  All elements within this array must be =
written in
>   order for the color LED intensities to be updated.
>  =20
> +The ``multi_max_intensity`` file is an array that contains the maximum =
intensity
> +value supported by each color intensity. Intensity values above this wi=
ll be
> +automatically clamped into the supported range.
> +
>   Directory Layout Example
>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>   .. code-block:: console
> @@ -38,6 +42,7 @@ Directory Layout Example
>       -r--r--r--    1 root     root          4096 Oct 19 16:16 max_brigh=
tness
>       -r--r--r--    1 root     root          4096 Oct 19 16:16 multi_ind=
ex
>       -rw-r--r--    1 root     root          4096 Oct 19 16:16 multi_int=
ensity
> +    -r--r--r--    1 root     root          4096 Oct 19 16:16 multi_max_=
intensity
>  =20
>   ..
>  =20
> @@ -104,3 +109,17 @@ the color LED group.
>       128
>  =20
>   ..
> +
> +Writing intensity values larger than the maximum specified in ``multi_m=
ax_intensity``
> +will result in those values being clamped into the supported range.
> +
> +.. code-block:: console
> +
> +   # cat /sys/class/leds/multicolor:status/multi_max_intensity
> +   255 255 255
> +
> +   # echo 512 512 512 > /sys/class/leds/multicolor:status/multi_intensi=
ty
> +   # cat /sys/class/leds/multicolor:status/multi_intensity
> +   255 255 255
> +
> +..
> diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-clas=
s-multicolor.c
> index 6b671f3f9c61..8d763b1ae76f 100644
> --- a/drivers/leds/led-class-multicolor.c
> +++ b/drivers/leds/led-class-multicolor.c
> @@ -7,10 +7,28 @@
>   #include <linux/init.h>
>   #include <linux/led-class-multicolor.h>
>   #include <linux/math.h>
> +#include <linux/minmax.h>
>   #include <linux/module.h>
>   #include <linux/slab.h>
>   #include <linux/uaccess.h>
>  =20
> +static unsigned int led_mc_get_max_intensity(struct led_classdev_mc *mc=
led_cdev, size_t index)
> +{
> +	unsigned int max_intensity;
> +
> +	/* The maximum global brightness value might still be changed by
> +	 * led_classdev_register_ext() using devicetree properties. This
> +	 * prevents us from changing subled_info[X].max_intensity when
> +	 * registering a multicolor LED class device, so we have to do
> +	 * this during runtime.
> +	 */
> +	max_intensity =3D mcled_cdev->subled_info[index].max_intensity;
> +	if (max_intensity)
> +		return max_intensity;
> +
> +	return mcled_cdev->led_cdev.max_brightness;
> +}
> +
>   int led_mc_calc_color_components(struct led_classdev_mc *mcled_cdev,
>   				 enum led_brightness brightness)
>   {
> @@ -27,6 +45,27 @@ int led_mc_calc_color_components(struct led_classdev_=
mc *mcled_cdev,
>   }
>   EXPORT_SYMBOL_GPL(led_mc_calc_color_components);
>  =20
> +static ssize_t multi_max_intensity_show(struct device *dev,
> +					struct device_attribute *intensity_attr, char *buf)
> +{
> +	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
> +	struct led_classdev_mc *mcled_cdev =3D lcdev_to_mccdev(led_cdev);
> +	unsigned int max_intensity;
> +	int len =3D 0;
> +	int i;
> +
> +	for (i =3D 0; i < mcled_cdev->num_colors; i++) {
> +		max_intensity =3D led_mc_get_max_intensity(mcled_cdev, i);
> +		len +=3D sysfs_emit_at(buf, len, "%u", max_intensity);
> +		if (i < mcled_cdev->num_colors - 1)
> +			len +=3D sprintf(buf + len, " ");
> +	}
> +
> +	buf[len++] =3D '\n';
> +	return len;
> +}
> +static DEVICE_ATTR_RO(multi_max_intensity);
> +
>   static ssize_t multi_intensity_store(struct device *dev,
>   				struct device_attribute *intensity_attr,
>   				const char *buf, size_t size)
> @@ -35,6 +74,7 @@ static ssize_t multi_intensity_store(struct device *de=
v,
>   	struct led_classdev_mc *mcled_cdev =3D lcdev_to_mccdev(led_cdev);
>   	int nrchars, offset =3D 0;
>   	unsigned int intensity_value[LED_COLOR_ID_MAX];
> +	unsigned int max_intensity;
>   	int i;
>   	ssize_t ret;
>  =20
> @@ -56,8 +96,10 @@ static ssize_t multi_intensity_store(struct device *d=
ev,
>   		goto err_out;
>   	}
>  =20
> -	for (i =3D 0; i < mcled_cdev->num_colors; i++)
> -		mcled_cdev->subled_info[i].intensity =3D intensity_value[i];
> +	for (i =3D 0; i < mcled_cdev->num_colors; i++) {
> +		max_intensity =3D led_mc_get_max_intensity(mcled_cdev, i);
> +		mcled_cdev->subled_info[i].intensity =3D min(intensity_value[i], max_=
intensity);
> +	}
>  =20
>   	if (!test_bit(LED_BLINK_SW, &led_cdev->work_flags))
>   		led_set_brightness(led_cdev, led_cdev->brightness);
> @@ -111,6 +153,7 @@ static ssize_t multi_index_show(struct device *dev,
>   static DEVICE_ATTR_RO(multi_index);
>  =20
>   static struct attribute *led_multicolor_attrs[] =3D {
> +	&dev_attr_multi_max_intensity.attr,
>   	&dev_attr_multi_intensity.attr,
>   	&dev_attr_multi_index.attr,
>   	NULL,
> diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
> index e2a9c8592953..69c3550f1a31 100644
> --- a/drivers/leds/leds-lp50xx.c
> +++ b/drivers/leds/leds-lp50xx.c
> @@ -525,6 +525,7 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
>   			}
>  =20
>   			mc_led_info[multi_index].color_index =3D color_id;
> +			mc_led_info[multi_index].max_intensity =3D 255;
>   			num_colors++;
>   		}
>  =20
> diff --git a/drivers/leds/rgb/leds-ncp5623.c b/drivers/leds/rgb/leds-ncp=
5623.c
> index 85d6be6fff2b..f2528f06507d 100644
> --- a/drivers/leds/rgb/leds-ncp5623.c
> +++ b/drivers/leds/rgb/leds-ncp5623.c
> @@ -56,8 +56,7 @@ static int ncp5623_brightness_set(struct led_classdev =
*cdev,
>   	for (int i =3D 0; i < mc_cdev->num_colors; i++) {
>   		ret =3D ncp5623_write(ncp->client,
>   				    NCP5623_PWM_REG(mc_cdev->subled_info[i].channel),
> -				    min(mc_cdev->subled_info[i].intensity,
> -					NCP5623_MAX_BRIGHTNESS));
> +				    mc_cdev->subled_info[i].intensity);
>   		if (ret)
>   			return ret;
>   	}
> @@ -190,6 +189,7 @@ static int ncp5623_probe(struct i2c_client *client)
>   			goto release_led_node;
>  =20
>   		subled_info[ncp->mc_dev.num_colors].channel =3D reg;
> +		subled_info[ncp->mc_dev.num_colors].max_intensity =3D NCP5623_MAX_BRI=
GHTNESS;
>   		subled_info[ncp->mc_dev.num_colors++].color_index =3D color_index;
>   	}
>  =20
> diff --git a/include/linux/led-class-multicolor.h b/include/linux/led-cl=
ass-multicolor.h
> index db9f34c6736e..45469388bb1a 100644
> --- a/include/linux/led-class-multicolor.h
> +++ b/include/linux/led-class-multicolor.h
> @@ -9,10 +9,31 @@
>   #include <linux/leds.h>
>   #include <dt-bindings/leds/common.h>
>  =20
> +/**
> + * struct mc_subled - Color component description.
> + * @color_index: Color ID.
> + * @brightness: Scaled intensity.
> + * @intensity: Current intensity.
> + * @max_intensity: Maximum supported intensity value.
> + * @channel: Channel index.
> + *
> + * Describes a color component of a multicolor LED. Many multicolor LED=
s
> + * do no support global brightness control in hardware, so they use
> + * the brightness field in connection with led_mc_calc_color_components=
()
> + * to perform the intensity scaling in software.
> + * Such drivers should set max_intensity to 0 to signal the multicolor =
LED core
> + * that the maximum global brightness of the LED class device should be=
 used for
> + * limiting incoming intensity values.
> + *
> + * Multicolor LEDs that do support global brightness control in hardwar=
e
> + * should instead set max_intensity to the maximum intensity value supp=
orted
> + * by the hardware for a given color component.
> + */
>   struct mc_subled {
>   	unsigned int color_index;
>   	unsigned int brightness;
>   	unsigned int intensity;
> +	unsigned int max_intensity;
>   	unsigned int channel;
>   };
>  =20
> @@ -53,7 +74,14 @@ int led_classdev_multicolor_register_ext(struct devic=
e *parent,
>    */
>   void led_classdev_multicolor_unregister(struct led_classdev_mc *mcled_=
cdev);
>  =20
> -/* Calculate brightness for the monochrome LED cluster */
> +/**
> + * led_mc_calc_color_components() - Calculates component brightness val=
ues of a LED cluster.
> + * @mcled_cdev - Multicolor LED class device of the LED cluster.
> + * @brightness - Global brightness of the LED cluster.
> + *
> + * Calculates the brightness values for each color component of a monoc=
hrome LED cluster,
> + * see Documentation/leds/leds-class-multicolor.rst for details.
> + */
>   int led_mc_calc_color_components(struct led_classdev_mc *mcled_cdev,
>   				 enum led_brightness brightness);
>  =20


