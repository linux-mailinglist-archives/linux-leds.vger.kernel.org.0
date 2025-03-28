Return-Path: <linux-leds+bounces-4377-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F0DA7506D
	for <lists+linux-leds@lfdr.de>; Fri, 28 Mar 2025 19:31:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36238175529
	for <lists+linux-leds@lfdr.de>; Fri, 28 Mar 2025 18:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DC521DEFEE;
	Fri, 28 Mar 2025 18:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="L6ecz7+R"
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA58B1DB55D;
	Fri, 28 Mar 2025 18:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743186705; cv=none; b=lKV7md1ASXPqosykiB/KGBysl6xc45Q6yue4fha47goQ6Q2frbSOTXotkWSn5fviIilBSYvy0hTGnng2AR313DH22AyX/6lmV1ufI6qXRzbQGqGGkIlcJiN0EEIXP/311Orw/AY2b3TSYM14V0ORiUgxSDspSoxOHPQtgYgPJvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743186705; c=relaxed/simple;
	bh=TR1saKRDuDQdblIXdj0A2Q5UIlVFUIL7+Jhfp9MzVnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=avPus6bJ5QfU5SjYhcYFTAqhykcYec2+kyQM0kraHi0Lkfzc7phPSeDpo9VJPXDhTGIZyAiV7bCZ8lFv99mkE+z1HmAmhfP8i6ZpWIziCkp1btG3CHF+Y5v5oZC2zoBTovZdq3cR7E1nLA5Stxsn4EQq0l2CTk1hQfBnt6Wrdak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=L6ecz7+R; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1743186691;
	bh=TR1saKRDuDQdblIXdj0A2Q5UIlVFUIL7+Jhfp9MzVnA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L6ecz7+RynIQyM4l/A1T7+hyYkpE7mTX2CJEA8zpsASd3coB46Z0NyNFbWO2uKThr
	 LC17JcdPaLZOXfQmFtO0PyiHnOAixwGjAROPdqgjhfjdF+ltwn7e1LvlsxVpFXg1dB
	 wzC0wqgr4Uj6hIvOT4w/VxJrhbR40pu9jiNx3KQs=
Date: Fri, 28 Mar 2025 19:31:31 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@weissschuh.net>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, linux-leds@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] leds: Avoid -Wflex-array-member-not-at-end warning
Message-ID: <c051fd45-7eb0-465d-9e97-af294c453755@t-8ch.de>
References: <Z-azMlPnP7nPPJrY@kspp>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-azMlPnP7nPPJrY@kspp>

Hi Gustavo,

On 2025-03-28 08:33:22-0600, Gustavo A. R. Silva wrote:
> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
> getting ready to enable it, globally.
> 
> Use the `DEFINE_RAW_FLEX()` helper for an on-stack definition of
> a flexible structure where the size of the flexible-array member
> is known at compile-time, and refactor the rest of the code,
> accordingly.
> 
> So, with these changes, fix the following warning:
> 
> drivers/leds/leds-cros_ec.c:70:40: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/leds/leds-cros_ec.c | 26 +++++++++++---------------
>  1 file changed, 11 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/leds/leds-cros_ec.c b/drivers/leds/leds-cros_ec.c
> index 275522b81ea5..6eab0474f52d 100644
> --- a/drivers/leds/leds-cros_ec.c
> +++ b/drivers/leds/leds-cros_ec.c
> @@ -66,24 +66,20 @@ static int cros_ec_led_send_cmd(struct cros_ec_device *cros_ec,
>  				union cros_ec_led_cmd_data *arg)
>  {
>  	int ret;
> -	struct {
> -		struct cros_ec_command msg;
> -		union cros_ec_led_cmd_data data;
> -	} __packed buf = {
> -		.msg = {
> -			.version = 1,
> -			.command = EC_CMD_LED_CONTROL,
> -			.insize  = sizeof(arg->resp),
> -			.outsize = sizeof(arg->req),
> -		},
> -		.data.req = arg->req
> -	};
> -
> -	ret = cros_ec_cmd_xfer_status(cros_ec, &buf.msg);
> +	DEFINE_RAW_FLEX(struct cros_ec_command, msg, data,
> +			sizeof(union cros_ec_led_cmd_data));
> +
> +	msg->version = 1;
> +	msg->command = EC_CMD_LED_CONTROL;
> +	msg->insize  = sizeof(arg->resp);
> +	msg->outsize = sizeof(arg->req);
> +	*(struct ec_params_led_control *)msg->data = arg->req;

To be honest this looks really ugly and it's not at all obvious what is
going on. We have the utility function cros_ec_cmd() which would be the
nicer alternative. (Without having verified that it avoids the warning).
While it is slightly more expensive, I don't think it matters.
And if it does, the helper can be optimized.

(The same goes for my other cros_ec drivers)

> +
> +	ret = cros_ec_cmd_xfer_status(cros_ec, msg);
>  	if (ret < 0)
>  		return ret;
>  
> -	arg->resp = buf.data.resp;
> +	arg->resp = *(struct ec_response_led_control *)msg->data;
>  
>  	return 0;
>  }


Thomas

