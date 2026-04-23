Return-Path: <linux-leds+bounces-7813-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLAoMHMq6mnfvgIAu9opvQ
	(envelope-from <linux-leds+bounces-7813-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 23 Apr 2026 16:19:31 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C7A45394E
	for <lists+linux-leds@lfdr.de>; Thu, 23 Apr 2026 16:19:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E012300277E
	for <lists+linux-leds@lfdr.de>; Thu, 23 Apr 2026 14:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CB023128B0;
	Thu, 23 Apr 2026 14:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="N4rPLt20"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D218D310784;
	Thu, 23 Apr 2026 14:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776953666; cv=none; b=QO3CNX5HbV0OOaqF/xRvmUfhjpl79hjZzf3SHtcZwpWKvkSfxucVYuPIB6IrQbB+bc6n8qxrbFn3zJoZErKRdivIke3Y9/vGz/Y49zsqeX103SJYmvH6gt7GaQVJN6fj6cgbHkt7JYhAX506LqawUYLTTNcRb9sqqvYR0ZkwfA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776953666; c=relaxed/simple;
	bh=RvHgrtp1Q5pdfBXtDAclaMIRYvKpLk6d5G4PSP125Mk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=szJ53FYpJF81QKJXFkpjtBffaUwureGmOKb0yYCwyPVL0YVs94URoLO0biJYNfCBsUA+Qb05QY/VszdLMkczJKGRgZVVECqe6J3V3F2/pByBZVPwP+FK+a9yDij08jRxUAyreHDWGCpB8lQozRf12dBsF/uB1TmvXiaLW/7R2zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=N4rPLt20; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1776953657; x=1777558457; i=w_armin@gmx.de;
	bh=08R/LgeHvASLipoGzDOHiLgVF9bycQf79D19UEUZhBI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=N4rPLt20lpbA/XQVGVZA6iPMCcABuEBe9DH1V/VfFdx7/UfxeTa5h4ZDIHCBMGDd
	 SM/Q0BkBYO9Dt8xfb/xk+D4pTjsVpP4yK2t2rFlWOKjVc41yFqvdm9XcSEa7PiaSN
	 RRbPeQz4Suxq8jpRFFemop4VXNJWwjg8ZcdBcrmdfvt+13M0UnbU/mcyp01i66wz6
	 nASBBGWcl65QgdZvGsJvBmT00M4d6L8F2/DfxJTk0xAH7Gcbly/B5mZq074dMIWOA
	 uyTx3wHocznvdzvTUhsWf96fCx2MR5lsTuPgNx5RW5PfRNKiaVDbeOzgcDC1I91wM
	 2s91zHwXAD5xCLfOAA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1McpJq-1vgJ9X3Bxa-00mr9S; Thu, 23
 Apr 2026 16:14:17 +0200
Message-ID: <db83fdad-0331-4d43-940d-b6f8f1594698@gmx.de>
Date: Thu, 23 Apr 2026 16:14:16 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] leds: Introduce the multi_max_intensity sysfs
 attribute
To: Lee Jones <lee@kernel.org>
Cc: pavel@kernel.org, linux-kernel@vger.kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, linux-leds@vger.kernel.org,
 linux-doc@vger.kernel.org, jacek.anaszewski@gmail.com, pobrn@protonmail.com,
 m.tretter@pengutronix.de, wse@tuxedocomputers.com
