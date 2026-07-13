Return-Path: <linux-leds+bounces-9076-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id P+lMKVNMVWoqmgAAu9opvQ
	(envelope-from <linux-leds+bounces-9076-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2026 22:36:35 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2C074F144
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2026 22:36:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=weissschuh.net header.s=mail header.b=Pb+mw8M1;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9076-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-9076-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=weissschuh.net;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1768530268BE
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2026 20:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62FF135DA43;
	Mon, 13 Jul 2026 20:36:33 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA6335CB66;
	Mon, 13 Jul 2026 20:36:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783974993; cv=none; b=nnIWIRjH45vXb7TKvhGvVR8KgMGkd8gdOZb4cw9na9Lg1oaX2rLPFgEfjgYcqzi5Kq6R57HIGvg8QjjutowASr8oa6vujT3gVKYT0TVkJp9bdbpEpn8J/wY6JMOqiEzrEAmxKzJWtq2fpAbCcPr5j+FsXzHqDifhL93hP9NQWAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783974993; c=relaxed/simple;
	bh=bnB/Rj10CeHD8dDw/g2YNp+SsOr/qZj71Gb2lV0xrbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PcaPvgIXTk/1sSI/7vSUPZvEUjM7OFXiJCnwOObqI9EW+Ik5LLxqtYyvq0M6zPZHWUbE0lP7OPDclVrglSdl+wgCnYT3dhBF6Jp0R2jqIHrbKWwopMNtQbbpWpHxQoAFZiC+t6K4T2s/REg7qLaVVnb0UbVxZDUhcispAi/Vo0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Pb+mw8M1; arc=none smtp.client-ip=159.69.126.157
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1783974988;
	bh=bnB/Rj10CeHD8dDw/g2YNp+SsOr/qZj71Gb2lV0xrbw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pb+mw8M19m10mggqJHy7wMtpZ4G8kvuFi4RBEqrsDJOcCqmVNaPh0gFsBBsMwwlPf
	 ylfYc5FhbbWjjPF9x6CXuo3uxUlkAUkAE1dA1vS+gEZKVUc6K59os7SknnOOdmsN2Z
	 S2soIQVNbD/IH7Dc/XmuVr/Dd2NVZl8RmSrrXW0s=
Date: Mon, 13 Jul 2026 22:36:28 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Rong Zhang <i@rong.moe>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Derek J. Clark" <derekjohn.clark@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Ike Panhc <ikepanhc@gmail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, 
	Vishnu Sankar <vishnuocv@gmail.com>, Vishnu Sankar <vsankar@lenovo.com>, linux-leds@vger.kernel.org, 
	netdev@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH RFC v2 5/9] leds: Add trigger_may_offload attribute
