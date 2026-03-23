Return-Path: <linux-leds+bounces-7456-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMkBAFi/wWlSWAQAu9opvQ
	(envelope-from <linux-leds+bounces-7456-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 23:31:52 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 582362FE456
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 23:31:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B8E630715E1
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 22:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D9A4382F20;
	Mon, 23 Mar 2026 22:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KXwiLEqp"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB92379991
	for <linux-leds@vger.kernel.org>; Mon, 23 Mar 2026 22:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774304877; cv=none; b=S/343wUu2CK95kx+fN52Q51NjgBE0YIZFLtAcKe9ZE/clZNiosuZoxNeNlWC0aDdBKE1GJ6uLsgDolDDPGEPqmfRL7mSXD2CnMzSe0XqH5sgTSzU/YFJQwVqS84Ij5C9qIqdUZ6iwCEkrgWWOAGescq4dytWT3EouyX5QgDe8LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774304877; c=relaxed/simple;
	bh=t3DRPPEFmGvn6CLbNxf/rnOA0bdk4BEKupzcqZRYTk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eK5uofQ77LLclifxCz2ljTjBkMQGIGEV091MM0AIu5aNO3BTkxYuESf2bE9DZgCLp2vj6t7paFGxn2hvFEwzs2AUDbzw6azZ55kVm32r+TXvLj/T4emX8vuWkKWS2Oxy3nW+iIKPWGhhPi9y7mQAoD2J1tI0zXlEspoPHW1C6gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KXwiLEqp; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so894750eec.1
        for <linux-leds@vger.kernel.org>; Mon, 23 Mar 2026 15:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774304875; x=1774909675; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OEJ8II5Mq/xurnYxGbenRnl9vYWDBkm+Mx+1ug12uRY=;
        b=KXwiLEqppMPL+0YiNEsTHlixOZ4HNETs2No9NvHXpOtYnk7u0a/FWbqsWbAL4EdFRB
         EYbvEcKYUtiKXjm3Z+Tpxius3qtVX41SlPiWXYoCmym1raFmzmkCHknW8vBAbwZ5CRl7
         X+OPFsH7si8sMvPhn5GGOoKn7wNv7bfJrwLbQx1AJrKzmoZoJc2jS4MbIFLORjQMmwXC
         OfDZUb0oBi8CdWtyFhsDs2W0baJ8WAh0oYlc+detsjuOOK4n2tV78JyL6a42IM+rhS89
         WGUurGG/WsRiCRZ7BIyWzGN/CPqMov7HvLi3dKSqO/clWHOAmiPnH52DSPD0FinqBE4J
         Qk7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774304875; x=1774909675;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OEJ8II5Mq/xurnYxGbenRnl9vYWDBkm+Mx+1ug12uRY=;
        b=WJs+InCi84YTtKnqTnKHvrK3RsqMwaP6ZPyPGdKbQYJS5K5DDI/dlNgz3lIoxsELLd
         ATSHWkc8eZFPf4U+PxIPhHFNYpyei6nxd256DlVNsGy1EgV3rImGhaHc8iElsTuiUAcA
         M6wnDa4j3ElhngrBOYmHUz06sLOi8+ExeAJxjigVCNNyXK6wHivQGZ+Wzv5Ly8fRWrd9
         /djlM9ukATdQd5x84hZI+0uj8Aw3YOIEHRmDi6JR/Oa6SxKEvwPV5GYQbTb3P+BY1ZsP
         5zwNjZC5jSGQRnhzPwrpkJJ2kho9Hm1PbLLyTOv0bqCiMP/0jRGcRtJWkX2rsem6Mzrj
         3iwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEuyKgZon1pF7lXB5+TArGxx8FR5nNqz1InxZlY5ScP1ASAwJxbOd5gsaU+Q9kW3PNkzGcOoxwXWVL@vger.kernel.org
X-Gm-Message-State: AOJu0YxTkqs+1zCDx/jGUPCKJyLmgn7wDeU5OQz9f9q1PfgjMD8McCM7
	s56GblH8VpdaZ9raDmRpWePwOhySWnEfhwIavtizYYeRao8X6vopoNMr
X-Gm-Gg: ATEYQzyiVejQKAhiPs4k/lTOlOgjoVnJ3SJ1nCnsD5HkslFVBtoDGjjd1z7mgbnKN1g
	1VQ/bZfPGEkpMbaqR4dUvcsra3f36kCFPyxOEfZdQhgPI7IBGZXGqNCrkRcvb4ZH7oRSbK6l8fL
	mEBrLFZfE4ndfdKbq4SGxNSjxnZBWVa47HfrWfkM89HuNE7dUpDMrSoDjcSFOlxrPIlLX7mbf+j
	o2unEybxi4uYghxISW4dBDxqoTV/0olkG484KJQ8q/g/vWLKz6CdV0gY93IE+qXJIJ6J2Vvs0qU
	vgPHPPJAEmYns512BXck/HRR96fKsSObNqihQLoMrzsfwNBrME8iOHBtcsmM6KAhaWufQiqS1yn
	JUCmj6ALHHVmNS+9ptmWGzFnUHEVUevyUPRQRvw3DtXVJlQMdTf66Y31kstMUE5cjmpzCeTsKsv
	zPs33bKEpmN3Og/zBZSWY1z+F5tNPrP/lHSPnIlQAwxOTc34eEi+nEgvrRg5pvVHyj
X-Received: by 2002:a05:7301:4198:b0:2c0:c775:a46b with SMTP id 5a478bee46e88-2c10961ef1bmr7002696eec.8.1774304874980;
        Mon, 23 Mar 2026 15:27:54 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:a296:1211:5ab0:bc95])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b2cf068sm13226951eec.22.2026.03.23.15.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 15:27:53 -0700 (PDT)