References: <20260409210629.9934-1-W_Armin@gmx.de>
 <20260409210629.9934-2-W_Armin@gmx.de>
 <3820059c-5095-4b99-9a63-970670ae279d@gmx.de>
 <20260423134457.GD170138@google.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260423134457.GD170138@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WjtiGgS/sE2WiPV1vNmhKXZG2fJAKyy/Cp+wt6EyO53UGA3cmIl
 xj0f2OZ9Q64XIuqKSgDoV4EAw+maLCewMbEa/oMxreX4I9e08DERAW64tZhI9+bcXEdgN5S
 r7D2MO1UpcNHSH5p3DCbr7og0CX0oQChL5rmwp6KN4j/oV3dW5zFq6UM7e6htfNkLJZkZEp
 y9dQH8LLyw59AazkVtrtg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XvsA5NUrHDQ=;w2ZOqq/golE1gRlkUl5dCFUltxV
 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
 CUqEaBkAhgNKzlQbDY3OB5Ppzf6pDMT1HEj/fsF
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7813-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,lwn.net,linuxfoundation.org,gmail.com,protonmail.com,pengutronix.de,tuxedocomputers.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[W_Armin@gmx.de,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmx.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmx.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,tuxedocomputers.com:email,ti.com:email,gmx.de:email,gmx.de:dkim,gmx.de:mid]
X-Rspamd-Queue-Id: C4C7A45394E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Am 23.04.26 um 15:44 schrieb Lee Jones:
> On Thu, 23 Apr 2026, Armin Wolf wrote:
>=20
>> Am 09.04.26 um 23:06 schrieb Armin Wolf:
>>> Some multicolor LEDs support global brightness control in hardware,
>>> meaning that the maximum intensity of the color components is not
>>> connected to the maximum global brightness. Such LEDs cannot be
>>> described properly by the current multicolor LED class interface,
>>> because it assumes that the maximum intensity of each color component
>>> is described by the maximum global brightness of the LED.
>>>
>>> Fix this by introducing a new sysfs attribute called
>>> "multi_max_intensity" holding the maximum intensity values for the
>>> color components of a multicolor LED class device. Drivers can use
>>> the new max_intensity field inside struct mc_subled to tell the
>>> multicolor LED class code about those values. Intensity values written
>>> by userspace applications will be limited to this maximum value.
>>>
>>> Drivers for multicolor LEDs that do not support global brightness
>>> control in hardware might still want to use the maximum global LED
>>> brightness supplied via devicetree as the maximum intensity of each
>>> individual color component. Such drivers should set max_intensity
>>> to 0 so that the multicolor LED core can act accordingly.
>>>
>>> The lp50xx and ncp5623 LED drivers already use hardware-based control
>>> for the global LED brightness. Modify those drivers to correctly
>>> initalize .max_intensity to avoid being limited to the maximum global
>>> brightness supplied via devicetree.
>>
>> WHat is you opinion on this, Pavel? Is it ok to extend the multicolor L=
ED
>> interface this way?
>=20
> This already has Jacek's Rb, so you're half way there.
>=20
> However, the merge-window is open, which is when a lot of maintainers
> (including myself) take a breather.  Seeing as I triage submissions in
> chronological order, unfortunately you just bumped yourself to the back
> of the queue.

Alright, just wanted to check that this patch was not forgoten.

Thanks,
Armin Wolf

