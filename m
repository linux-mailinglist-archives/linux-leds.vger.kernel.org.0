Return-Path: <linux-leds+bounces-7232-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBDJBXYWsGknfgIAu9opvQ
	(envelope-from <linux-leds+bounces-7232-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 10 Mar 2026 14:02:46 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B27224F627
	for <lists+linux-leds@lfdr.de>; Tue, 10 Mar 2026 14:02:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 52E54318F341
	for <lists+linux-leds@lfdr.de>; Tue, 10 Mar 2026 12:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADE244219F7;
	Tue, 10 Mar 2026 12:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MLnbEsoq"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879674218B4;
	Tue, 10 Mar 2026 12:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773144083; cv=none; b=T4gP7YCZTgiWX1MAiNjYn8QdDpoHmd0SAj/jdRY6iKa2PDIbjUE4InU8/eb+e/RpRaT+vKSPE9fInqYH9vA14ewjWa9PjrWAG+IGy5ah1m35Qzn0zjy8Rq6EDlKY2oSfRa64dTsvAkWVK0LUQTHpyPsoynPtbo/bk9QZqcNDSbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773144083; c=relaxed/simple;
	bh=nX4GFlS7Ni6Bek7pIiBiRr7Oo8oPZgdFTHwAGugHpVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LVe7cSdEbwZA6Jht9daSgetJPCW9ML2rrxupamaK3NV0PpS05iBRrvsLLI9AduiJKcV58und8zz1nCC0QXYV4e5KZFntxpCNK19JE0+nkcklI9IsLe/OoOHe7QpoQjm+p18052rVxlPAlk5uBYH/jvw+q+iP4A+/K9PliZc75BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MLnbEsoq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B556AC2BC86;
	Tue, 10 Mar 2026 12:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773144083;
	bh=nX4GFlS7Ni6Bek7pIiBiRr7Oo8oPZgdFTHwAGugHpVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MLnbEsoqYe5qelfPHe3UykmjiVJIgvLVC0hIikqjaIkedf7ztMnEM15m95zTKVHzi
	 x7LJaHe/9g0UxfDtOju+/t7CM7VfaQgJYOPktJOfBCR+823kkzg5Q2e1E23+tc8NiF
	 rFTb4bxQPT3QaV36mMYaYDbJacgqDXTcmuUsnXTh/v3Yb/PjyjODXkwcqJqgM2a6xm
	 FpLSd3ipJNZwiD5ynnhWoIspP8NKOt4WvJSDMi52eUyZLw+e18aSDm6jALrkWB93TG
	 GQDjEl4tST4BEQtyqaXr04yyTVJMmYukoW3jLMgrQt0cb6yMrSmsEDJ2wdxpc4zFyG
	 zfJhaeQCrU5Ug==
Date: Tue, 10 Mar 2026 12:01:16 +0000
From: Lee Jones <lee@kernel.org>
To: Rong Zhang <i@rong.moe>
Cc: Pavel Machek <pavel@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Ike Panhc <ikepanhc@gmail.com>, Vishnu Sankar <vishnuocv@gmail.com>,
	vsankar@lenovo.com, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, chrome-platform@lists.linux.dev,
	platform-driver-x86@vger.kernel.org
Subject: Re: [RFC PATCH 1/9] leds: Load trigger modules on-demand if used as
 hw control trigger
Message-ID: <20260310120116.GI183676@google.com>
References: <20260227190617.271388-1-i@rong.moe>
 <20260227190617.271388-2-i@rong.moe>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260227190617.271388-2-i@rong.moe>
X-Rspamd-Queue-Id: 1B27224F627
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7232-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,weissschuh.net,chromium.org,squebb.ca,gmail.com,linux.intel.com,lenovo.com,vger.kernel.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,rong.moe:email]
X-Rspamd-Action: no action

On Sat, 28 Feb 2026, Rong Zhang wrote:

