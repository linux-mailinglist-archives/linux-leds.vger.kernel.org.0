Return-Path: <linux-leds+bounces-7657-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIkhE8Ko1mlKHAgAu9opvQ
	(envelope-from <linux-leds+bounces-7657-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 08 Apr 2026 21:13:06 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 813BB3C2970
	for <lists+linux-leds@lfdr.de>; Wed, 08 Apr 2026 21:13:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9CE3F3009804
	for <lists+linux-leds@lfdr.de>; Wed,  8 Apr 2026 19:12:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 318443DA5CD;
	Wed,  8 Apr 2026 19:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="ncrNlmvK"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C212E3DA5C6;
	Wed,  8 Apr 2026 19:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775675571; cv=none; b=cmx0ltoV/YY+UGuveGnMo3vRCLLYVUC44CtHYb97QQf9uNXrudqf/4+1m8eKDQcdAGHla+zFsa5rRvxRsvgWCM42DNEqHeT5Ez00+KdvVnvDxxEQyZtVZh2YHDuhBlJZ04yf6pxCmjkInzAOinDDPyyFQZWj+pLmBFajZT5NVtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775675571; c=relaxed/simple;
	bh=BuWPUtIGfH/sFgW2cPY/j+sIef57tAfcNVq+BfF8UAw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=FZ17OLICL8ETNEo2kcFmpjXQgcmUBWXpmvIGI2wU7t3e4Up+xI953CgzBkpYE2hbCCiHXGrsmRBUtnpBt2Jzf/ZSkisET9eaWuWmwkE/0DmD2LJkO7fKfJ9pg4lCH6cmGLUPgHeILnrUm9xRX8LwMdzfz9fcY/gsG2k7Tog1y6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=ncrNlmvK; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1775675559; x=1776280359; i=w_armin@gmx.de;
	bh=+hPDSPiRrMwnl2jydI4XbTDecb7W54bwuAJuuMENhos=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ncrNlmvKl3i5UUK+LHuJfDz290SVwsDYR/UuJWgsQ9Si8JSbGLxJpcXEP4teXYAH
	 0Xs4kdm3lw6HD4GVVpXla4TF+Tr13nxzwkGxHjmGb6SpCAL/HiFnB2vzU6m+FC9w8
	 WHTw8uAqQ2atC8VIATX0JETFefgFuZ3CJJw29ygCMUfXZlGbgv78UWqBTKY80LGDD
	 sx4YATlpAWA2AnL5JkqTXLXYSmznX3B5M3NyEMRwy7c7eXa64lMLBc4lzOZShO3Yb
	 cD5CJgf3K4Eq0puaxtnPTpgeoKVgdUUXxi+821qxOp5GUGeF2sutj4Ga0Cr7Mf2OD
	 2oJqEMTo+ct9adk6vQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MwwZd-1vHDxM1zSd-00vYOc; Wed, 08
 Apr 2026 21:12:39 +0200
Message-ID: <b9a76be1-ef88-4e60-9828-ae4968fe3fba@gmx.de>
Date: Wed, 8 Apr 2026 21:12:38 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] leds: Introduce the multi_max_intensity sysfs
 attribute
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org, pavel@kernel.org
Cc: linux-kernel@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 linux-leds@vger.kernel.org, linux-doc@vger.kernel.org,
 wse@tuxedocomputers.com, jacek.anaszewski@gmail.com, pobrn@protonmail.com,
 m.tretter@pengutronix.de
References: <20260331191619.3729-1-W_Armin@gmx.de>
 <20260331191619.3729-2-W_Armin@gmx.de>
Content-Language: en-US
In-Reply-To: <20260331191619.3729-2-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DNzA32hTsD2WQk3OHBK8pHTCg48X2mv9u1eoWEKfKONwVzPV/wy
 NrCpe64VHIHAAOvS0bHzL7NftNaK+GJIRCvklRPeiSLTZ6jE3KJvS2fCMuNyIAArymhi248
 ruxtdtCLYasKk5HH7TlP/dxb9ocJ78deErmxBA9zWmIQK4uWLRnvl23dDfzg2fZ6wfWMvXT
 60y50nJoYjF3E1MvvEEbA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:PskW8PP+h3M=;6kQr8bBoqSHdeCNDL1dLGW74DGi
 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
 hzUYXS9wf6lNlTw==
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lwn.net,linuxfoundation.org,tuxedocomputers.com,gmail.com,protonmail.com,pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7657-lists,linux-leds=lfdr.de];
	DKIM_TRACE(0.00)[gmx.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmx.de];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[W_Armin@gmx.de,linux-leds@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.986];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:dkim,gmx.de:email,gmx.de:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ti.com:email]
X-Rspamd-Queue-Id: 813BB3C2970
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Am 31.03.26 um 21:16 schrieb Armin Wolf:

> Some multicolor LEDs support global brightness control in hardware,
> meaning that the maximum intensity of the color components is not
> connected to the maximum global brightness. Such LEDs cannot be
> described properly by the current multicolor LED class interface,
> because it assumes that the maximum intensity of each color component
> is described by the maximum global brightness of the LED.
>
> Fix this by introducing a new sysfs attribute called
> "multi_max_intensity" holding the maximum intensity values for the
> color components of a multicolor LED class device. Drivers can use
> the new max_intensity field inside struct mc_subled to tell the
> multicolor LED class code about those values. Intensity values written
> by userspace applications will be limited to this maximum value.
>
> Drivers for multicolor LEDs that do not support global brightness
> control in hardware might still want to use the maximum global LED
> brightness supplied via devicetree as the maximum intensity of each
> individual color component. Such drivers should set max_intensity
> to 0 so that the multicolor LED core can act accordingly.
>
> The lp50xx and ncp5623 LED drivers already use hardware-based control
> for the global LED brightness. Modify those drivers to correctly
> initalize .max_intensity to avoid being limited to the maximum global
> brightness supplied via devicetree.

Any thoughts on this?

Thanks,
Armin Wolf

> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>   .../ABI/testing/sysfs-class-led-multicolor    | 19 ++++++--
>   Documentation/leds/leds-class-multicolor.rst  | 21 ++++++++-
>   drivers/leds/led-class-multicolor.c           | 47 ++++++++++++++++++-
>   drivers/leds/leds-lp50xx.c                    |  1 +
>   drivers/leds/rgb/leds-ncp5623.c               |  4 +-
>   include/linux/led-class-multicolor.h          | 30 +++++++++++-
>   6 files changed, 113 insertions(+), 9 deletions(-)
>
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
> index db9f34c6736e..6f89d92566b2 100644
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
> + * do no support gobal brightness control in hardware, so they use
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