Date: Mon, 23 Mar 2026 15:27:50 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Mark Brown <broonie@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Peter Rosin <peda@axentia.se>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-spi@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-fpga@vger.kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH 04/10] regulator: of: switch to using
 class_find_device_by_fwnode()
Message-ID: <acG9BPkFr_De-ulu@google.com>
References: <20260322-remove-device-find-by-of-node-v1-0-b72eb22a1215@gmail.com>
 <20260322-remove-device-find-by-of-node-v1-4-b72eb22a1215@gmail.com>
 <360a8b4a-6507-417a-9fc1-c53b14868657@sirena.org.uk>
 <acGFksyx3SA0kJ5b@google.com>
 <7d46803e-b285-4e9c-8856-10100fa0ea85@sirena.org.uk>
 <cf92122d-6b15-458a-bf89-189a0a6874f7@lunn.ch>
 <193e194a-498f-464f-b22c-c283c16db6c1@sirena.org.uk>
 <acGzJV3vKhuty3nd@google.com>
 <09072374-65e7-4792-af7e-97d7df93f9bd@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09072374-65e7-4792-af7e-97d7df93f9bd@lunn.ch>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7456-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,gmail.com,axentia.se,armlinux.org.uk,intel.com,linuxfoundation.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[28];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 582362FE456
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 11:11:58PM +0100, Andrew Lunn wrote:
> On Mon, Mar 23, 2026 at 02:41:03PM -0700, Dmitry Torokhov wrote:
> > On Mon, Mar 23, 2026 at 09:36:07PM +0000, Mark Brown wrote:
> > > On Mon, Mar 23, 2026 at 09:01:47PM +0100, Andrew Lunn wrote:
> > > 
> > > > How do you handle deprecated OF properties? This is a problem i've run
> > > > into before. A developer needs an ACPI binding, so they blindly
> > > > convert from of_ to device_ without engaging brain. As a result, they
> > > > bring all the deprecated OF properties we want to die into the brand
> > > > new ACPI bindings.
> > > 
> > > Honestly that one hasn't really come up much for me - not too many
> > > deprecated properties.
> > 
> > Given that we position properties as an ABI even if they are deprecated
> > we supposed to handle them forever. Newer properties usually offer
> > benefits over old ones and that is how users get moved over.
> 
> ~/linux/Documentation/devicetree/bindings/net$ grep -r deprecated * | wc
>      75     361    4195
> 
> So networking has ~ 75 of them.
> 
> Within the OF world, they are ABI and we need to keep them. But we
> don't want them in ACPI or any other firmware. Any code looking for
> properties needs to know what is underneath so it can decide if it
> should look for the deprecated, OF only property, or not.

If there is a deprecated property you can do:

	error = device_property_read_u32(dev, "prop", &val);
	if (error == -ENOENT)
		error = device_property_read_u32(dev, "deprecated-prop", &val);

You do not need much more than that... Checking node type only
complicates the code, especially when a device can be used on both ACPI
and DT systems.

Thanks.

-- 
Dmitry