Message-ID: <b36aa937-b100-4fa3-bbc9-631c4c39ba40@t-8ch.de>
References: <20260618-leds-trigger-hw-changed-v2-0-c28c44053cf3@rong.moe>
 <20260618-leds-trigger-hw-changed-v2-5-c28c44053cf3@rong.moe>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618-leds-trigger-hw-changed-v2-5-c28c44053cf3@rong.moe>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-9076-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[linux@weissschuh.net,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS(0.00)[m:i@rong.moe,m:lee@kernel.org,m:pavel@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:bleung@chromium.org,m:groeck@chromium.org,m:kabel@kernel.org,m:mpearson-lenovo@squebb.ca,m:derekjohn.clark@gmail.com,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:ikepanhc@gmail.com,m:andrew+netdev@lunn.ch,m:kuba@kernel.org,m:vishnuocv@gmail.com,m:vsankar@lenovo.com,m:linux-leds@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:chrome-platform@lists.linux.dev,m:platform-driver-x86@vger.kernel.org,m:derekjohnclark@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,chromium.org,squebb.ca,gmail.com,linux.intel.com,lunn.ch,lenovo.com,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,rong.moe:email,t-8ch.de:mid,weissschuh.net:from_mime,weissschuh.net:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0E2C074F144

On 2026-06-18 00:47:59+0800, Rong Zhang wrote:
> There are multiple triggers implementing hardware control. Only "netdev"
> provides a custom attribute to determine if it's offloaded to hardware
> (i.e., in hardware control). For other triggers, there is no obvious way
> for userspace to determine the trigger state programmatically. Moreover,
> userspace can't query if an LED device supports hardware control or
> identifies these triggers.
> 
> Add a new attribute "trigger_may_offload" to the LED core, so that
> userspace can determine:
> 
> - if the LED device supports hardware control (supported => visible)
> - which trigger is the hardware control trigger selected by the LED
>   device
> - if the trigger is selected ("<foo_trigger>")
> - if the trigger is offloaded ("[foo_trigger]")
> 
> Note: the documentation describes the attribute as "returning a list"
> despite the LED core currently only supports one hardware control
> trigger per LED device. This is intentional to make the attribute
> extensible in the future without breaking userspace.

Maybe also mention that the old 'offloaded' attribute is deprecated.
However, does it really need to be deprecated?

> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
>  .../ABI/obsolete/sysfs-class-led-trigger-netdev    | 16 ++++++++
>  Documentation/ABI/testing/sysfs-class-led          | 22 +++++++++++
>  .../ABI/testing/sysfs-class-led-trigger-netdev     | 13 -------
>  Documentation/leds/leds-class.rst                  |  8 ++++
>  drivers/leds/led-class.c                           | 23 +++++++++++
>  drivers/leds/led-triggers.c                        | 45 ++++++++++++++++++++++
>  drivers/leds/leds.h                                |  2 +
>  drivers/leds/trigger/ledtrig-netdev.c              |  2 +
>  8 files changed, 118 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/ABI/obsolete/sysfs-class-led-trigger-netdev b/Documentation/ABI/obsolete/sysfs-class-led-trigger-netdev
> new file mode 100644
> index 000000000000..8d2fbfaf50c3
> --- /dev/null
> +++ b/Documentation/ABI/obsolete/sysfs-class-led-trigger-netdev
> @@ -0,0 +1,16 @@
> +What:		/sys/class/leds/<led>/offloaded
> +Date:		June 2026
> +KernelVersion:	7.3
> +Contact:	linux-leds@vger.kernel.org
> +Description:
> +		Communicate whether the LED trigger modes are offloaded to
> +		hardware or whether software fallback is used.
> +
> +		If 0, the LED is using software fallback to blink.
> +
> +		If 1, the LED blinking in requested mode is offloaded to
> +		hardware.
> +
> +		/sys/class/leds/<led>/trigger_may_offload provides a generic
> +		method to query the offloaded state of supported triggers,
> +		superseding this attribute.
> diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/ABI/testing/sysfs-class-led
> index 0313b82644f2..edd5a9a74dfd 100644
> --- a/Documentation/ABI/testing/sysfs-class-led
> +++ b/Documentation/ABI/testing/sysfs-class-led
> @@ -78,6 +78,28 @@ Description:
>  		(which would often be configured in the device tree for the
>  		hardware).
>  
> +What:		/sys/class/leds/<led>/trigger_may_offload
> +Date:		June 2026
> +KernelVersion:	7.3
> +Contact:	linux-leds@vger.kernel.org
> +Description:
> +		Names and states of triggers that may be offloaded to hardware.
> +		Such triggers are also called "hw control trigger" in some
> +		context.
> +
> +		Only exists when the LED supports trigger offload.
> +
> +		Reading this file returns a list of triggers that are capable to
> +		be offloaded. The optional brackets around the trigger name
> +		indicate the state of the current trigger:
> +
> +		- `foo_trigger`: the trigger is not selected.
> +		- `<foo_trigger>`: the trigger is selected, but falls back to
> +		  software blink for some reason (e.g., incompatible trigger
> +		  parameters)
> +		- `[foo_trigger]`: the trigger is selected and offloaded to
> +		  hardware.
> +
>  What:		/sys/class/leds/<led>/inverted
>  Date:		January 2011
>  KernelVersion:	2.6.38
> diff --git a/Documentation/ABI/testing/sysfs-class-led-trigger-netdev b/Documentation/ABI/testing/sysfs-class-led-trigger-netdev
> index ed46b37ab8a2..396d37a4b820 100644
> --- a/Documentation/ABI/testing/sysfs-class-led-trigger-netdev
> +++ b/Documentation/ABI/testing/sysfs-class-led-trigger-netdev
> @@ -62,19 +62,6 @@ Description:
>  		When offloaded is true, the blink interval is controlled by
>  		hardware and won't reflect the value set in interval.
>  
> -What:		/sys/class/leds/<led>/offloaded
> -Date:		Jun 2023
> -KernelVersion:	6.5
> -Contact:	linux-leds@vger.kernel.org
> -Description:
> -		Communicate whether the LED trigger modes are offloaded to
> -		hardware or whether software fallback is used.
> -
> -		If 0, the LED is using software fallback to blink.
> -
> -		If 1, the LED blinking in requested mode is offloaded to
> -		hardware.
> -
>  What:		/sys/class/leds/<led>/link_10
>  Date:		Jun 2023
>  KernelVersion:	6.5
> diff --git a/Documentation/leds/leds-class.rst b/Documentation/leds/leds-class.rst
> index 84665200a88d..41342ecb5f6b 100644
> --- a/Documentation/leds/leds-class.rst
> +++ b/Documentation/leds/leds-class.rst
> @@ -179,6 +179,9 @@ ops and needs to declare specific support for the supported triggers.
>  
>  With hw control we refer to the LED driven by hardware.
>  
> +A sysfs attribute `trigger_may_offload` is provided for userspace to
> +query supported triggers and their states.
> +
>  LED driver must define the following value to support hw control:
>  
>      - hw_control_trigger:
> @@ -240,6 +243,11 @@ LED trigger must implement the following API to support hw control:
>                  return a boolean indicating if the trigger is offloaded to
>                  hardware.
>  
> +                If an LED driver specifies a hw control trigger but the
> +                latter doesn't implement this callback, a dev_err_once will
> +                be emitted and the LED trigger will be assumed to be not
> +                offloaded.

Not sure if this needs to be documented.
I would make this optional initally and enforce it after all the drivers
have been changed in the series.

> +
>  LED driver can activate additional modes by default to workaround the
>  impossibility of supporting each different mode on the supported trigger.
>  Examples are hardcoding the blink speed to a set interval, enable special
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 9e14ae588f78..0ac80b93b8b5 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -90,8 +90,31 @@ static const struct bin_attribute *const led_trigger_bin_attrs[] = {
>  	&bin_attr_trigger,
>  	NULL,
>  };
> +
> +static DEVICE_ATTR(trigger_may_offload, 0444, led_trigger_may_offload_show, NULL);

DEVICE_ATTR_RO()

> +static struct attribute *led_trigger_attrs[] = {
> +	&dev_attr_trigger_may_offload.attr,
> +	NULL,

No comma after the sentinel.

> +};
> +
> +static umode_t led_trigger_is_visible(struct kobject *kobj,
> +				      struct attribute *attr,
> +				      int idx)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
> +
> +	if (attr == &dev_attr_trigger_may_offload.attr &&
> +	    !led_cdev->hw_control_trigger)

Can be a single line.

> +		return 0;
> +
> +	return attr->mode;
> +}
> +
>  static const struct attribute_group led_trigger_group = {
>  	.bin_attrs = led_trigger_bin_attrs,
> +	.attrs = led_trigger_attrs,
> +	.is_visible = led_trigger_is_visible,
>  };
>  #endif
>  
> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> index b1223218bda1..c43229d9c4c1 100644
> --- a/drivers/leds/led-triggers.c
> +++ b/drivers/leds/led-triggers.c
> @@ -313,6 +313,51 @@ void led_trigger_set_default(struct led_classdev *led_cdev)
>  }
>  EXPORT_SYMBOL_GPL(led_trigger_set_default);
>  
> +/*
> + * Caller must ensure led_cdev->trigger_lock held,

Use lockdep_assert_held() to document and validate locking invariants.

> + * and led_cdev->trigger->name must match led_cdev->hw_control_trigger.
> + */
> +static bool led_trigger_get_offloaded(struct led_classdev *led_cdev)
> +{
> +	if (likely(led_cdev->trigger->offloaded))
> +		return led_cdev->trigger->offloaded(led_cdev);
> +
> +	dev_err_once(led_cdev->dev,
> +		     "hw control trigger %s doesn't implement offloaded(), this is a bug\n",
> +		     led_cdev->trigger->name);
> +	return false;
> +}
> +
> +ssize_t led_trigger_may_offload_show(struct device *dev,
> +				     struct device_attribute *attr, char *buf)
> +{
> +	struct led_classdev *led_cdev = dev_get_drvdata(dev);
> +	bool hit, offloaded = false;
> +	struct led_trigger *trig;
> +	int len;
> +
> +	mutex_lock(&led_cdev->led_access);
> +	down_read(&led_cdev->trigger_lock);

guard()?

> +
> +	trig = led_cdev->trigger;
> +
> +	hit = trig && !strcmp(led_cdev->hw_control_trigger, trig->name);
> +	if (hit)
> +		offloaded = led_trigger_get_offloaded(led_cdev);
> +
> +	/* [offloaded] <active_but_not_offloaded> inactive */
> +	len = sysfs_emit(buf, "%s%s%s\n",
> +			 offloaded ? "[" : (hit ? "<" : ""),
> +			 led_cdev->hw_control_trigger,
> +			 offloaded ? "]" : (hit ? ">" : ""));
> +
> +	up_read(&led_cdev->trigger_lock);
> +	mutex_unlock(&led_cdev->led_access);
> +
> +	return len;
> +}
> +EXPORT_SYMBOL_GPL(led_trigger_may_offload_show);
> +
>  /* LED Trigger Interface */
>  
>  int led_trigger_register(struct led_trigger *trig)
> diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
> index bee46651e068..9177e098989b 100644
> --- a/drivers/leds/leds.h
> +++ b/drivers/leds/leds.h
> @@ -27,6 +27,8 @@ ssize_t led_trigger_read(struct file *filp, struct kobject *kobj,
>  ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
>  			const struct bin_attribute *bin_attr, char *buf,
>  			loff_t pos, size_t count);
> +ssize_t led_trigger_may_offload_show(struct device *dev,
> +				     struct device_attribute *attr, char *buf);
>  
>  extern struct rw_semaphore leds_list_lock;
>  extern struct list_head leds_list;
> diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
> index a26109ca4b1c..21f22eea4ab8 100644
> --- a/drivers/leds/trigger/ledtrig-netdev.c
> +++ b/drivers/leds/trigger/ledtrig-netdev.c
> @@ -487,6 +487,8 @@ static ssize_t offloaded_show(struct device *dev,
>  {
>  	struct led_netdev_data *trigger_data = led_trigger_get_drvdata(dev);
>  
> +	dev_warn_once(dev, "offloaded attribute has been deprecated, see trigger_may_offload.\n");
> +
>  	return sprintf(buf, "%d\n", trigger_data->hw_control);
>  }
>  
> 
> -- 
> 2.53.0
> 

