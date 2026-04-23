Return-Path: <linux-leds+bounces-7812-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cF9kF3Ej6mnKuwIAu9opvQ
	(envelope-from <linux-leds+bounces-7812-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 23 Apr 2026 15:49:37 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBFA453447
	for <lists+linux-leds@lfdr.de>; Thu, 23 Apr 2026 15:49:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B202A300F7BE
	for <lists+linux-leds@lfdr.de>; Thu, 23 Apr 2026 13:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D02B2D97B5;
	Thu, 23 Apr 2026 13:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="njrwKGl9"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC091282F39;
	Thu, 23 Apr 2026 13:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776951903; cv=none; b=U3TXXqy7N0D+fQNiLTSUJp8XbL093DQxTvZXyuoM2e57rhPe3kJvJni4PxC6VTqURW36G+uGOAWGi9ItCT5kcDSU3qX9CKEHUYx8B0oK18Vm8uhTtwPTkrQPIHewsWD6OKHnf4W9QQylyFaSAe/cdHUPhCN0hFaN8osiAe7M5cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776951903; c=relaxed/simple;
	bh=mRg/g9+bwVgdC1KOVsJAp0dxGZfMUwFv0gI9LbDPmNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H48wki0A1N/7sQqbQHxuuonsBpx3yHh5ScrWZ0AkHuWOaP/q9XtuGH7z5KRtq46HwWPfFDpJrVyRy5ltlNjRGAhVygZP36HSp5xB0xwY357l0nFm/XVNmDOTyWqxmQI9kV3rPFFTemhC02cunbl1PWSu1LndI1iheINC/Sx/fe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=njrwKGl9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DEB9C2BCAF;
	Thu, 23 Apr 2026 13:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776951902;
	bh=mRg/g9+bwVgdC1KOVsJAp0dxGZfMUwFv0gI9LbDPmNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=njrwKGl9LX8hjg21hyGAZal3DMg2dZX8oSBoCG1YkLtiNAv5N/EsuU3LihqOM3Pim
	 g4K0vI9Ki7VX59W+CZEgwKUAgbQLWMq/LtqiUG9Xwg/bERNup1VrsFtZgXbyz4Qi5I
	 ZDLkL0S9LOdbErhaA09+d1GPtgsgJ8zNZwV2Eqo9kNEwtJJNECs0qntoQbfHHUpG7s
	 QzEGMPPzQF2Aa2vQbVqSvbgmo/oqfbM0spApV4kXmcLVPERjJCaf4vwhRst7QcwsQt
	 aukrhcKwnse2MPjnmUIazGpXoUzC08HIlPIqadlRrvODBe/aoyn+wfH+tnQbHlX/E1
	 775n8eDnkXebQ==
Date: Thu, 23 Apr 2026 14:44:57 +0100
From: Lee Jones <lee@kernel.org>
To: Armin Wolf <W_Armin@gmx.de>
Cc: pavel@kernel.org, linux-kernel@vger.kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org, linux-leds@vger.kernel.org,
	linux-doc@vger.kernel.org, jacek.anaszewski@gmail.com,
	pobrn@protonmail.com, m.tretter@pengutronix.de,
	wse@tuxedocomputers.com
Subject: Re: [PATCH v3 1/1] leds: Introduce the multi_max_intensity sysfs
 attribute
Message-ID: <20260423134457.GD170138@google.com>
References: <20260409210629.9934-1-W_Armin@gmx.de>
 <20260409210629.9934-2-W_Armin@gmx.de>
 <3820059c-5095-4b99-9a63-970670ae279d@gmx.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3820059c-5095-4b99-9a63-970670ae279d@gmx.de>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7812-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmx.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,lwn.net,linuxfoundation.org,gmail.com,protonmail.com,pengutronix.de,tuxedocomputers.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ti.com:email,tuxedocomputers.com:email]
X-Rspamd-Queue-Id: 2CBFA453447
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 23 Apr 2026, Armin Wolf wrote:

