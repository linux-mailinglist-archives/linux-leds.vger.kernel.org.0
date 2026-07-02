Return-Path: <linux-leds+bounces-8829-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0HpFK41BRmqzMwsAu9opvQ
	(envelope-from <linux-leds+bounces-8829-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 12:46:37 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4653C6F6225
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 12:46:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=F5naeyss;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8829-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8829-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6F1D0301A101
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 10:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB04C3A873A;
	Thu,  2 Jul 2026 10:45:16 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806333A9861;
	Thu,  2 Jul 2026 10:45:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782989116; cv=none; b=qRIEwP4/YI2vmrJCe3ybu1ECd3kB7YpKTtIsKNxEpcJXPeu636xS/vR7WJhFWrnV+9meuUibR4ZJq+UUqt15tOfkETFzkgIskq3fAiLRlpMtcSM8uJXQeQwPklJed/S5+gQY3+czAu9zU9Hy5+DJxwMev57pX+3TdjEMgP+Vs2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782989116; c=relaxed/simple;
	bh=3NneBBleRP0nq+F3t1BNyohmj2uvqhmH0DV22CPVyj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BTkQsvsO6DkP0cr/zNbL9/hhRf8t1Ri8Apk0liY/ExNBW/6Y8vuyeHsoC50J3eSUASuiInuInWwB7wspMsbR+o4QPzEoRoRztQV71aTo0TubMkduzdC/CmEPpjSljy3ZjQiOYY74jt41tr8p0AytO0d6svx9hGCSaXKTDtOslus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F5naeyss; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D80B21F000E9;
	Thu,  2 Jul 2026 10:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782989115;
	bh=rWEH3UEpZiTc622864CoktOdJp9DODCAffj/VJOaNBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F5naeyssM/8+BL+MdigXcvrNE1PonCqowok5mo6jpL1aMpHbKm1hzVls6m6tMtXvW
	 xEPFT+fbn8PhZ+AxVSvkdH3uVd7C8IqboM2Pt2eZm3iJKiWcW6ubsjHEpdKAyTyuiH
	 JTGCZrWxInJ9shglw9bbCA7sqDa5CgdKs12DprldrcXojkKqfwn/jbJ3m3ftH5RVJr
	 dTgSNGHaucQs7Hmt0jNNDQ/Eg85SqRfFSYVgkj31y22aVGElPIJO02Jps87Zs50nR0
	 wsbBOfB61DLE2vzWbENnMZp9wn22pfItqfc7EeW83iRkLn1Bb6Gafe1YGZmYxCSXMn
	 dSsT0L6UOLNMA==
Date: Thu, 2 Jul 2026 11:45:10 +0100
From: Lee Jones <lee@kernel.org>
To: Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Andreas Werner <andreas.werner@men.de>
Cc: Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
	Andreas Werner <andreas.werner@men.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shreshtha Kumar Sahu <shreshthakumar.sahu@stericsson.com>,
	Bryan Wu <cooloney@gmail.com>, linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] leds: menf21bmc: use brightness_set_blocking for
 sleepable callback
Message-ID: <20260702104510.GI2108533@google.com>
References: <20260615145756.1019184-1-runyu.xiao@seu.edu.cn>
 <20260615145756.1019184-3-runyu.xiao@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615145756.1019184-3-runyu.xiao@seu.edu.cn>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8829-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:runyu.xiao@seu.edu.cn,m:andreas.werner@men.de,m:pavel@kernel.org,m:linux-leds@vger.kernel.org,m:akpm@linux-foundation.org,m:shreshthakumar.sahu@stericsson.com,m:cooloney@gmail.com,m:linux-kernel@vger.kernel.org,m:jianhao.xu@seu.edu.cn,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,men.de,linux-foundation.org,stericsson.com,gmail.com,seu.edu.cn];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-leds];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,seu.edu.cn:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4653C6F6225

Andreas, any thoughts?

On Mon, 15 Jun 2026, Runyu Xiao wrote:

> menf21bmc_led_set() serializes access with a mutex and performs I2C
> transfers, but the driver exposes it through brightness_set.  That
> mismatches the LED core callback contract for atomic callers.
> 
> This issue was found by our static analysis tool and then manually
> reviewed against the current tree.
> 
> A minimal Lockdep reproducer that keeps the original registration and
> call chain is enough to trigger the warning: menf21bmc_led_probe()
> still publishes menf21bmc_led_set() as brightness_set,
> led_trigger_event_atomic() invokes it under spin_lock_irqsave(), and
> the callback immediately tries mutex_lock(&led_lock) before reaching
> its I2C accesses.
> 
> Lockdep reports:
> 
>   BUG: sleeping function called from invalid context
>   __mutex_lock+0x4f/0xd20
>   menf21bmc_led_set+0x15/0x49 [vuln_msv]
>   [ BUG: Invalid wait context ]
>   ... (led_lock#2) ... at: menf21bmc_led_set+0x15/0x49 [vuln_msv]
> 
> Convert the driver to brightness_set_blocking and return the transport
> status to the LED core.
> 
> Fixes: 38433639af91 ("leds: leds-menf21bmc: Introduce MEN 14F021P00 BMC LED driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
> ---
> Notes:
>   - Validated with a grounded Lockdep PoC that preserves the
>     menf21bmc_led_probe() brightness_set registration and the
>     led_trigger_event_atomic() -> menf21bmc_led_set() ->
>     mutex_lock(&led_lock) path.
>   - checkpatch.pl --strict: clean.
>   - Not tested on MEN 14F021P00 BMC hardware.
> 
>  drivers/leds/leds-menf21bmc.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/leds/leds-menf21bmc.c b/drivers/leds/leds-menf21bmc.c
> index 6b1b47160602..da476fe6ed2c 100644
> --- a/drivers/leds/leds-menf21bmc.c
> +++ b/drivers/leds/leds-menf21bmc.c
> @@ -49,28 +49,33 @@ static struct menf21bmc_led leds[] = {
>  
>  static DEFINE_MUTEX(led_lock);
>  
> -static void
> -menf21bmc_led_set(struct led_classdev *led_cdev, enum led_brightness value)
> +static int
> +menf21bmc_led_set_blocking(struct led_classdev *led_cdev,
> +			   enum led_brightness value)
>  {
>  	int led_val;
> +	int ret = 0;
>  	struct menf21bmc_led *led = container_of(led_cdev,
>  					struct menf21bmc_led, cdev);
>  
>  	mutex_lock(&led_lock);
>  	led_val = i2c_smbus_read_byte_data(led->i2c_client,
>  					   BMC_CMD_LED_GET_SET);
> -	if (led_val < 0)
> +	if (led_val < 0) {
> +		ret = led_val;
>  		goto err_out;
> +	}
>  
>  	if (value == LED_OFF)
>  		led_val &= ~led->led_bit;
>  	else
>  		led_val |= led->led_bit;
>  
> -	i2c_smbus_write_byte_data(led->i2c_client,
> -				  BMC_CMD_LED_GET_SET, led_val);
> +	ret = i2c_smbus_write_byte_data(led->i2c_client,
> +					BMC_CMD_LED_GET_SET, led_val);
>  err_out:
>  	mutex_unlock(&led_lock);
> +	return ret;
>  }
>  
>  static int menf21bmc_led_probe(struct platform_device *pdev)
> @@ -81,7 +86,8 @@ static int menf21bmc_led_probe(struct platform_device *pdev)
>  
>  	for (i = 0; i < ARRAY_SIZE(leds); i++) {
>  		leds[i].cdev.name = leds[i].name;
> -		leds[i].cdev.brightness_set = menf21bmc_led_set;
> +		leds[i].cdev.brightness_set_blocking =
> +			menf21bmc_led_set_blocking;
>  		leds[i].i2c_client = i2c_client;
>  		ret = devm_led_classdev_register(&pdev->dev, &leds[i].cdev);
>  		if (ret < 0) {
> -- 
> 2.34.1

-- 
Lee Jones

