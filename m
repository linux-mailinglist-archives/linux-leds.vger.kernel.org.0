Return-Path: <linux-leds+bounces-7403-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNbnAaEzvGl3uwIAu9opvQ
	(envelope-from <linux-leds+bounces-7403-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 19 Mar 2026 18:34:25 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 674F02D013E
	for <lists+linux-leds@lfdr.de>; Thu, 19 Mar 2026 18:34:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A31613000FD9
	for <lists+linux-leds@lfdr.de>; Thu, 19 Mar 2026 17:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7333B38B157;
	Thu, 19 Mar 2026 17:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EkE4BLdK"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B92234C80D;
	Thu, 19 Mar 2026 17:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773941659; cv=none; b=UUhl3S5EkYAFhZwuInkkHRxMgl0Gn1aTRT0+PNdgGEVCBfzpzpettKsCnB4rNJEBDXtF4PP+vKYt3h+cpJfJQ+jvcLP8wcRvlz3xEdNRi5Bq871SNYbS9wecaRUX6fy4rhvh8J0KsE6aVUncA3g5OUHg61ZFJuWI3yN30vNg4jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773941659; c=relaxed/simple;
	bh=+bCydnem6VU/eYYPyGIj6vTJL/D8aGn+mxUVvBoGSy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tmC63cAOKf2ucasbL8qD3HIJxAexY1fB5lZleQWuzCd9W3DF/VAiTvjhrN5rEelluJuSlVImgjTetpxRhTRnXzm8dNlUtHH3eo7s1bTrraHnX5TTZgo88cwN41u07tEP8/IStNq4uANzeSj4HHd0fc8hwC2NRbk1aq3Z4WrRzjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EkE4BLdK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85F19C2BCB0;
	Thu, 19 Mar 2026 17:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773941659;
	bh=+bCydnem6VU/eYYPyGIj6vTJL/D8aGn+mxUVvBoGSy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EkE4BLdKv3fISixPfZc0rsph4spEfhtoPNOzJK6AkPkWfmE8PHqGrZSeS2mBCyDnB
	 ebruPOLLj3ULj2TpZlIBvIsmRCqmONNB26/EM0MsmHGNWHjo7cj5PKtW7LlsaRBK6c
	 FK4nWkrYegq7SdKSI/0YEalLutiDvPy1+6VKPYWps4rEkgodFD9dXAne52ux5dQz8K
	 TgWdNFQh6+8Ow1l+cYTEGLp0kdqCZsbZsi5CKJ0O6k8q2MiMYN9z/OCEaMDN9N163l
	 Bqr8GxITb9Z3WfnW3oQVd10+KbxEdBzlBZKT3eK0oSQfIG/nKVHfGNFTH2oK3gy0Aa
	 hucpfC5z3EgNQ==
Date: Thu, 19 Mar 2026 17:34:14 +0000
From: Lee Jones <lee@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Pavel Machek <pavel@kernel.org>, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	linux-spi@vger.kernel.org
Subject: Re: [PATCH v2 1/2] led: lp5860: expose fault state via sysfs
Message-ID: <20260319173414.GA2902881@google.com>
References: <20260311-v6-19-topic-ti-lp5860-fault-v2-0-f9454910f009@pengutronix.de>
 <20260311-v6-19-topic-ti-lp5860-fault-v2-1-f9454910f009@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260311-v6-19-topic-ti-lp5860-fault-v2-1-f9454910f009@pengutronix.de>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7403-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,pengutronix.de:email]
X-Rspamd-Queue-Id: 674F02D013E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 11 Mar 2026, Steffen Trumtrar wrote:

> Return the fault state to the userspase via sysfs and allow to reset it.

"userspace" is misspelled here and in the subject line.

> 
> The LP5860 has a global fault state, that just indicates that a short or
> open fault was detected on any LED. This is exposed via 'fault_state'.
> 
> The 'fault_state_open' exposes the LED name and channel where an open
> condition was detected.
> 
> The 'fault_state_short' exposes the LED name and channel where a short
> condition was detected.
> 
> To: Mark Brown <broonie@kernel.org>
> Cc: linux-spi@vger.kernel.org

These should be below the --- marker.

> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>  Documentation/ABI/testing/sysfs-class-spi-lp5860 | 49 ++++++++++++++++++++++++

You're the first write driver documentation like this.

That has to tell you something.

>  1 file changed, 49 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-spi-lp5860 b/Documentation/ABI/testing/sysfs-class-spi-lp5860
> new file mode 100644
> index 0000000000000..31082bd78f51e
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-class-spi-lp5860
> @@ -0,0 +1,49 @@
> +What:           /sys/class/spi_master/spi<bus>/spi<bus>.<dev>/fault_state

I believe this path is incorrect. Attributes for an SPI slave device should
be under `/sys/bus/spi/devices/spi<bus>.<dev>/`, not under the master
device's class directory.

> +Date:           March 2026
> +KernelVersion:  7.0
> +Contact:        Steffen Trumtrar <kernel@pengutronix.de>

This is different to your sign-off address.

> +Description:
> +	Contains and sets the global fault state:
> +
> +	* 3: Open and short detected
> +	* 2: Open detected
> +	* 1: Short detected

Exposing a raw bitmask like this is not a good ABI. The sysfs convention is
"one value per file". It would be better to have separate read-only files
like `fault_short` and `fault_open` which would contain "1" if a fault is
active and "0" otherwise.

> +
> +	Can be cleared by writing the corresponding value back to fault_state.

This "write back what you read" mechanism is non-standard and racy. A
better approach is to provide a separate write-only `fault_clear` file, or
allow writing '0' to the individual fault files to clear them.

> +
> +	Example usage::
> +
> +		## Read
> +		# cat /sys/class/spi_master/spi<bus>/spi<bus>.<dev>/fault_state
> +		2
> +
> +		## Write
> +		# echo 2 > /sys/class/spi_master/spi<bus>/spi<bus>.<dev>/fault_state
> +
> +What:           /sys/class/spi_master/spi<bus>/spi<bus>.<dev>/fault_state_open
> +Date:           March 2026
> +KernelVersion:  7.0
> +Contact:        Steffen Trumtrar <kernel@pengutronix.de>
> +Description:
> +	Contains all LEDs and channels where an open condition was detected.

I'm also really confused by the cross-over here.

Are we documenting SPI behaviour or LED?

> +	The format is ledname:channel.
> +
> +	Example usage::
> +
> +		## Read
> +		# cat /sys/class/spi_master/spi<bus>/spi<bus>.<dev>/fault_state_open
> +		rgb1:0 rgb2:4
> +
> +What:           /sys/class/spi_master/spi<bus>/spi<bus>.<dev>/fault_state_short
> +Date:           March 2026
> +KernelVersion:  7.0
> +Contact:        Steffen Trumtrar <kernel@pengutronix.de>
> +Description:
> +	Contains all LEDs and channels where a short condition was detected.
> +	The format is ledname:channel.
> +
> +	Example usage::
> +
> +		## Read
> +		# cat /sys/class/spi_master/spi<bus>/spi<bus>.<dev>/fault_state_short
> +		rgb1:0 rgb2:4
> 
> -- 
> 2.51.0
> 

-- 
Lee Jones [李琼斯]