> Am 09.04.26 um 23:06 schrieb Armin Wolf:
> > Some multicolor LEDs support global brightness control in hardware,
> > meaning that the maximum intensity of the color components is not
> > connected to the maximum global brightness. Such LEDs cannot be
> > described properly by the current multicolor LED class interface,
> > because it assumes that the maximum intensity of each color component
> > is described by the maximum global brightness of the LED.
> > 
> > Fix this by introducing a new sysfs attribute called
> > "multi_max_intensity" holding the maximum intensity values for the
> > color components of a multicolor LED class device. Drivers can use
> > the new max_intensity field inside struct mc_subled to tell the
> > multicolor LED class code about those values. Intensity values written
> > by userspace applications will be limited to this maximum value.
> > 
> > Drivers for multicolor LEDs that do not support global brightness
> > control in hardware might still want to use the maximum global LED
> > brightness supplied via devicetree as the maximum intensity of each
> > individual color component. Such drivers should set max_intensity
> > to 0 so that the multicolor LED core can act accordingly.
> > 
> > The lp50xx and ncp5623 LED drivers already use hardware-based control
> > for the global LED brightness. Modify those drivers to correctly
> > initalize .max_intensity to avoid being limited to the maximum global
> > brightness supplied via devicetree.
> 
> WHat is you opinion on this, Pavel? Is it ok to extend the multicolor LED
> interface this way?

This already has Jacek's Rb, so you're half way there.

However, the merge-window is open, which is when a lot of maintainers
(including myself) take a breather.  Seeing as I triage submissions in
chronological order, unfortunately you just bumped yourself to the back
of the queue.

> > Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>
> > Reviewed-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> > Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> > ---
> >   .../ABI/testing/sysfs-class-led-multicolor    | 19 ++++++--
> >   Documentation/leds/leds-class-multicolor.rst  | 21 ++++++++-
> >   drivers/leds/led-class-multicolor.c           | 47 ++++++++++++++++++-
> >   drivers/leds/leds-lp50xx.c                    |  1 +
> >   drivers/leds/rgb/leds-ncp5623.c               |  4 +-
> >   include/linux/led-class-multicolor.h          | 30 +++++++++++-
> >   6 files changed, 113 insertions(+), 9 deletions(-)
> > 
> > diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor b/Documentation/ABI/testing/sysfs-class-led-multicolor
> > index 16fc827b10cb..197da3e775b4 100644
> > --- a/Documentation/ABI/testing/sysfs-class-led-multicolor
> > +++ b/Documentation/ABI/testing/sysfs-class-led-multicolor
> > @@ -16,9 +16,22 @@ Date:		March 2020
> >   KernelVersion:	5.9
> >   Contact:	Dan Murphy <dmurphy@ti.com>
> >   Description:	read/write
> > -		This file contains array of integers. Order of components is
> > -		described by the multi_index array. The maximum intensity should
> > -		not exceed /sys/class/leds/<led>/max_brightness.
> > +		This file contains an array of integers. The order of components
> > +		is described by the multi_index array. The maximum intensity value
> > +		supported by each color component is described by the multi_max_intensity
> > +		file. Writing intensity values larger than the maximum value of a
> > +		given color component will result in those values being clamped.
> > +
> > +		For additional details please refer to
> > +		Documentation/leds/leds-class-multicolor.rst.
> > +
> > +What:		/sys/class/leds/<led>/multi_max_intensity
> > +Date:		March 2026
> > +KernelVersion:	7.1
> > +Contact:	Armin Wolf <W_Armin@gmx.de>
> > +Description:	read
> > +		This file contains an array of integers describing the maximum
> > +		intensity value for each intensity component.
> >   		For additional details please refer to
> >   		Documentation/leds/leds-class-multicolor.rst.
> > diff --git a/Documentation/leds/leds-class-multicolor.rst b/Documentation/leds/leds-class-multicolor.rst
> > index c6b47b4093c4..68340644f80b 100644
> > --- a/Documentation/leds/leds-class-multicolor.rst
> > +++ b/Documentation/leds/leds-class-multicolor.rst
> > @@ -25,10 +25,14 @@ color name to indexed value.
> >   The ``multi_index`` file is an array that contains the string list of the colors as
> >   they are defined in each ``multi_*`` array file.
> > -The ``multi_intensity`` is an array that can be read or written to for the
> > +The ``multi_intensity`` file is an array that can be read or written to for the
> >   individual color intensities.  All elements within this array must be written in
> >   order for the color LED intensities to be updated.
> > +The ``multi_max_intensity`` file is an array that contains the maximum intensity
> > +value supported by each color intensity. Intensity values above this will be
> > +automatically clamped into the supported range.
> > +
> >   Directory Layout Example
> >   ========================
> >   .. code-block:: console
> > @@ -38,6 +42,7 @@ Directory Layout Example
> >       -r--r--r--    1 root     root          4096 Oct 19 16:16 max_brightness
> >       -r--r--r--    1 root     root          4096 Oct 19 16:16 multi_index
> >       -rw-r--r--    1 root     root          4096 Oct 19 16:16 multi_intensity
> > +    -r--r--r--    1 root     root          4096 Oct 19 16:16 multi_max_intensity
> >   ..
> > @@ -104,3 +109,17 @@ the color LED group.
> >       128
> >   ..
> > +
> > +Writing intensity values larger than the maximum specified in ``multi_max_intensity``
> > +will result in those values being clamped into the supported range.
> > +
> > +.. code-block:: console
> > +
> > +   # cat /sys/class/leds/multicolor:status/multi_max_intensity
> > +   255 255 255
> > +
> > +   # echo 512 512 512 > /sys/class/leds/multicolor:status/multi_intensity
> > +   # cat /sys/class/leds/multicolor:status/multi_intensity
> > +   255 255 255
> > +
> > +..
> > diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-class-multicolor.c
> > index 6b671f3f9c61..8d763b1ae76f 100644
> > --- a/drivers/leds/led-class-multicolor.c
> > +++ b/drivers/leds/led-class-multicolor.c
> > @@ -7,10 +7,28 @@
> >   #include <linux/init.h>
> >   #include <linux/led-class-multicolor.h>
> >   #include <linux/math.h>
> > +#include <linux/minmax.h>
> >   #include <linux/module.h>
> >   #include <linux/slab.h>
> >   #include <linux/uaccess.h>
> > +static unsigned int led_mc_get_max_intensity(struct led_classdev_mc *mcled_cdev, size_t index)
> > +{
> > +	unsigned int max_intensity;
> > +
> > +	/* The maximum global brightness value might still be changed by
> > +	 * led_classdev_register_ext() using devicetree properties. This
> > +	 * prevents us from changing subled_info[X].max_intensity when
> > +	 * registering a multicolor LED class device, so we have to do
> > +	 * this during runtime.
> > +	 */
> > +	max_intensity = mcled_cdev->subled_info[index].max_intensity;
> > +	if (max_intensity)
> > +		return max_intensity;
> > +
> > +	return mcled_cdev->led_cdev.max_brightness;
> > +}
> > +
> >   int led_mc_calc_color_components(struct led_classdev_mc *mcled_cdev,
> >   				 enum led_brightness brightness)
> >   {
> > @@ -27,6 +45,27 @@ int led_mc_calc_color_components(struct led_classdev_mc *mcled_cdev,
> >   }
> >   EXPORT_SYMBOL_GPL(led_mc_calc_color_components);
> > +static ssize_t multi_max_intensity_show(struct device *dev,
> > +					struct device_attribute *intensity_attr, char *buf)
> > +{
> > +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
> > +	struct led_classdev_mc *mcled_cdev = lcdev_to_mccdev(led_cdev);
> > +	unsigned int max_intensity;
> > +	int len = 0;
> > +	int i;
> > +
> > +	for (i = 0; i < mcled_cdev->num_colors; i++) {
> > +		max_intensity = led_mc_get_max_intensity(mcled_cdev, i);
> > +		len += sysfs_emit_at(buf, len, "%u", max_intensity);
> > +		if (i < mcled_cdev->num_colors - 1)
> > +			len += sprintf(buf + len, " ");
> > +	}
> > +
> > +	buf[len++] = '\n';
> > +	return len;
> > +}
> > +static DEVICE_ATTR_RO(multi_max_intensity);
> > +
> >   static ssize_t multi_intensity_store(struct device *dev,
> >   				struct device_attribute *intensity_attr,
> >   				const char *buf, size_t size)
> > @@ -35,6 +74,7 @@ static ssize_t multi_intensity_store(struct device *dev,
> >   	struct led_classdev_mc *mcled_cdev = lcdev_to_mccdev(led_cdev);
> >   	int nrchars, offset = 0;
> >   	unsigned int intensity_value[LED_COLOR_ID_MAX];
> > +	unsigned int max_intensity;
> >   	int i;
> >   	ssize_t ret;
> > @@ -56,8 +96,10 @@ static ssize_t multi_intensity_store(struct device *dev,
> >   		goto err_out;
> >   	}
> > -	for (i = 0; i < mcled_cdev->num_colors; i++)
> > -		mcled_cdev->subled_info[i].intensity = intensity_value[i];
> > +	for (i = 0; i < mcled_cdev->num_colors; i++) {
> > +		max_intensity = led_mc_get_max_intensity(mcled_cdev, i);
> > +		mcled_cdev->subled_info[i].intensity = min(intensity_value[i], max_intensity);
> > +	}
> >   	if (!test_bit(LED_BLINK_SW, &led_cdev->work_flags))
> >   		led_set_brightness(led_cdev, led_cdev->brightness);
> > @@ -111,6 +153,7 @@ static ssize_t multi_index_show(struct device *dev,
> >   static DEVICE_ATTR_RO(multi_index);
> >   static struct attribute *led_multicolor_attrs[] = {
> > +	&dev_attr_multi_max_intensity.attr,
> >   	&dev_attr_multi_intensity.attr,
> >   	&dev_attr_multi_index.attr,
> >   	NULL,
> > diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
> > index e2a9c8592953..69c3550f1a31 100644
> > --- a/drivers/leds/leds-lp50xx.c
> > +++ b/drivers/leds/leds-lp50xx.c
> > @@ -525,6 +525,7 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
> >   			}
> >   			mc_led_info[multi_index].color_index = color_id;
> > +			mc_led_info[multi_index].max_intensity = 255;
> >   			num_colors++;
> >   		}
> > diff --git a/drivers/leds/rgb/leds-ncp5623.c b/drivers/leds/rgb/leds-ncp5623.c
> > index 85d6be6fff2b..f2528f06507d 100644
> > --- a/drivers/leds/rgb/leds-ncp5623.c
> > +++ b/drivers/leds/rgb/leds-ncp5623.c
> > @@ -56,8 +56,7 @@ static int ncp5623_brightness_set(struct led_classdev *cdev,
> >   	for (int i = 0; i < mc_cdev->num_colors; i++) {
> >   		ret = ncp5623_write(ncp->client,
> >   				    NCP5623_PWM_REG(mc_cdev->subled_info[i].channel),
> > -				    min(mc_cdev->subled_info[i].intensity,
> > -					NCP5623_MAX_BRIGHTNESS));
> > +				    mc_cdev->subled_info[i].intensity);
> >   		if (ret)
> >   			return ret;
> >   	}
> > @@ -190,6 +189,7 @@ static int ncp5623_probe(struct i2c_client *client)
> >   			goto release_led_node;
> >   		subled_info[ncp->mc_dev.num_colors].channel = reg;
> > +		subled_info[ncp->mc_dev.num_colors].max_intensity = NCP5623_MAX_BRIGHTNESS;
> >   		subled_info[ncp->mc_dev.num_colors++].color_index = color_index;
> >   	}
> > diff --git a/include/linux/led-class-multicolor.h b/include/linux/led-class-multicolor.h
> > index db9f34c6736e..45469388bb1a 100644
> > --- a/include/linux/led-class-multicolor.h
> > +++ b/include/linux/led-class-multicolor.h
> > @@ -9,10 +9,31 @@
> >   #include <linux/leds.h>
> >   #include <dt-bindings/leds/common.h>
> > +/**
> > + * struct mc_subled - Color component description.
> > + * @color_index: Color ID.
> > + * @brightness: Scaled intensity.
> > + * @intensity: Current intensity.
> > + * @max_intensity: Maximum supported intensity value.
> > + * @channel: Channel index.
> > + *
> > + * Describes a color component of a multicolor LED. Many multicolor LEDs
> > + * do no support global brightness control in hardware, so they use
> > + * the brightness field in connection with led_mc_calc_color_components()
> > + * to perform the intensity scaling in software.
> > + * Such drivers should set max_intensity to 0 to signal the multicolor LED core
> > + * that the maximum global brightness of the LED class device should be used for
> > + * limiting incoming intensity values.
> > + *
> > + * Multicolor LEDs that do support global brightness control in hardware
> > + * should instead set max_intensity to the maximum intensity value supported
> > + * by the hardware for a given color component.
> > + */
> >   struct mc_subled {
> >   	unsigned int color_index;
> >   	unsigned int brightness;
> >   	unsigned int intensity;
> > +	unsigned int max_intensity;
> >   	unsigned int channel;
> >   };
> > @@ -53,7 +74,14 @@ int led_classdev_multicolor_register_ext(struct device *parent,
> >    */
> >   void led_classdev_multicolor_unregister(struct led_classdev_mc *mcled_cdev);
> > -/* Calculate brightness for the monochrome LED cluster */
> > +/**
> > + * led_mc_calc_color_components() - Calculates component brightness values of a LED cluster.
> > + * @mcled_cdev - Multicolor LED class device of the LED cluster.
> > + * @brightness - Global brightness of the LED cluster.
> > + *
> > + * Calculates the brightness values for each color component of a monochrome LED cluster,
> > + * see Documentation/leds/leds-class-multicolor.rst for details.
> > + */
> >   int led_mc_calc_color_components(struct led_classdev_mc *mcled_cdev,
> >   				 enum led_brightness brightness);
> 
> 

-- 
Lee Jones [李琼斯]