> In the following patches, we are about to support hardware initiated

Let's not talk about other commits.  Only tell us what's happening here.

> trigger transitions to/from the device's hw control trigger. In case
> the LED hardware switches itself to hw control mode, hw control trigger
> must be loaded before so that the transition can be processed.
> 
> Load the trigger module specified by hw_control_trigger, so that
> hardware initiated trigger transitions can be processed when the hw

"hardware"

> control trigger is compiled as a module.
> 
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
>  drivers/leds/led-class.c    |  1 +
>  drivers/leds/led-triggers.c | 33 +++++++++++++++++++++++++++++++++
>  drivers/leds/leds.h         |  1 +
>  3 files changed, 35 insertions(+)
> 
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index d34a194535604..0fa45f22246e3 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -576,6 +576,7 @@ int led_classdev_register_ext(struct device *parent,
>  
>  #ifdef CONFIG_LEDS_TRIGGERS
>  	led_trigger_set_default(led_cdev);
> +	led_load_hw_control_trigger(led_cdev);

led_trigger_load_hw_control

>  #endif
>  
>  	mutex_unlock(&led_cdev->led_access);
> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> index b1223218bda11..3066bc91a5f94 100644
> --- a/drivers/leds/led-triggers.c
> +++ b/drivers/leds/led-triggers.c
> @@ -313,6 +313,39 @@ void led_trigger_set_default(struct led_classdev *led_cdev)
>  }
>  EXPORT_SYMBOL_GPL(led_trigger_set_default);
>  
> +static inline bool led_match_hw_control_trigger(struct led_classdev *led_cdev,
> +						struct led_trigger *trig)
> +{
> +	return (!strcmp(led_cdev->hw_control_trigger, trig->name) &&
> +		trigger_relevant(led_cdev, trig));


This is ugly.  Break it out and provide some commentary.

> +}
> +
> +void led_load_hw_control_trigger(struct led_classdev *led_cdev)
> +{
> +	struct led_trigger *trig;
> +	bool found = false;
> +
> +	if (!led_cdev->hw_control_trigger)
> +		return;
> +
> +	/* default_trigger is handled by led_trigger_set_default(). */

Sentences start with uppercase chars.

> +	if (led_cdev->default_trigger &&
> +	    !strcmp(led_cdev->default_trigger, led_cdev->hw_control_trigger))
> +		return;

Do you need to check default_trigger?

strcmp() should be able to handle empty strings.

> +
> +	down_read(&triggers_list_lock);
> +	list_for_each_entry(trig, &trigger_list, next_trig) {
> +		found = led_match_hw_control_trigger(led_cdev, trig);
> +		if (found)
> +			break;
> +	}
> +	up_read(&triggers_list_lock);
> +
> +	if (!found)
> +		request_module_nowait("ledtrig:%s", led_cdev->hw_control_trigger);
> +}
> +EXPORT_SYMBOL_GPL(led_load_hw_control_trigger);
> +
>  /* LED Trigger Interface */
>  
>  int led_trigger_register(struct led_trigger *trig)
> diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
> index bee46651e068f..e85afd4d04fd0 100644
> --- a/drivers/leds/leds.h
> +++ b/drivers/leds/leds.h
> @@ -21,6 +21,7 @@ void led_init_core(struct led_classdev *led_cdev);
>  void led_stop_software_blink(struct led_classdev *led_cdev);
>  void led_set_brightness_nopm(struct led_classdev *led_cdev, unsigned int value);
>  void led_set_brightness_nosleep(struct led_classdev *led_cdev, unsigned int value);
> +void led_load_hw_control_trigger(struct led_classdev *led_cdev);
>  ssize_t led_trigger_read(struct file *filp, struct kobject *kobj,
>  			const struct bin_attribute *attr, char *buf,
>  			loff_t pos, size_t count);
> -- 
> 2.51.0
> 

-- 
Lee Jones [李琼斯]

