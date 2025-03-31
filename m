Return-Path: <linux-leds+bounces-4386-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 799BFA76CB8
	for <lists+linux-leds@lfdr.de>; Mon, 31 Mar 2025 20:01:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC0863AA34C
	for <lists+linux-leds@lfdr.de>; Mon, 31 Mar 2025 18:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D7FC213E81;
	Mon, 31 Mar 2025 18:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="a9o8ApWJ"
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D994F7080D;
	Mon, 31 Mar 2025 18:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743444107; cv=none; b=sbufu5xYvAG8bW7oBLzAwLm6aMbVrZwjlDBkBYOJ26rjMcgAKTEb+VAD9NmhsY52ToqbwhZhPWlrfzAaTrNAAEmja455Ig7IanDB3k3xBlrDxYJteoRmcymlHi3V+rxWc2j6vsjQSs/c1v+hgBYz/cp0U+GsQGFbunVLd1+y+L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743444107; c=relaxed/simple;
	bh=zvDInRbFEN6KQ8/MFQ0ALoZEWs6xzOdfkCHOclbbDBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XTSyMipyHYj1WwUYYzDqyfxF7TXIaCuuWnurFKQzn8FLnNPABy9NueRa7P/aoIDIyNVfHQp8tZNntKftIy+nZ1u0jrS+QU+IW02PbL1FarYXsP0cQn3156b5VHWtTqEAl2+NZNThgtehlW+3oystU+m4NyulXXQFU2QGgzBmM7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=a9o8ApWJ; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1743444094;
	bh=zvDInRbFEN6KQ8/MFQ0ALoZEWs6xzOdfkCHOclbbDBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a9o8ApWJCwFDL5UteIBdhOmzt9P2DYrv3IP0tKihN8Z9m/qFI5Zp1ML4VCnvgmx6c
	 zL1RyBDmO52T//7kZh4CWSGTt8cyCOBstlMfVt//6E7jiv2CO/YP5k2lBrzW2pRfI1
	 p+egAHy7wWQCw9MZX4BTgJ2OhMPO4zK7VKX2/tQk=
Date: Mon, 31 Mar 2025 20:01:34 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@weissschuh.net>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, linux-leds@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2][next] leds: Avoid -Wflex-array-member-not-at-end
 warning
Message-ID: <56eed4c9-7fd1-4cc2-8198-9aa361c02b8a@t-8ch.de>
References: <Z-rKcgFjsyKvd58q@kspp>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z-rKcgFjsyKvd58q@kspp>

On 2025-03-31 11:01:38-0600, Gustavo A. R. Silva wrote:
> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
> getting ready to enable it, globally.
> 
> Replace an on-stack definition of a flexible structure with a call
> to utility function cros_ec_cmd().
> 
> So, with these changes, fix the following warning:
> 
> drivers/leds/leds-cros_ec.c:70:40: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks!

Acked-by: Thomas Weißschuh <linux@weissschuh.net>

> ---
> Changes in v2:
>  - Use utility function cros_ec_cmd() instead of DEFINE_RAW_FLEX(). (Thomas Weißschuh)
> 
> v1:
>  - Link: https://lore.kernel.org/linux-hardening/Z-azMlPnP7nPPJrY@kspp/
> 
>  drivers/leds/leds-cros_ec.c | 21 ++++-----------------
>  1 file changed, 4 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/leds/leds-cros_ec.c b/drivers/leds/leds-cros_ec.c
> index 275522b81ea5..377cf04e202a 100644
> --- a/drivers/leds/leds-cros_ec.c
> +++ b/drivers/leds/leds-cros_ec.c
> @@ -60,31 +60,18 @@ static inline struct cros_ec_led_priv *cros_ec_led_cdev_to_priv(struct led_class
>  union cros_ec_led_cmd_data {
>  	struct ec_params_led_control req;
>  	struct ec_response_led_control resp;
> -} __packed;
> +};
>  
>  static int cros_ec_led_send_cmd(struct cros_ec_device *cros_ec,
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
> +
> +	ret = cros_ec_cmd(cros_ec, 1, EC_CMD_LED_CONTROL, &arg->req,
> +			  sizeof(arg->req), &arg->resp, sizeof(arg->resp));
>  	if (ret < 0)
>  		return ret;
>  
> -	arg->resp = buf.data.resp;
> -
>  	return 0;
>  }
>  
> -- 
> 2.43.0
> 