>=20
>>> Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>
>>> Reviewed-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>>> ---
>>>    .../ABI/testing/sysfs-class-led-multicolor    | 19 ++++++--
>>>    Documentation/leds/leds-class-multicolor.rst  | 21 ++++++++-
>>>    drivers/leds/led-class-multicolor.c           | 47 ++++++++++++++++=
++-
>>>    drivers/leds/leds-lp50xx.c                    |  1 +
>>>    drivers/leds/rgb/leds-ncp5623.c               |  4 +-
>>>    include/linux/led-class-multicolor.h          | 30 +++++++++++-
>>>    6 files changed, 113 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor b/Do=
cumentation/ABI/testing/sysfs-class-led-multicolor
>>> index 16fc827b10cb..197da3e775b4 100644
>>> --- a/Documentation/ABI/testing/sysfs-class-led-multicolor
>>> +++ b/Documentation/ABI/testing/sysfs-class-led-multicolor
>>> @@ -16,9 +16,22 @@ Date:		March 2020
>>>    KernelVersion:	5.9
>>>    Contact:	Dan Murphy <dmurphy@ti.com>
>>>    Description:	read/write
>>> -		This file contains array of integers. Order of components is
>>> -		described by the multi_index array. The maximum intensity should
>>> -		not exceed /sys/class/leds/<led>/max_brightness.
>>> +		This file contains an array of integers. The order of components
>>> +		is described by the multi_index array. The maximum intensity value
>>> +		supported by each color component is described by the multi_max_int=
ensity
>>> +		file. Writing intensity values larger than the maximum value of a
>>> +		given color component will result in those values being clamped.
>>> +
>>> +		For additional details please refer to
>>> +		Documentation/leds/leds-class-multicolor.rst.
>>> +
>>> +What:		/sys/class/leds/<led>/multi_max_intensity
>>> +Date:		March 2026
>>> +KernelVersion:	7.1
>>> +Contact:	Armin Wolf <W_Armin@gmx.de>
>>> +Description:	read
>>> +		This file contains an array of integers describing the maximum
>>> +		intensity value for each intensity component.
>>>    		For additional details please refer to
>>>    		Documentation/leds/leds-class-multicolor.rst.
>>> diff --git a/Documentation/leds/leds-class-multicolor.rst b/Documentat=
ion/leds/leds-class-multicolor.rst
>>> index c6b47b4093c4..68340644f80b 100644
>>> --- a/Documentation/leds/leds-class-multicolor.rst
>>> +++ b/Documentation/leds/leds-class-multicolor.rst
>>> @@ -25,10 +25,14 @@ color name to indexed value.
>>>    The ``multi_index`` file is an array that contains the string list =
of the colors as
>>>    they are defined in each ``multi_*`` array file.
>>> -The ``multi_intensity`` is an array that can be read or written to fo=
r the
>>> +The ``multi_intensity`` file is an array that can be read or written =
to for the
>>>    individual color intensities.  All elements within this array must =
be written in
>>>    order for the color LED intensities to be updated.
>>> +The ``multi_max_intensity`` file is an array that contains the maximu=
m intensity
>>> +value supported by each color intensity. Intensity values above this =
will be
>>> +automatically clamped into the supported range.
>>> +
>>>    Directory Layout Example
>>>    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>>>    .. code-block:: console
>>> @@ -38,6 +42,7 @@ Directory Layout Example
>>>        -r--r--r--    1 root     root          4096 Oct 19 16:16 max_br=
ightness
>>>        -r--r--r--    1 root     root          4096 Oct 19 16:16 multi_=
index
>>>        -rw-r--r--    1 root     root          4096 Oct 19 16:16 multi_=
intensity
>>> +    -r--r--r--    1 root     root          4096 Oct 19 16:16 multi_ma=
x_intensity
>>>    ..
>>> @@ -104,3 +109,17 @@ the color LED group.
>>>        128
>>>    ..
>>> +
>>> +Writing intensity values larger than the maximum specified in ``multi=
_max_intensity``
>>> +will result in those values being clamped into the supported range.
>>> +
>>> +.. code-block:: console
>>> +
>>> +   # cat /sys/class/leds/multicolor:status/multi_max_intensity
>>> +   255 255 255
>>> +
>>> +   # echo 512 512 512 > /sys/class/leds/multicolor:status/multi_inten=
sity
>>> +   # cat /sys/class/leds/multicolor:status/multi_intensity
>>> +   255 255 255
>>> +
>>> +..
>>> diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-cl=
ass-multicolor.c
>>> index 6b671f3f9c61..8d763b1ae76f 100644
>>> --- a/drivers/leds/led-class-multicolor.c
>>> +++ b/drivers/leds/led-class-multicolor.c
>>> @@ -7,10 +7,28 @@
>>>    #include <linux/init.h>
>>>    #include <linux/led-class-multicolor.h>
>>>    #include <linux/math.h>
>>> +#include <linux/minmax.h>
>>>    #include <linux/module.h>
>>>    #include <linux/slab.h>
>>>    #include <linux/uaccess.h>
>>> +static unsigned int led_mc_get_max_intensity(struct led_classdev_mc *=
mcled_cdev, size_t index)
>>> +{
>>> +	unsigned int max_intensity;
>>> +
>>> +	/* The maximum global brightness value might still be changed by
>>> +	 * led_classdev_register_ext() using devicetree properties. This
>>> +	 * prevents us from changing subled_info[X].max_intensity when
>>> +	 * registering a multicolor LED class device, so we have to do
>>> +	 * this during runtime.
>>> +	 */
>>> +	max_intensity =3D mcled_cdev->subled_info[index].max_intensity;
>>> +	if (max_intensity)
>>> +		return max_intensity;
>>> +
>>> +	return mcled_cdev->led_cdev.max_brightness;
>>> +}
>>> +
>>>    int led_mc_calc_color_components(struct led_classdev_mc *mcled_cdev=
,
>>>    				 enum led_brightness brightness)
>>>    {
>>> @@ -27,6 +45,27 @@ int led_mc_calc_color_components(struct led_classde=
v_mc *mcled_cdev,
>>>    }
>>>    EXPORT_SYMBOL_GPL(led_mc_calc_color_components);
>>> +static ssize_t multi_max_intensity_show(struct device *dev,
>>> +					struct device_attribute *intensity_attr, char *buf)
>>> +{
>>> +	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
>>> +	struct led_classdev_mc *mcled_cdev =3D lcdev_to_mccdev(led_cdev);
>>> +	unsigned int max_intensity;
>>> +	int len =3D 0;
>>> +	int i;
>>> +
>>> +	for (i =3D 0; i < mcled_cdev->num_colors; i++) {
>>> +		max_intensity =3D led_mc_get_max_intensity(mcled_cdev, i);
>>> +		len +=3D sysfs_emit_at(buf, len, "%u", max_intensity);
>>> +		if (i < mcled_cdev->num_colors - 1)
>>> +			len +=3D sprintf(buf + len, " ");
>>> +	}
>>> +
>>> +	buf[len++] =3D '\n';
>>> +	return len;
>>> +}
>>> +static DEVICE_ATTR_RO(multi_max_intensity);
>>> +
>>>    static ssize_t multi_intensity_store(struct device *dev,
>>>    				struct device_attribute *intensity_attr,
>>>    				const char *buf, size_t size)
>>> @@ -35,6 +74,7 @@ static ssize_t multi_intensity_store(struct device *=
dev,
>>>    	struct led_classdev_mc *mcled_cdev =3D lcdev_to_mccdev(led_cdev);
>>>    	int nrchars, offset =3D 0;
>>>    	unsigned int intensity_value[LED_COLOR_ID_MAX];
>>> +	unsigned int max_intensity;
>>>    	int i;
>>>    	ssize_t ret;
>>> @@ -56,8 +96,10 @@ static ssize_t multi_intensity_store(struct device =
*dev,
>>>    		goto err_out;
>>>    	}
>>> -	for (i =3D 0; i < mcled_cdev->num_colors; i++)
>>> -		mcled_cdev->subled_info[i].intensity =3D intensity_value[i];
>>> +	for (i =3D 0; i < mcled_cdev->num_colors; i++) {
>>> +		max_intensity =3D led_mc_get_max_intensity(mcled_cdev, i);
>>> +		mcled_cdev->subled_info[i].intensity =3D min(intensity_value[i], ma=
x_intensity);
>>> +	}
>>>    	if (!test_bit(LED_BLINK_SW, &led_cdev->work_flags))
>>>    		led_set_brightness(led_cdev, led_cdev->brightness);
>>> @@ -111,6 +153,7 @@ static ssize_t multi_index_show(struct device *dev=
,
>>>    static DEVICE_ATTR_RO(multi_index);
>>>    static struct attribute *led_multicolor_attrs[] =3D {
>>> +	&dev_attr_multi_max_intensity.attr,
>>>    	&dev_attr_multi_intensity.attr,
>>>    	&dev_attr_multi_index.attr,
>>>    	NULL,
>>> diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
>>> index e2a9c8592953..69c3550f1a31 100644
>>> --- a/drivers/leds/leds-lp50xx.c
>>> +++ b/drivers/leds/leds-lp50xx.c
>>> @@ -525,6 +525,7 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
>>>    			}
>>>    			mc_led_info[multi_index].color_index =3D color_id;
>>> +			mc_led_info[multi_index].max_intensity =3D 255;
>>>    			num_colors++;
>>>    		}
>>> diff --git a/drivers/leds/rgb/leds-ncp5623.c b/drivers/leds/rgb/leds-n=
cp5623.c
>>> index 85d6be6fff2b..f2528f06507d 100644
>>> --- a/drivers/leds/rgb/leds-ncp5623.c
>>> +++ b/drivers/leds/rgb/leds-ncp5623.c
>>> @@ -56,8 +56,7 @@ static int ncp5623_brightness_set(struct led_classde=
v *cdev,
>>>    	for (int i =3D 0; i < mc_cdev->num_colors; i++) {
>>>    		ret =3D ncp5623_write(ncp->client,
>>>    				    NCP5623_PWM_REG(mc_cdev->subled_info[i].channel),
>>> -				    min(mc_cdev->subled_info[i].intensity,
>>> -					NCP5623_MAX_BRIGHTNESS));
>>> +				    mc_cdev->subled_info[i].intensity);
>>>    		if (ret)
>>>    			return ret;
>>>    	}
>>> @@ -190,6 +189,7 @@ static int ncp5623_probe(struct i2c_client *client=
)
>>>    			goto release_led_node;
>>>    		subled_info[ncp->mc_dev.num_colors].channel =3D reg;
>>> +		subled_info[ncp->mc_dev.num_colors].max_intensity =3D NCP5623_MAX_B=
RIGHTNESS;
>>>    		subled_info[ncp->mc_dev.num_colors++].color_index =3D color_index=
;
>>>    	}
>>> diff --git a/include/linux/led-class-multicolor.h b/include/linux/led-=
class-multicolor.h
>>> index db9f34c6736e..45469388bb1a 100644
>>> --- a/include/linux/led-class-multicolor.h
>>> +++ b/include/linux/led-class-multicolor.h
>>> @@ -9,10 +9,31 @@
>>>    #include <linux/leds.h>
>>>    #include <dt-bindings/leds/common.h>
>>> +/**
>>> + * struct mc_subled - Color component description.
>>> + * @color_index: Color ID.
>>> + * @brightness: Scaled intensity.
>>> + * @intensity: Current intensity.
>>> + * @max_intensity: Maximum supported intensity value.
>>> + * @channel: Channel index.
>>> + *
>>> + * Describes a color component of a multicolor LED. Many multicolor L=
EDs
>>> + * do no support global brightness control in hardware, so they use
>>> + * the brightness field in connection with led_mc_calc_color_componen=
ts()
>>> + * to perform the intensity scaling in software.
>>> + * Such drivers should set max_intensity to 0 to signal the multicolo=
r LED core
>>> + * that the maximum global brightness of the LED class device should =
be used for
>>> + * limiting incoming intensity values.
>>> + *
>>> + * Multicolor LEDs that do support global brightness control in hardw=
are
>>> + * should instead set max_intensity to the maximum intensity value su=
pported
>>> + * by the hardware for a given color component.
>>> + */
>>>    struct mc_subled {
>>>    	unsigned int color_index;
>>>    	unsigned int brightness;
>>>    	unsigned int intensity;
>>> +	unsigned int max_intensity;
>>>    	unsigned int channel;
>>>    };
>>> @@ -53,7 +74,14 @@ int led_classdev_multicolor_register_ext(struct dev=
ice *parent,
>>>     */
>>>    void led_classdev_multicolor_unregister(struct led_classdev_mc *mcl=
ed_cdev);
>>> -/* Calculate brightness for the monochrome LED cluster */
>>> +/**
>>> + * led_mc_calc_color_components() - Calculates component brightness v=
alues of a LED cluster.
>>> + * @mcled_cdev - Multicolor LED class device of the LED cluster.
>>> + * @brightness - Global brightness of the LED cluster.
>>> + *
>>> + * Calculates the brightness values for each color component of a mon=
ochrome LED cluster,
>>> + * see Documentation/leds/leds-class-multicolor.rst for details.
>>> + */
>>>    int led_mc_calc_color_components(struct led_classdev_mc *mcled_cdev=
,
>>>    				 enum led_brightness brightness);
>>
>>
>=20


