Return-Path: <linux-leds+bounces-8370-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IgWGMJyGWoQwwgAu9opvQ
	(envelope-from <linux-leds+bounces-8370-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 13:04:34 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E37E460141D
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 13:04:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C51E30578D9
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 11:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3904E3CF671;
	Fri, 29 May 2026 11:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="EBTl19xW"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622BD3CDBB4
	for <linux-leds@vger.kernel.org>; Fri, 29 May 2026 11:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780052422; cv=none; b=GE80BP7T5IZiRXfqRcKq9PJNCnefSkCdtUZwAeiac0awSThX6XTe3JPsMxlL5i+9ZICKG5LImd1L3hlCOiJlbrMp0Jv0qyrOhdi6Vy3RC+6aWSDrR4jGGNIv/J1ics66OVWdOjSzJ4h7TYRZuH73tsZu8vAtEWZWYTwwv3tdHFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780052422; c=relaxed/simple;
	bh=6hUd2Dp3mbUUsH0uJSobaZD75vru4SnrNxnw5Brg8sQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kwxoXnXrnhGqkkHqNeWXUsMPd7/+FqAbFjcjtsMChLuAdhi8xDbkE9o4fwNxbIa2rQoicm+pXUZZoziGVusZQ0bTvRZpi5RmkdlETgCYnBQw0STAfoMm/XZf/mKxtRElHiNiApwwoFy1EQ/wKVChGjrNAjreyex7UnOfpMNEtSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=EBTl19xW; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45ef372c58aso252919f8f.0
        for <linux-leds@vger.kernel.org>; Fri, 29 May 2026 04:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780052417; x=1780657217; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=18we3XaF38yQ3wAMs5IOP6Gxb6jY92eB45OuWFEEzvE=;
        b=EBTl19xWHiPWCO7Nczi0mwTNG6EQHjljhLEWvLhlgFCHXAGByJCxzkfO1ZY2HoVauu
         DHjoLRpG30HBnJjGsufGCVx7ovs09PcOQAmjy2inMDQf6eSetlZV2Wc/z7pqWOAOID6M
         XESmr+oqX2g32vSRhprYdCAliIEucCsN4RTemaK4l8icZcWDHpQgjcvlYjynJtLRL5vL
         8zmuIxUMy5uvcsatLW1qQaW6ydbP7winGOMB1M+7P2hL06SzRPkOLX7aDugyB9RTwQd7
         2I3kBTAb+lod36BoDU7xXXSN3LiM+KvFekOYgljs+DSvVqQP+xB6VdNevjAQhMgK8zkA
         TNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780052417; x=1780657217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=18we3XaF38yQ3wAMs5IOP6Gxb6jY92eB45OuWFEEzvE=;
        b=lzMh9XeC+Um4cmk653bGATXfhZMPLDWqsWMjb3l7Btdzc2VSm5VofeozMgV4JhVSJ4
         Cwq+Rcg1Ikdt5qmq3gkl1fWp1fDFK5TB99+c/1kdBau03Oe0czgn4lr8X0Z2XXSuf2JO
         JhyAaqr2eeWLhzgwMO5IeNe0fAFHErbPwVCWHJvnHOVQYtYMQpG1ub8omqC0sb1w1/Bn
         GIUSIATg0EeYhgjmvVrLrj5Yz76lN+voc+zDAin9fsrYyh+S5mK68XmbIfo0DGleBOGq
         O2ACe64seAj/qGIQmiDB1jIJnzmnoG/UALJoVlqnvs4rF8G4vfzMZkwzVMEZ5xfGBXFY
         F+zQ==
X-Forwarded-Encrypted: i=1; AFNElJ8pNafOYdDs3onqqiSuZ4RaEEaBsY63jl2hHXcQSx2r2Ggk1Z3B8Vq4N5qke2EoA9o7ylPC52YHDz9b@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1WDFIzuy/c3QJiisJGsoM4tC7AkjjhqLif0pprDGnaK/BgH2d
	ogYVxSGbSZTgytQRKTdM7ddhWORfC0SSAtAQELlzSAl0N1XUaZefmGH6k3NpP9i6Il0=
X-Gm-Gg: Acq92OF4axNevAOMYZpi69tG/JtheC880zSnpNyyXjyW4W+6UCn1iMZo6iYRAfYmUpZ
	D4I4LSSdIBYixksM3p9FiC5q0ACDu47lEiFyNddQkxWJpklsxqoUKyJZX111MIoxUDFf5ZBGzES
	0gxr66HMon+BUpq5gcLDRvKajw6CRJxmIwyEHH32j6fd9BWJ3JAHK9FgSOWS0pzVtjAwS3iovPj
	TexPGTevgXfzj3PGigcStgLTt6gXrt9wCk5+2xo0cA45hZ28QqymibqIaLVMn85EEu3/eoXx/a+
	PsMERnQYnbBoyzHIWJTU/CSyUxYjFD0VR7TlBPTuE/FamC8A3tNpqwKvWRA4mP7dcfVnhV+Rycy
	aAEvgRBTSF7tkZt/5AwvGU9qzN5xbZFopgEOJjB3OkOF7W2B9YC8uRFekaFmAzZntY3EeDeOIQK
	29usd+bcTF5xxrwHPvBw5yVLDxHAxiWlMw9WsJjrvdkrhYvJGKCaWoBKUrJj5v8dJ3gpjSb0oc4
	XwkAN3eGa1rK5xrOD/wpmRba4JDr9SUftQkkBblE68SYCUrGL4FlqIOC1WKlAPRUnFQiiMTloNc
	PvxXQu3t2gG0/S76nHeKG9/TmaZ9uQ==
X-Received: by 2002:a05:600c:630f:b0:490:845d:652d with SMTP id 5b1f17b1804b1-4909c0ba3dbmr44464495e9.15.1780052415386;
        Fri, 29 May 2026 04:00:15 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6975e2sm49548585e9.6.2026.05.29.04.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 04:00:15 -0700 (PDT)
Date: Fri, 29 May 2026 12:00:12 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>,
	Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 2/6] mfd: lm3533: Convert to use OF bindings
