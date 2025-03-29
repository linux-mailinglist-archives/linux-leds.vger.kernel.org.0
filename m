Return-Path: <linux-leds+bounces-4379-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABC6A75572
	for <lists+linux-leds@lfdr.de>; Sat, 29 Mar 2025 10:32:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 296DD3AC4A7
	for <lists+linux-leds@lfdr.de>; Sat, 29 Mar 2025 09:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CDF619B3CB;
	Sat, 29 Mar 2025 09:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="uNkBsUA+"
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD42C29A5;
	Sat, 29 Mar 2025 09:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743240774; cv=none; b=S6N5rZ1CPdlyhmrJ9DTliN+6+cqpSImgjzdyjV4NrLaR4TSEFrbLb5skJChIGkABAZ0u2vaAw06AFDuPUxU2YapR0/fT4LDQL6gbtAhHs44tNnnWRjt+5w6omVAmw8EP9AcSToJWbFUOfWM9Zz41pzHmXLa44QA+jG1GkYIyaf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743240774; c=relaxed/simple;
	bh=ZJjvROGS/24EpS2gWXnFgSM/as3FtoBA8H2h2u4PQl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GR2fgDfTPT2jGONY0HMfpBRxsNrWpJCRGXStNV+PAeP7RPzOMYSI40sv0dOqurtrQLYPHDqPMssfQCLSK0LICl5EcHKEJl6ERky9oJDt2eM299Wi13tX4+P2HrKnnzkqMRcjH/vkKNDUAU2HCK88ICB02VabqjDJiuQjKSnNXPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=uNkBsUA+; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1743240767;
	bh=ZJjvROGS/24EpS2gWXnFgSM/as3FtoBA8H2h2u4PQl4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uNkBsUA+j8q3ZhYDeHyV6x5VqYHT1X4tqiBFvlC2BhtOYn+sdKSRAaOuvr72ZYIse
	 Ehl+sD6OtBpig8oKqPcNXOQvaGzhNxH4kWrtBUDwpxUaTz8M97MK1UmXbEXtLzeR26
	 /MHJCXx/XnlbDZ9uPxymMsvmgp9JX7Ehq1i4aquc=
Date: Sat, 29 Mar 2025 10:32:46 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@weissschuh.net>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, linux-leds@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] leds: Avoid -Wflex-array-member-not-at-end warning
Message-ID: <c5e292a2-927f-472b-a805-e70003319edd@t-8ch.de>
References: <Z-azMlPnP7nPPJrY@kspp>
 <c051fd45-7eb0-465d-9e97-af294c453755@t-8ch.de>
 <9a0401f3-fa85-4308-a022-c4205fd7b50f@embeddedor.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9a0401f3-fa85-4308-a022-c4205fd7b50f@embeddedor.com>

Hi!

