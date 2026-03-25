Return-Path: <linux-leds+bounces-7487-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QByiLqEMxGk+vgQAu9opvQ
	(envelope-from <linux-leds+bounces-7487-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 17:26:09 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FDA328F3A
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 17:26:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3668E302EE99
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 16:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A0643ED13E;
	Wed, 25 Mar 2026 16:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RdXWeoRS"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E373EC2C4
	for <linux-leds@vger.kernel.org>; Wed, 25 Mar 2026 16:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774454842; cv=none; b=i6sl2avS5l/hBwnpteV9E4e9ynmn2sWEN4OhjQmdOyetD/wBBXEs+ltmBGO5zbmmtN4uWnFzORkRJzGmP0ccwXMOhSnoEk0K6+JpnoerTKAAcsgTxC39LEMPi/Zh4KIJdr9/Xx2Otl3f/CR2rqP3YD4GbtgUWBXypwbyRn4YVHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774454842; c=relaxed/simple;
	bh=tRVrH/eGDZEhc94hquI9wdhTHVXSKZmcQeHkA08w/O0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T4VAuQr0YXf014kAahhKTcGleyXMClLsIUSTgpNwDPt+oS+1pzlukk8v6J2nF3MDlt1j1Hv0A5zLW2t2TCTkpX6aKi+FPnKmkR2iKXUdvGVlX4ZRcH5NJCEjCX4m63aIkvdJUubWZq39ehIVgLFT2RykYMoYH2D7Yuq50SCGPvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RdXWeoRS; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-128e4d0cc48so6228756c88.1
        for <linux-leds@vger.kernel.org>; Wed, 25 Mar 2026 09:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774454838; x=1775059638; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gdshhwa9bhbiHCrsGjvqNNH3T3tMDqvKfcfLW4vvxN0=;
        b=RdXWeoRSj0I0QWvzPyHjUsSxxU73FQb65n8ZMVMWrlQ058HMJ1jXsPdgCz/wy546YV
         yexgXKVuBRxN+LnvjZBcCSdIZ8hYL4GBBUJsC7rNNMS/vwIWGYuS7MpICH0hVxc6BrU5
         OHZSmFxy32gIg55WMh3o8AgmWN9+N5UK4C1hLdG1ZzVGD7b5XcsuLg1zChPO6fqwlUo+
         NQrMVmnUUTMF2z6Y9CwV+M0K1qmte64CrhN6RP33x43OgwhRdpQTXzYpaOfGuqiD48Vo
         xlF9zy4/idu8IMkWxCVVKSK1WV15eQ0juAxQwS9/ZjCKJeH70gZWCe/bThxpuI3Z7WOl
         2hFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774454838; x=1775059638;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gdshhwa9bhbiHCrsGjvqNNH3T3tMDqvKfcfLW4vvxN0=;
        b=JDn9wL836q2ni+vswIeVNcBz1J1+hz519dgX+aZvgerAycLlerFyGoKQOrtMrzvzdT
         fFj3IXqK94PmjCP323INl/HOlsUqlksD1aklq5IM0GUNkqOqOKEIsv+SGmNuq1Myfw3n
         pILUbB+LGiq1c+483rKVvlEUzIF0WChTVeNwXB29VMatHz+LuyiJyJkpOoF+LQEZL4YD
         eJbukmUcyenaUnXA2O2nPmht8FbrMXA3gYVFg8mWMkSC3NsFyXUNrek5Z7pOm+oeEoJa
         EU0m50aVVVoodBSs5aTW36R+pkweVEAQEVXatHn02JhALSvqM7gXjfpm26Zj3hD79VLX
         LsYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbX/LrzY2xIZbsViUgMU4vnfGAIipVaDcNfqSI6nQWVpgH9jJRVWrTw4O2no0BHNnEpNDcJeQmuD48@vger.kernel.org
X-Gm-Message-State: AOJu0YzrXWuwWsu8wm+8ZBqzIFh5lA/hLUSWe7sPjX2DyoP5MSWqItt2
	C3LI3tCVVK5+tR50rGnlnORCqQDFYGAb6bO9v6oH8k28+CSAVEnxzLMh
X-Gm-Gg: ATEYQzyRvot0iMbtMZCMa56FWG73OiU1vXJjHBGuGNeo3tuJ0DEOkx2l7ePdbPmDgQ7
	+bycUFb9ryg4jnDXy18Y37UJVTznnANmYkfxQ8vfc7kT3BLm2tRaV0COCsL8s1ajUocejEBr6+g
	JH8zT1KtMxmHye302In8g34lF6T61irYnPZiSN9eqD0BEG9cTuTZ8T9kK8GSPMhvSdrKIo8N/e4
	kwuM8bzDfhQZqr0BKuR+WVz37vzlwEQ30lH5gAJ/Y8diPjDXgLO3jXK/vrB88hi26JjXq04X18q
	SIVzYtW4OWrTHJ1Ra/z+eWWE8GMtFIa6hI6NMS3rgbhihjYX2Y8Cy9Rm4IqjOt0huyd5y6C9+8C
	hKtiZ6KigLYn7u4dvtvwP8XAgFlgNeX2BKbkfKs1mihTqhlhkg8GZkMGob54EX0JhC+Jxo2iJ6L
	55irltnJlwfmdmAimxLpCOkhlImgI3HUTP6FWD0UiqwtnmGAH5bDrpSrXId8wqRXmvc3T6rJpJi
	BU=
X-Received: by 2002:a05:7022:618f:b0:12a:6a64:81ef with SMTP id a92af1059eb24-12a96e48c61mr2414431c88.9.1774454838367;
        Wed, 25 Mar 2026 09:07:18 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:b7b4:352d:eb23:66e5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12aa7827e02sm229615c88.12.2026.03.25.09.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 09:07:17 -0700 (PDT)
Date: Wed, 25 Mar 2026 09:07:14 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Fall back to using software node name as LED name
Message-ID: <acQGdOXRRnfVUxmD@google.com>
References: <20260311-led-swnode-name-v1-0-798a49e041c6@gmail.com>
 <20260325133836.GB1141718@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325133836.GB1141718@google.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7487-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-leds@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 24FDA328F3A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 01:38:36PM +0000, Lee Jones wrote:
> On Wed, 11 Mar 2026, Dmitry Torokhov wrote:
> 
> > This allows setting just name in software node representing an LED
> > instance and forego "label" or other properties needed to form a name.
> > This is helpful when converting old boards using bespoke platform data
> > to software nodes/static device properties.
> > 
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> > Dmitry Torokhov (2):
> >       leds: core: implement fallback to software node name for LED names
> >       leds: core: fix formatting issues
> > 
> >  drivers/leds/led-core.c | 20 +++++++++++---------
> >  1 file changed, 11 insertions(+), 9 deletions(-)
> > ---
> > base-commit: 7109a2155340cc7b21f27e832ece6df03592f2e8
> > change-id: 20260311-led-swnode-name-6db2e5757071
> 
> I'm happy with the set, but it failed to apply to leds-next.
> 
> diff a/drivers/leds/led-core.c b/drivers/leds/led-core.c        (rejected hunks)
> @@ -584,8 +582,9 @@ int led_compose_name(struct device *dev, struct led_init_data *init_data,
>         } else if (is_software_node(fwnode)) {
>                 n = snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s",
>                              fwnode_get_name(fwnode));
> -       } else
> +       } else {
>                 return -EINVAL;
> +       }
>  
>         if (n >= LED_MAX_NAME_SIZE)
>                 return -E2BIG;
> 
> Please rebase and [RESEND].

Do you have something that is not yet pushed out? I see "for-leds-next"
updated 6 days ago and the rest of branches even older. I tried rebasing
on top of next-20260324 (latest) and there were no changes...

Thanks.

-- 
Dmitry