Message-ID: <ahlxvGRVFDFrTUN3@aspen.lan>
References: <20260528135123.103745-1-clamor95@gmail.com>
 <20260528135123.103745-3-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528135123.103745-3-clamor95@gmail.com>
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8370-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@riscstar.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aspen.lan:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,riscstar-com.20251104.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: E37E460141D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 04:51:19PM +0300, Svyatoslav Ryhel wrote:
> Since there are no users of this driver via platform data, remove the
> platform data support and switch to using Device Tree bindings.
> Additionally, optimize functions used only by platform data.

The last sentence is a little vague and makes us have to hunt for the
changes in a relatively large patch. If it is referring to the change to
common up the init and update code then it's would better to say that
explicitly!

> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/iio/light/lm3533-als.c      |  95 ++++------
>  drivers/leds/leds-lm3533.c          |  51 ++++--
>  drivers/mfd/lm3533-core.c           | 268 ++++++++++------------------
>  drivers/video/backlight/lm3533_bl.c |  52 ++++--
>  include/linux/mfd/lm3533.h          |  51 +-----

Just one comment for backlight, below:

> diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backlight/lm3533_bl.c
> index babfd3ceec86..42da652df58d 100644
> --- a/drivers/video/backlight/lm3533_bl.c
> +++ b/drivers/video/backlight/lm3533_bl.c
> @@ -295,13 +293,20 @@ static int lm3533_bl_probe(struct platform_device *pdev)
>  	bl->cb.id = lm3533_bl_get_ctrlbank_id(bl);
>  	bl->cb.dev = NULL;			/* until registered */
>
> +	name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-%d",
> +			      pdev->name, pdev->id);
> +	if (!name)
> +		return -ENOMEM;
> +
>  	memset(&props, 0, sizeof(props));
>  	props.type = BACKLIGHT_RAW;
>  	props.max_brightness = LM3533_BL_MAX_BRIGHTNESS;
> -	props.brightness = pdata->default_brightness;

Given the big changes to the driver is there any chance of putting a
good value in props.scale (BACKLIGHT_SCALE_LINEAR or
BACKLIGHT_SCALE_NON_LINEAR)?

If the difference between 50% and 100% *looks* like 50% then the scale is
non-linear (since humn perception of brightness is not linear).


Daniel.