On 2025-03-28 12:51:02-0600, Gustavo A. R. Silva wrote:
> On 28/03/25 12:31, Thomas Weißschuh wrote:
> > On 2025-03-28 08:33:22-0600, Gustavo A. R. Silva wrote:
> > > -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
> > > getting ready to enable it, globally.
> > > 
> > > Use the `DEFINE_RAW_FLEX()` helper for an on-stack definition of
> > > a flexible structure where the size of the flexible-array member
> > > is known at compile-time, and refactor the rest of the code,
> > > accordingly.
> > > 
> > > So, with these changes, fix the following warning:
> > > 
> > > drivers/leds/leds-cros_ec.c:70:40: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> > > 
> > > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> > > ---
> > >   drivers/leds/leds-cros_ec.c | 26 +++++++++++---------------
> > >   1 file changed, 11 insertions(+), 15 deletions(-)
> > > 
> > > diff --git a/drivers/leds/leds-cros_ec.c b/drivers/leds/leds-cros_ec.c
> > > index 275522b81ea5..6eab0474f52d 100644
> > > --- a/drivers/leds/leds-cros_ec.c
> > > +++ b/drivers/leds/leds-cros_ec.c
> > > @@ -66,24 +66,20 @@ static int cros_ec_led_send_cmd(struct cros_ec_device *cros_ec,
> > >   				union cros_ec_led_cmd_data *arg)
> > >   {
> > >   	int ret;
> > > -	struct {
> > > -		struct cros_ec_command msg;
> > > -		union cros_ec_led_cmd_data data;
> > > -	} __packed buf = {
> > > -		.msg = {
> > > -			.version = 1,
> > > -			.command = EC_CMD_LED_CONTROL,
> > > -			.insize  = sizeof(arg->resp),
> > > -			.outsize = sizeof(arg->req),
> > > -		},
> > > -		.data.req = arg->req
> > > -	};
> > > -
> > > -	ret = cros_ec_cmd_xfer_status(cros_ec, &buf.msg);
> > > +	DEFINE_RAW_FLEX(struct cros_ec_command, msg, data,
> > > +			sizeof(union cros_ec_led_cmd_data));
> > > +
> > > +	msg->version = 1;
> > > +	msg->command = EC_CMD_LED_CONTROL;
> > > +	msg->insize  = sizeof(arg->resp);
> > > +	msg->outsize = sizeof(arg->req);
> > > +	*(struct ec_params_led_control *)msg->data = arg->req;
> > 
> > To be honest this looks really ugly and it's not at all obvious what is
> 
> We can do something like this, instead:
> 
> diff --git a/drivers/leds/leds-cros_ec.c b/drivers/leds/leds-cros_ec.c
> index 275522b81ea5..c7235f4e577b 100644
> --- a/drivers/leds/leds-cros_ec.c
> +++ b/drivers/leds/leds-cros_ec.c
> @@ -66,24 +66,24 @@ static int cros_ec_led_send_cmd(struct cros_ec_device *cros_ec,
>                                 union cros_ec_led_cmd_data *arg)
>  {
>         int ret;
> -       struct {
> -               struct cros_ec_command msg;
> -               union cros_ec_led_cmd_data data;
> -       } __packed buf = {
> -               .msg = {
> -                       .version = 1,
> -                       .command = EC_CMD_LED_CONTROL,
> -                       .insize  = sizeof(arg->resp),
> -                       .outsize = sizeof(arg->req),
> -               },
> -               .data.req = arg->req
> -       };
> -
> -       ret = cros_ec_cmd_xfer_status(cros_ec, &buf.msg);
> +       DEFINE_RAW_FLEX(struct cros_ec_command, msg, data,
> +                       sizeof(union cros_ec_led_cmd_data));
> +       struct ec_params_led_control *req =
> +                               (struct ec_params_led_control *)msg->data;
> +       struct ec_response_led_control *resp =
> +                               (struct ec_response_led_control *)msg->data;
> +
> +       msg->version = 1;
> +       msg->command = EC_CMD_LED_CONTROL;
> +       msg->insize  = sizeof(arg->resp);
> +       msg->outsize = sizeof(arg->req);
> +       *req = arg->req;
> +
> +       ret = cros_ec_cmd_xfer_status(cros_ec, msg);
>         if (ret < 0)
>                 return ret;
> 
> -       arg->resp = buf.data.resp;
> +       arg->resp = *resp;
> 
>         return 0;
>  }

My issue was with the general usage of DEFINE_RAW_FLEX(), the reply was
placed badly. For somebody not knowing this construct it's not clear
what is happening under the hood.
It's probably fine in a regular header file with some explanation,
but in a random driver it looks off.

The following is what I had in mind. Now actually tested.

--- a/drivers/leds/leds-cros_ec.c
+++ b/drivers/leds/leds-cros_ec.c
@@ -60,31 +60,18 @@ static inline struct cros_ec_led_priv *cros_ec_led_cdev_to_priv(struct led_class
 union cros_ec_led_cmd_data {
        struct ec_params_led_control req;
        struct ec_response_led_control resp;
-} __packed;
+};

 static int cros_ec_led_send_cmd(struct cros_ec_device *cros_ec,
                                union cros_ec_led_cmd_data *arg)
 {
        int ret;
-       struct {
-               struct cros_ec_command msg;
-               union cros_ec_led_cmd_data data;
-       } __packed buf = {
-               .msg = {
-                       .version = 1,
-                       .command = EC_CMD_LED_CONTROL,
-                       .insize  = sizeof(arg->resp),
-                       .outsize = sizeof(arg->req),
-               },
-               .data.req = arg->req
-       };
-
-       ret = cros_ec_cmd_xfer_status(cros_ec, &buf.msg);
+
+       ret = cros_ec_cmd(cros_ec, 1, EC_CMD_LED_CONTROL,
+                         &arg->req, sizeof(arg->req), &arg->resp, sizeof(arg->resp));
        if (ret < 0)
                return ret;

-       arg->resp = buf.data.resp;
-
        return 0;
 }


> 
> as in other cases:
> 
> https://lore.kernel.org/linux-hardening/Z-a4meHAy-t58bcE@kspp/
> 
> -Gustavo
> 
> > going on. We have the utility function cros_ec_cmd() which would be the
> > nicer alternative. (Without having verified that it avoids the warning).
> > While it is slightly more expensive, I don't think it matters.
> > And if it does, the helper can be optimized.
> > 
> > (The same goes for my other cros_ec drivers)
> > 
> > > +
> > > +	ret = cros_ec_cmd_xfer_status(cros_ec, msg);
> > >   	if (ret < 0)
> > >   		return ret;
> > > -	arg->resp = buf.data.resp;
> > > +	arg->resp = *(struct ec_response_led_control *)msg->data;
> > >   	return 0;
> > >   }


Thomas

